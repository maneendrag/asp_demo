// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:asp_base/screen/cart/cart_screen.dart' as _i9;
import 'package:asp_base/screen/categories/categories_screen.dart' as _i10;
import 'package:asp_base/screen/home/edit_profile/edit_profile_screen.dart'
    as _i7;
import 'package:asp_base/screen/home/screens/product_details/product_details_screen.dart'
    as _i8;
import 'package:asp_base/screen/home/screens/products/products_screen.dart'
    as _i6;
import 'package:asp_base/screen/login/screens/landing_screen.dart' as _i3;
import 'package:asp_base/screen/login/screens/login_screen.dart' as _i4;
import 'package:asp_base/screen/login/screens/signUpScreen.dart' as _i5;
import 'package:asp_base/screen/splash_screen.dart' as _i2;
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const splashScreen = '/';

  static const landingScreen = '/landing-screen';

  static const loginScreen = '/login-screen';

  static const signUpScreen = '/sign-up-screen';

  static const productsScreen = '/products-screen';

  static const editProfileScreen = '/edit-profile-screen';

  static const productDetailsScreen = '/product-details-screen';

  static const cartScreen = '/cart-screen';

  static const categoriesScreen = '/categories-screen';

  static const all = <String>{
    splashScreen,
    landingScreen,
    loginScreen,
    signUpScreen,
    productsScreen,
    editProfileScreen,
    productDetailsScreen,
    cartScreen,
    categoriesScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreen,
      page: _i2.SplashScreen,
    ),
    _i1.RouteDef(
      Routes.landingScreen,
      page: _i3.LandingScreen,
    ),
    _i1.RouteDef(
      Routes.loginScreen,
      page: _i4.LoginScreen,
    ),
    _i1.RouteDef(
      Routes.signUpScreen,
      page: _i5.SignUpScreen,
    ),
    _i1.RouteDef(
      Routes.productsScreen,
      page: _i6.ProductsScreen,
    ),
    _i1.RouteDef(
      Routes.editProfileScreen,
      page: _i7.EditProfileScreen,
    ),
    _i1.RouteDef(
      Routes.productDetailsScreen,
      page: _i8.ProductDetailsScreen,
    ),
    _i1.RouteDef(
      Routes.cartScreen,
      page: _i9.CartScreen,
    ),
    _i1.RouteDef(
      Routes.categoriesScreen,
      page: _i10.CategoriesScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreen(),
        settings: data,
      );
    },
    _i3.LandingScreen: (data) {
      final args = data.getArgs<LandingScreenArguments>(
        orElse: () => const LandingScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i3.LandingScreen(key: args.key),
        settings: data,
      );
    },
    _i4.LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i4.LoginScreen(),
        settings: data,
      );
    },
    _i5.SignUpScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i5.SignUpScreen(),
        settings: data,
      );
    },
    _i6.ProductsScreen: (data) {
      final args = data.getArgs<ProductsScreenArguments>(
        orElse: () => const ProductsScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i6.ProductsScreen(
            key: args.key,
            isFromCategories: args.isFromCategories,
            categoryName: args.categoryName),
        settings: data,
      );
    },
    _i7.EditProfileScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.EditProfileScreen(),
        settings: data,
      );
    },
    _i8.ProductDetailsScreen: (data) {
      final args = data.getArgs<ProductDetailsScreenArguments>(
        orElse: () => const ProductDetailsScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i8.ProductDetailsScreen(key: args.key, productID: args.productID),
        settings: data,
      );
    },
    _i9.CartScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.CartScreen(),
        settings: data,
      );
    },
    _i10.CategoriesScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.CategoriesScreen(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LandingScreenArguments {
  const LandingScreenArguments({this.key});

  final _i11.Key? key;
}

class ProductsScreenArguments {
  const ProductsScreenArguments({
    this.key,
    this.isFromCategories = false,
    this.categoryName = "",
  });

  final _i11.Key? key;

  final bool isFromCategories;

  final String categoryName;
}

class ProductDetailsScreenArguments {
  const ProductDetailsScreenArguments({
    this.key,
    this.productID,
  });

  final _i11.Key? key;

  final int? productID;
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLandingScreen({
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.landingScreen,
        arguments: LandingScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProductsScreen({
    _i11.Key? key,
    bool isFromCategories = false,
    String categoryName = "",
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.productsScreen,
        arguments: ProductsScreenArguments(
            key: key,
            isFromCategories: isFromCategories,
            categoryName: categoryName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditProfileScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.editProfileScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProductDetailsScreen({
    _i11.Key? key,
    int? productID,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.productDetailsScreen,
        arguments:
            ProductDetailsScreenArguments(key: key, productID: productID),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cartScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCategoriesScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.categoriesScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLandingScreen({
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.landingScreen,
        arguments: LandingScreenArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProductsScreen({
    _i11.Key? key,
    bool isFromCategories = false,
    String categoryName = "",
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.productsScreen,
        arguments: ProductsScreenArguments(
            key: key,
            isFromCategories: isFromCategories,
            categoryName: categoryName),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditProfileScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.editProfileScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProductDetailsScreen({
    _i11.Key? key,
    int? productID,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.productDetailsScreen,
        arguments:
            ProductDetailsScreenArguments(key: key, productID: productID),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCartScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cartScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCategoriesScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.categoriesScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
