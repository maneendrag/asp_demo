import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/app.router.dart';
import 'package:asp_base/_app/enums/app_enums.dart';
import 'package:asp_base/_services/api_service.dart';
import 'package:asp_base/_services/failure.dart';
import 'package:asp_base/data_model.dart';
import 'package:asp_base/hive_config.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../home/home_response.dart';

class LoginViewModel extends BaseViewModel {
  LoginScreenView currentView = LoginScreenView.landingScreen;
  final HttpService _httpService = locator<HttpService>();
  final SnackbarService snackbarService = locator<SnackbarService>();
  final NavigationService navigationService = locator<NavigationService>();

  //SignUp text field controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController eMailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //Login TextFields controller
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  bool passwordError = false;
  bool nameErrorText = false;

  final DataModel _appLevelModel =
      HiveConfig.getSingleObject<DataModel>(HiveBox.DataModel);

  bool validateEmail(email) {
    print("Ema---> $email");

    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern.toString());
    if (regex.hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword(password) {
    print("Ema---> $password");

    Pattern pattern =
        r'[!@#$%^&*(),.?":{}|<>]';
    RegExp regex = RegExp(pattern.toString());
    if (regex.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  Future<User?> registerUsingEmailPassword() async {
    print("Entered registerUsingEmailPassword ny view model");
    setBusy(true);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      print("Entered try ny view model");
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: eMailController.text,
        password: passwordController.text,
      );
      user = userCredential.user;
      await user!.updateDisplayName(nameController.text);
      // await user.updatePhoneNumber(phoneNumberController.text);
      await user.reload();

      user = auth.currentUser;
      print("user =======>${auth.currentUser}");


      if (auth.currentUser != null) {
        print("Entered ifn of registered user----------");

        registerUser(
            role: "User",
            userMail: auth.currentUser!.email.toString(),
            userName: auth.currentUser!.displayName.toString(),
            userPhone: phoneNumberController.text,
            firebaseID: auth.currentUser!.uid
        );

        _appLevelModel.firebaseId = auth.currentUser!.uid.toString();
        _appLevelModel.displayName = auth.currentUser!.displayName;
        _appLevelModel.userPhone = phoneNumberController.text.toString();
        _appLevelModel.isLoggedIn = true;


        await HiveConfig.putSingleObject(HiveBox.DataModel, _appLevelModel);
        // setBusy(false);
      } else {
        snackbarService.showSnackbar(message: "User Sign Up Failed");
        setBusy(false);
        notifyListeners();
      }

      // return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        snackbarService.showSnackbar(message: "The password provided is too weak");

        setBusy(false);
        notifyListeners();

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        snackbarService.showSnackbar(message: "The account already exists for that email");

        setBusy(false);
        notifyListeners();

      }
    } catch (e) {
      print("Firebase ERROR =============> $e");
      setBusy(false);
      notifyListeners();

    }
  }

  printCheck() {
    print("Check print in view model");
  }

  signUpUserWithLogin() {
    print("Entered in sign up in view model");
    if (nameController.text.isEmpty) {
      snackbarService.showSnackbar(message: "Name Text field is empty");
    } else if (eMailController.text.isEmpty ||
        validateEmail(eMailController.text) == false) {
      snackbarService.showSnackbar(message: "Please check Email Field");
    } else if (phoneNumberController.text.isEmpty ||
        phoneNumberController.text.length > 10) {
      snackbarService.showSnackbar(message: "Please check Phone Number Field");
    } else if(validatePassword(passwordController.text) == false){
      snackbarService.showSnackbar(message: "Password Should be Strong");
    }
    else if (passwordController.text.isEmpty) {
      snackbarService.showSnackbar(message: "Password Text field is empty");
    } else if (confirmPasswordController.text.isEmpty) {
      snackbarService.showSnackbar(
          message: "Confirm Password Text field is empty");
    } else if (passwordController.text != confirmPasswordController.text) {
      snackbarService.showSnackbar(message: "Please Re-enter same password");
    } else {
      print("Entered else");
      registerUsingEmailPassword();
    }
  }

