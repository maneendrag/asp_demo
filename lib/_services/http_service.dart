import 'dart:convert';

import 'package:asp_base/_app/app.locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'connectivity_service.dart';

class ApiService{

  SnackbarService snackbarService = locator<SnackbarService>();
  ConnectivityService _connection = locator<ConnectivityService>();
  static BaseOptions options = BaseOptions(
    baseUrl: "https://fakestoreapi.com/products",
    connectTimeout: 30000,
    receiveTimeout: 10000,
  );

  Dio _dio = Dio(options);
  //-------------------------------------------------------
  // -------------- API GET --------------------------
  //-------------------------------------------------------


  Future get(url) async {
    if (!await _connection.checkConnection()) return null;
    var result;
    // if (showLoading) _utils.showLoadingDialog();
    // if (showLoading) Container();
    try {
      result = await _dio.get(
        url,
        // options: Options(headers: headers ?? {}),
      );
    //   if (showLoading) Center(child: CircularProgressIndicator(color: Colors.yellow,),);
      if (result.statusCode! >= 200 || result.statusCode! < 299) {

        return result;
      }
      snackbarService.showSnackbar(message: "Error message${result.data["message"].toString()}");
      return null;
    } catch (e, s) {
      print("Catch err -----> $e, $s");
      // if (showLoading) Center(child: CircularProgressIndicator(color: Colors.yellow,),);
      return null;
    }
  }
}