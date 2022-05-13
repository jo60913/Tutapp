import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/presentation/foregot_password/forgot_password.dart';
import 'package:untitled/presentation/login/login.dart';
import 'package:untitled/presentation/main/main_view.dart';
import 'package:untitled/presentation/onboarding/onboarding.dart';
import 'package:untitled/presentation/register/register.dart';
import 'package:untitled/presentation/resources/strings_manager.dart';
import 'package:untitled/presentation/splash/splash.dart';
import 'package:untitled/presentation/store_details/store_details.dart';

class Routes{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailRoute = "/storeDetails";

}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=> SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=> LoginView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=> OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_)=> RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_)=> ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=> MainView());
      case Routes.storeDetailRoute:
        return MaterialPageRoute(builder: (_)=> StoreDetailsView());
      default:
        return UnDefinedRoute();
    }
  }
  static Route<dynamic> UnDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
        Scaffold(
          appBar: AppBar(title: Text(AppStrings.noRouteFound),),
          body: Center(child: Text(AppStrings.noRouteFound),),
        )
    );
  }
}

