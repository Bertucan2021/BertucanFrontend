import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/ui/bindings/auth_binding.dart';
import 'package:bertucanfrontend/ui/bindings/home_binding.dart';
import 'package:bertucanfrontend/ui/pages/auth/login_page.dart';
import 'package:bertucanfrontend/ui/pages/auth/signup_page.dart';
import 'package:bertucanfrontend/ui/pages/gbv/gbv_detail_page.dart';
import 'package:bertucanfrontend/ui/pages/gbv/gbv_page.dart';
import 'package:bertucanfrontend/ui/pages/gbv/report_gbv_page.dart';
import 'package:bertucanfrontend/ui/pages/home/srh_screen.dart';
import 'package:bertucanfrontend/ui/pages/home_page.dart';
import 'package:bertucanfrontend/ui/pages/intro/into_page.dart';
import 'package:bertucanfrontend/ui/pages/intro/questionnaire_page.dart';
import 'package:bertucanfrontend/ui/pages/log/chances_of_pregnancy_page.dart';
import 'package:bertucanfrontend/ui/pages/log/daily_detail_page.dart';
import 'package:bertucanfrontend/ui/pages/log/log_page.dart';
import 'package:bertucanfrontend/ui/pages/log/symptoms_page.dart';
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
      name: Routes.reportGbvPage,
      page: () => const ReportGbvPage(),
    ),
    GetPage(
      name: Routes.srhScreenPage,
      page: () => SrhScreen(),
    ),
    GetPage(
      name: Routes.logChancePregnancyPage,
      page: () => const ChancesOfPregnancy(),
    ),
    GetPage(
      name: Routes.symptomsPage,
      page: () => const SymptomsPage(),
    ),
    GetPage(name: Routes.dailyDetailPage, page: () => const DailyDetailPage())
  ];
}
