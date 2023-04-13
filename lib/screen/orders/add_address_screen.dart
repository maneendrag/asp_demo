import 'package:asp_base/screen/orders/add_address_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddAddressViewModel>.reactive(
      viewModelBuilder: ()=> AddAddressViewModel(),
      builder: (context,model,child) {
        return model.isBusy == true
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        )
            : Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/no_address.png", height: 200, width: 200,),
            SizedBox(height: 12,),
              const Text('No Address Found',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: GestureDetector(
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
            ),
            model.currentAddress != null ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text('ADDRESS: ${model.currentAddress ?? ""}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,

                ),
              ),
            ): Container(),
            model.currentAddress != null ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: GestureDetector(
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
              ),
            ) : Container(),


          ],),
        );
      },

    );
  }
}
