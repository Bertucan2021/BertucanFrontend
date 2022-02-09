import 'package:bertucanfrontend/Widgets/login/login_page.dart';
import 'package:bertucanfrontend/Widgets/register/register_page.dart';
import 'package:bertucanfrontend/main.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          return const MyHomePage();
        });
      // case OnBoard.pageRoute:
      //   return MaterialPageRoute(builder: (context) {
      //     return OnBoard();
      //   });
      case RegisterPage.pageRoute:
        return MaterialPageRoute(builder: (context) {
          return const RegisterPage();
        });
      case LoginPage.pageRoute:
        return MaterialPageRoute(builder: (context) {
          // return MyHomePage();
          return LoginPage();
        });
    }
  }
}
