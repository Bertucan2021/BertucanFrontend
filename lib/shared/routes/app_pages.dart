import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/ui/bindings/auth_binding.dart';
import 'package:bertucanfrontend/ui/bindings/home_binding.dart';
import 'package:bertucanfrontend/ui/pages/auth/login_page.dart';
import 'package:bertucanfrontend/ui/pages/auth/signup_page.dart';
import 'package:bertucanfrontend/ui/pages/gbv/gbv_detail_page.dart';
import 'package:bertucanfrontend/ui/pages/gbv/gbv_page.dart';
import 'package:bertucanfrontend/ui/pages/srh/srh_detail_page.dart';
import 'package:bertucanfrontend/ui/pages/srh/srh_screen.dart';
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
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),

    //main
    GetPage(
        name: Routes.homePage,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
      name: Routes.questionnairePage,
      page: () => QuestionnairePage(),
    ),
    GetPage(
      name: Routes.introPage,
      page: () => IntroPage(),
    ),
    GetPage(
      name: Routes.notificationPage,
      page: () => const NotificationsPage(),
    ),
    GetPage(
      name: Routes.gbvPage,
      page: () => const GbvPage(),
    ),
    GetPage(
      name: Routes.gbvDetailPage,
      page: () => const GbvDetailPage(),
    ),
    GetPage(
      name: Routes.srhScreenPage,
      page: () => SrhScreen(),
    ),
      GetPage(
      name: Routes.srhDetailPage,
      page: () =>  const SrhDetailPage(),
    ),
  ];
}