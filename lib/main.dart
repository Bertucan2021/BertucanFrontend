import 'package:bertucanfrontend/shared/routes/app_pages.dart';
import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([GetStorage.init()]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var storage = GetStorage();
    String initialRoute = Routes.introPage;
    if (storage.hasData('answers')) {
      initialRoute = Routes.homePage;
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: initialRoute,
    );
  }
}
