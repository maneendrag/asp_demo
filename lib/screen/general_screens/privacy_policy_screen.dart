import 'package:asp_base/screen/general_screens/general_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GeneralViewModel>.reactive(
      onViewModelReady: (model)=>model.getGenerals(),
      viewModelBuilder: ()=> GeneralViewModel(),
      builder: (context, model, child) {
        return model.isBusy == true
            ? Center(
          child: const CircularProgressIndicator(
            color: Colors.red,
          ),
        )
            : Scaffold(
          body: Column(children:  [
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Privacy Policy",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(children: [
                  Text(
                    model.generalResponseList[0].privacyPolicy!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,

                    ),
                  ),
                ],),
              ),
            )
          ],),
        );
      },);
  }
}