  loginClicked() {
    if (loginEmailController.text.isEmpty ||
        validateEmail(loginEmailController.text) == false) {
      snackbarService.showSnackbar(message: "Check Email Text Field");
    } else if (loginPasswordController.text.isEmpty) {
      snackbarService.showSnackbar(message: "Check Password Text Field");
    } else {
      loginWithFirebase();
      // snackbarService.showSnackbar(message: "Login Failed");
    }
  }

  Future<User?> loginWithFirebase() async {
    print("Entered login");
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    setBusy(true);
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: loginEmailController.text,
          password: loginPasswordController.text);
      user = credential.user;
      if (auth.currentUser != null) {
        print("FB ID ---> ${auth.currentUser!.uid}");
        getUserId(auth.currentUser!.uid);
        print("User successful login ====> ${user!.email.toString()}");
        print("User successful login ====> ${user.displayName.toString()}");
        _appLevelModel.firebaseId = user.uid.toString();
        _appLevelModel.isLoggedIn = true;
        await HiveConfig.putSingleObject(HiveBox.DataModel, _appLevelModel);


        //navigationService.pushNamedAndRemoveUntil(Routes.productsScreen,arguments: ProductsScreenArguments(categoryName: "",isFromCategories: false));

        print(_appLevelModel.userID);

        // setBusy(false);
      } else {
        print("User unsuccessful login");
        setBusy(false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        snackbarService.showSnackbar(message: "user-not-found");
        print('No user found for that email.');
        setBusy(false);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        snackbarService.showSnackbar(
            message: "Wrong password provided for that user");

        setBusy(false);
      }
      // print("Something Went wrong!!!");
      // snackbarService.showSnackbar(message: "Something Went wrong!!!");

      setBusy(false);
    }
  }

