import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/ui/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(text: 'srh', onPressed: () {
              Get.toNamed(Routes.srhScreenPage);
            }),
            const SizedBox(height: 20),
            RoundedButton(
                text: 'gbv',
                onPressed: () {
                  Get.toNamed(Routes.gbvPage);
                }),
          ],
        ),
      ),
    );
  }
}
