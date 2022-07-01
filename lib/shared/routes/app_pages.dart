import 'package:bertucanfrontend/main.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/ui/pages/auth/login/login_page.dart';
import 'package:bertucanfrontend/ui/pages/auth/register/register_page.dart';
import 'package:bertucanfrontend/ui/pages/intro/onBoaringQuetinary/on_boarding.dart';
import 'package:bertucanfrontend/ui/pages/notification/ui/notification.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    //auth
    GetPage(
      name: Routes.signupPage,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => const LoginPage(),
    ),

    //main
    GetPage(
      name: Routes.homePage,
      page: () => const MyHomePage(),
    ),
    GetPage(
      name: Routes.questionnairePage,
      page: () => const Questionnaire(),
    ),
    GetPage(
      name: Routes.notificationPage,
      page: () => const NotificationsPage(),
    ),
  ];
}
