import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/ui/pages/auth/login_page.dart';
import 'package:bertucanfrontend/ui/pages/auth/signup_page.dart';
import 'package:bertucanfrontend/ui/pages/home_page.dart';
import 'package:bertucanfrontend/ui/pages/intro/into_page.dart';
import 'package:bertucanfrontend/ui/pages/intro/questionnaire_page.dart';
import 'package:bertucanfrontend/ui/pages/notification/notifications_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    //auth
    GetPage(
      name: Routes.signupPage,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => LoginPage(),
    ),

    //main
    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.questionnairePage,
      page: () => const QuestionnairePage(),
    ),
    GetPage(
      name: Routes.introPage,
      page: () => const IntroPage(),
    ),
    GetPage(
      name: Routes.notificationPage,
      page: () => const NotificationsPage(),
    ),
  ];
}
