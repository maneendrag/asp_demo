import 'package:asp_base/_app/app.locator.dart';
import 'package:asp_base/_app/app.router.dart';
import 'package:asp_base/_services/size_config_service.dart';
import 'package:asp_base/data_model.dart';
import 'package:asp_base/hive_config.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final NavigationService navigationService = locator<NavigationService>();
  final SizeConfigService sizeConfigService = locator<SizeConfigService>();
  DataModel appLevelModel =
  HiveConfig.getSingleObject<DataModel>(HiveBox.DataModel);

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((d) {
      print("<============ Navigation Success ===========>");
     if(appLevelModel.isLoggedIn == false) {
       navigationService.pushNamedAndRemoveUntil(Routes.landingScreen);
     }
      else{
        // navigationService.pushNamedAndRemoveUntil(Routes.categoriesScreen);
        navigationService.pushNamedAndRemoveUntil(Routes.productsScreen);
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(
        "assets/logo.png",
        height: sizeConfigService.heightMultiplier * 25,
        width: sizeConfigService.heightMultiplier * 28,
      ),
    ));
  }
}
