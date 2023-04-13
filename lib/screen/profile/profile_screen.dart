import 'package:asp_base/screen/profile/profile_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      onViewModelReady: (model)=>model.getUserDetails(),
      viewModelBuilder: ()=> ProfileViewModel(),
      builder: (context, model, child) {
        return model.isBusy == true
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        )
            : Scaffold(
          body: Column(children:  [
            const SizedBox(
              height: 32,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Profile",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),

            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(children: [
                  Image.network("https://www.pngmart.com/files/22/User-Avatar-Profile-Transparent-Background.png",
                  height: 125, width: 125,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Name :   ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,

                        ),
                      ),
                      Text(
                        model.profileResponseList[0].userName!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,

                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      const Text(
                        "Email :   ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,

                        ),
                      ),
                      Text(
                        model.profileResponseList[0].userEmail!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,

                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Row(
                    children: [
                      const Text(
                        "Phone :   ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,

                        ),
                      ),
                      Text(
                        model.profileResponseList[0].userPhone!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,

                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        "Address :   ",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,

                        ),
                      ),
                      const SizedBox(height: 2,),
                      Text(
                        model.appLevelModel.userAddress!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,

                        ),
                      ),


                    ],
                  ),
                  const SizedBox(height: 32,),
                  Row(
                    children:  const [
                      Text(
                        "Change Address",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 32,

                        ),
                      ),



                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      model.getCurrentPosition();
                    },
                    child: Container(
                      margin:
                      const EdgeInsets.symmetric(vertical: 32),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 65, vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(28),
                          color: const Color(0xff0F4C75)),
                      child: const Center(
                        child: Text(
                          "Get Current Location",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  model.currentAddress != null ? Text('ADDRESS: ${model.currentAddress ?? ""}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,

                    ),
                  ): Container(),
                 model.currentAddress != null ? GestureDetector(
                    onTap: () {
                      model.updateUserAddress();
                    },
                    child: Container(
                      margin:
                      const EdgeInsets.symmetric(vertical: 32),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 65, vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(28),
                          color: const Color(0xff0F4C75)),
                      child: const Center(
                        child: Text(
                          "Add New Address",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ) : Container(),
                ],),
              ),
            )
          ],),
        );
      },);
  }
}
