import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

// class EditProfileScreen extends StatelessWidget {
//   const EditProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder<EditProfileViewModel>.reactive(
//       viewModelBuilder: () => EditProfileViewModel(),
//       builder: (context, model, child) {
//         return Scaffold(body: Center(
//           child: GestureDetector(
//             onTap: null,
//             child: Container(
//               height: 45,width: 124,
//               color: Colors.red,
//               child: Center(child: Text("dfklm")),),
//           ),
//         ),);
//       },
//     );
//   }
// }


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  @override
  Widget build(BuildContext context) {
    Position? position;


      // LocationPermission permission = await Geolocator.requestPermission();
      // LocationPermission permission = await Geolocator.checkPermission();
      getCurrentPosition() async {



        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        List<Placemark> placemarks = await placemarkFromCoordinates(52.2165157, 6.9437819);

        print("The current position ===========> $position");
        print("The current position ===========> ${placemarks[0]}");
        return position;


    }

    return  Scaffold(body: Center(
          child: GestureDetector(
            onTap: ()=> getCurrentPosition(),
            child: Container(
              height: 45,width: 124,
              color: Colors.red,
              child: Center(child: Text("dfklm")),),
          ),
        ),);
  }
}
