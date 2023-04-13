import 'package:asp_base/screen/general_screens/general_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

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
        body: SafeArea(
          child: Column(children:  [
           
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Terms And Conditions",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            SizedBox(height: 18,),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(children: [
                  Text(
                    model.generalResponseList[0].termsConditions!,
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
        ),
      );
    },);
  }
}
