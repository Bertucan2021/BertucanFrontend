import 'package:bertucanfrontend/shared/routes/app_routes.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rectangular_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SvgPicture.asset(
            'assets/undraw_certification_aif8.svg',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          const LocalizedText(
            "welcome_back,",
            style: AppTheme.thinTextStyle,
          ),
          const LocalizedText(
            "login_with",
            style: AppTheme.titleStyle,
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextField(
            label: "email",
            hintText: "marry_doe",
            controller: _emailController,
          ),
          CustomTextField(
            label: "password",
            hintText: "password",
            controller: _passwordController,
            rightIcon: Icons.remove_red_eye,
            obscureText: true,
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: LocalizedText(
              'forgot_password',
              style: AppTheme.thinTextStyle,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          RectangularButton(
              label: "login",
              onPressed: () {
                Get.toNamed(Routes.homePage);
              }),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.center,
            child: LocalizedText(
              "or",
              style: AppTheme.thinTextStyle,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          RectangularButton(
              label: "continue_without_account",
              isColorPrimary: false,
              onPressed: () {
                Get.toNamed(Routes.homePage);
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LocalizedText(
                "don't_have_an_account",
                style: AppTheme.thinTextStyle,
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.signupPage);
                },
                child: const LocalizedText(
                  "sign_up",
                  style: AppTheme.buttonLabelStyle2,
                ),
              ),
            ],
          )
        ]),
      ),
    ));
  }
}

// SvgPicture.asset(
//                   'assets/undraw_certification_aif8.svg',
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.4,
//                 ),