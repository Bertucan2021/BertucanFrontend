import 'package:bertucanfrontend/Widgets/log/ui/log_activity.dart';
import 'package:bertucanfrontend/Widgets/log/ui/period.dart';
import 'package:bertucanfrontend/Widgets/login/login_page.dart';
import 'package:bertucanfrontend/Widgets/notification/ui/notification.dart';
import 'package:bertucanfrontend/Widgets/onBoaringQuetinary/ui/on_boarding.dart';
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
          return const LoginPage();
        });
      case Questionnaire.routeName:
        return MaterialPageRoute(builder: (context) {
          // return MyHomePage();
          return const Questionnaire();
        });
      case NotificationsPage.routeName:
        return MaterialPageRoute(builder: (context){
          return const NotificationsPage();
        });

      case LogActivities.routeName:
        return MaterialPageRoute(builder: (context){
          return const LogActivities();
        });

      case LogPeriod.routeName:
        return MaterialPageRoute(builder: (context){
          return const LogPeriod();
        });
    }
  }
}
