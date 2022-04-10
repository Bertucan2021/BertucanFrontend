import 'package:bertucanfrontend/Widgets/SRH/srh_article_detail.dart';
import 'package:bertucanfrontend/Widgets/SRH/srh_page.dart';
import 'package:bertucanfrontend/Widgets/gbv/gbv_organization_detail_page.dart';
import 'package:bertucanfrontend/Widgets/gbv/gbv_page.dart';
import 'package:bertucanfrontend/Widgets/gbv/gbv_report.dart';
import 'package:bertucanfrontend/Widgets/log/ui/log_activity.dart';
import 'package:bertucanfrontend/Widgets/log/ui/period.dart';
import 'package:bertucanfrontend/Widgets/login/login_page.dart';
import 'package:bertucanfrontend/Widgets/notification/ui/notification.dart';
import 'package:bertucanfrontend/Widgets/onBoaringQuetinary/ui/on_boarding.dart';
import 'package:bertucanfrontend/Widgets/register/register_page.dart';
import 'package:bertucanfrontend/arguments/gbv_argument.dart';
import 'package:bertucanfrontend/arguments/srh_argument.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) {
          return const MyHomePage();
        });
      // // case OnBoard.pageRoute:
      // //   return MaterialPageRoute(builder: (context) {
      // //     return OnBoard();
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

      case SRHPage.pageRoute:
        return MaterialPageRoute(builder: (context) {
          // return MyHomePage();
          return const SRHPage();
        });
      case SRHArticleDetail.pageRoute:
        return MaterialPageRoute(builder: (context) {
          SRHArgument? argument = args as SRHArgument?;
          return SRHArticleDetail(id: argument?.id);
        });
      case GBVPage.pageRoute:
        return MaterialPageRoute(builder: (context) {
          return const GBVPage();
        });
      case GBVOrganizationDetail.pageRoute:
        return MaterialPageRoute(builder: (context) {
          GBVArgument? argument = args as GBVArgument?;
          return GBVOrganizationDetail(id: argument?.id);
        });
      case GBVReportPage.pageRoute:
        return MaterialPageRoute(builder: (context) {
          return const GBVReportPage();

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
    return null;
  }
}
