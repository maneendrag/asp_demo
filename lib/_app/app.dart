
import 'package:asp_base/_services/cart_service.dart';
import 'package:asp_base/_services/http_service.dart';
import 'package:asp_base/_services/size_config_service.dart';
import 'package:asp_base/screen/cart/cart_screen.dart';
import 'package:asp_base/screen/categories/categories_screen.dart';
import 'package:asp_base/screen/general_screens/about_us_screen.dart';
import 'package:asp_base/screen/general_screens/privacy_policy_screen.dart';
import 'package:asp_base/screen/general_screens/terms_and_conditions_screen.dart';
import 'package:asp_base/screen/home/edit_profile/edit_profile_screen.dart';
import 'package:asp_base/screen/home/home_screen.dart';
import 'package:asp_base/screen/home/screens/product_details/product_details_screen.dart';
import 'package:asp_base/screen/home/screens/products/products_screen.dart';
import 'package:asp_base/screen/login/screens/landing_screen.dart';
import 'package:asp_base/screen/login/screens/login_screen.dart';
import 'package:asp_base/screen/login/screens/signUpScreen.dart';
import 'package:asp_base/screen/orders/add_address_screen.dart';
import 'package:asp_base/screen/orders/order_details_screen.dart';
import 'package:asp_base/screen/orders/orders_screen.dart';
import 'package:asp_base/screen/profile/profile_screen.dart';
import 'package:asp_base/screen/splash_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../_services/api_service.dart';
import '../_services/connectivity_service.dart';
import '../_services/util_service.dart';
import '../screen/orders/order_successful_screen.dart';



@StackedApp(routes:[
MaterialRoute(initial: true,page: SplashScreen),
MaterialRoute(page: LandingScreen),
MaterialRoute(page: LoginScreen),
MaterialRoute(page: SignUpScreen),
MaterialRoute(page: ProductsScreen),
MaterialRoute(page: EditProfileScreen),
MaterialRoute(page: ProductDetailsScreen),
MaterialRoute(page: CartScreen),
MaterialRoute(page: CategoriesScreen),
MaterialRoute(page: OrderSuccessScreen),
MaterialRoute(page: OrdersScreen),
MaterialRoute(page: OrderDetailsScreen),
MaterialRoute(page: TermsAndConditionsScreen),
MaterialRoute(page: ProfileScreen),
MaterialRoute(page: PrivacyPolicyScreen),
MaterialRoute(page: AboutUsScreen),
MaterialRoute(page: AddAddressScreen),

], dependencies: [
  LazySingleton(classType: HttpService),
  LazySingleton(classType: ApiService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: ConnectivityService),
  LazySingleton(classType: UtilsService),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: SizeConfigService),
  LazySingleton(classType: CartService),

]
    ,logger: StackedLogger())class Appetup {}