//   fetchUserData() async {
//     setBusy(true);
//     try {
//       var doc = r'''
// query MyQuery {
//   user {
//     role
//     user_email
//     user_name
//     user_phone
//   }
// }
//
//       ''';
//
//       var response = await _httpService.query(doc);
//
//       print("Login users response data =========> $response");
//
//       // homeResponse = HomeResponse.fromJson(response as Map<String, dynamic>);
//
//       // response = homeResponse;
//       // print(
//       //     "HMResponse =========> ${response}}");
//
//       notifyListeners();
//
//       // if(response["subscription_types"] !=null){
//       //
//       //   // subscriptionTypeData = SubscriptionTypeData.fromJson(response);
//       //
//       //   response["subscription_types"].forEach((data){
//       //     subsData.add(data);
//       //   });
//       //
//       //   print("Sub data -------> $subsData");
//       //
//       //
//       // }else{
//       //   subsData.clear();
//       // }
//
//       // notifyListeners();
//
//       // // changeView(M2View.Signature_SCREEN);
//       // if(response['insert_users']['affected_rows'] > 0){
//       //   changeView(M2View.M2RegisteredSuccessfully);
//       // }
//
//       // subscriptionTypeData = response;
//
//       // print("Var data =======> $subscriptionTypeData");
//       setBusy(false);
//       return Right(response!);
//     } catch (e) {
//       setBusy(false);
//       print("Error ==========> $e");
//
//       return Left(Failure(
//           errorMessage: 'Errors => $e',
//           message: 'Error in fetching subscription hm details'));
//     }
//   }

  registerUser(
      {required String userName,
      required String userMail,
      required String userPhone,
      required String role,
      required String firebaseID,
      }) async {
    try {
      setBusy(true);
      var response = await _httpService.mutation(r'''
mutation MyMutation($user_email: String!, $user_name: String!, $role: String!, $user_phone: String!, $firebase_Id: String!) {
  insert_user(objects: {user_email: $user_email, user_name: $user_name, role: $role, user_phone: $user_phone, firebase_Id: $firebase_Id}) {
    affected_rows
  }
}
 ''', variables: {
        "role": role,
        "user_email": userMail,
        "user_name": userName,
        "user_phone": userPhone,
        "firebase_Id": firebaseID,
      });

      if (response != null) {
        // if (response['insert_user']['affected_rows'] > 0) {
        //
        //   // await HiveConfig.putSingleObject(
        //   //     HiveBox.AppLevelModel, _appLevelModel);
        //   // changeView(SyncBrokersView.PRIMARY_ACCOUNT_VIEW);
        // } else {
        //   print("user did not update");
        //   // _utilsService.showSnackBar(
        //   //   msg: "user did not update",
        //   // );
        // }

        print("object register resp ======> $response");
        print("Applevel model in register ----> ${_appLevelModel.userID}");
        getUserId(_appLevelModel.firebaseId);

        // navigationService.pushNamedAndRemoveUntil(Routes.productsScreen,arguments: ProductsScreenArguments(categoryName: "",isFromCategories: false));

        setBusy(false);
        notifyListeners();
      } else {

        print("Some thing went wrong");
        setBusy(false);
        notifyListeners();
        // _utilsService.showSnackBar(
        //   msg: "Some thing went wrong",
        // );
      }
    } catch (e) {
      setBusy(false);
      notifyListeners();
      setError(e);
    }
  }

  Future getUserId(firebaseID) async {
    setBusy(true);
    print("Entered cart method");
    try {
      var resp = await _httpService.query(getCartQuery, variables: {
        "firebase_id": firebaseID
      });

      print(resp);

      _appLevelModel.userID = resp['user'][0]['user_id'];
      await HiveConfig.putSingleObject(HiveBox.DataModel, _appLevelModel);

      print("applevel user ID ------> ${_appLevelModel.userID}");

      navigationService.pushNamedAndRemoveUntil(Routes.productsScreen,arguments: ProductsScreenArguments(categoryName: "",isFromCategories: false));

      //
      // cartResponseList = List.from(resp['cart'])
      //     .map((e) => Cart.fromJson(e))
      //     .toList();

      // for(int i=0;i<cartResponseList.length;i++){
      //   totalProductsCount += cartResponseList[i].count!;
      // }
      //
      // for(int i=0;i<cartResponseList.length;i++){
      //   totalCartPrice += (cartResponseList[i].count! * cartResponseList[i].productPrice!);
      // }

      // CartDataResponse res = CartDataResponse.fromJson({'data': resp['cart']});

      // print("RRRR ----> ${cartResponseList.length}");

      // print("Response of Cart ========> ${res.data!.length}");

      // if(res.data!.isNotEmpty){
      //   cartResponseList.addAll(res.data!);
      //   setBusy(false);
      //   print("PIN DATAARR --------> ${cartResponseList[0].productName}");
      //
      setBusy(false);
      notifyListeners();
      // }else{
      //
      //   setBusy(false);
      //
      //   notifyListeners();
      // }
    } catch (e) {
      print("ERROR ======> $e");
      setBusy(false);
    }
  }


  changeView(LoginScreenView view) {
    print("Change view tapped");
    currentView = view;
    notifyListeners();
  }

  navigateToLoginScreen() {
    changeView(LoginScreenView.loginScreen);
    notifyListeners();
  }

  navigateToLandingScreen() {
    print("NAv to lolandin screen");
    changeView(LoginScreenView.landingScreen);
    notifyListeners();
  }

  navigateToSignUpScreen() {
    print("tapped signup screen");
    changeView(LoginScreenView.signUpScreen);
    notifyListeners();
  }

  navigateToHomeScreen() {
    changeView(LoginScreenView.homeScreen);
    notifyListeners();
  }

  /*=============================================================
    <===================For Login Screen=========================>
    =============================================================*/

  bool obscureText = true;
  playLoginObscure() {
    print("Tapped Obscure");
    obscureText = !obscureText;
    notifyListeners();
  }
}

String getCartQuery = r'''query GetUserId($firebase_id: String) {
  user(where: {firebase_Id: {_eq: $firebase_id}}) {
    user_id
  }
}''';