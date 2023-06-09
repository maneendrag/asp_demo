// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';

import '../_services/api_service.dart';
import '../_services/cart_service.dart';
import '../_services/connectivity_service.dart';
import '../_services/http_service.dart';
import '../_services/size_config_service.dart';
import '../_services/util_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => HttpService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => ConnectivityService());
  locator.registerLazySingleton(() => UtilsService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => SizeConfigService());
  locator.registerLazySingleton(() => CartService());
}
