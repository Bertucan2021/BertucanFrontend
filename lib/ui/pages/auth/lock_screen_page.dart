import 'dart:developer';

import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:get/get.dart';

class LockScreenPage extends StatelessWidget {
  const LockScreenPage({Key? key}) : super(key: key);
  AuthController get authController => Get.find();
  @override
  Widget build(BuildContext context) {
    return ScreenLock(
      screenLockConfig:
          ScreenLockConfig(backgroundColor: AppTheme.primaryColor),
      correctString: authController.getPasscode(),
      didUnlocked: () {
        Get.offAndToNamed(Routes.homePage);
      },
    );
  }
}
