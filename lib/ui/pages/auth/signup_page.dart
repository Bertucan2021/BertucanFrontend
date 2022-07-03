import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:bertucanfrontend/ui/widgets/rectangular_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 140),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LocalizedText(
              "hello_there,",
              style: AppTheme.thinTextStyle,
            ),
            const LocalizedText(
              "sign_up_with",
              style: AppTheme.titleStyle,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextField(
                label: "full_name",
                hintText: "marry_doe",
                controller: _nameController),
            CustomTextField(
                label: "email",
                hintText: "username@example.com",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress),
            CustomTextField(
              label: "phone",
              hintText: "09923...",
              controller: _phoneController,
              keyboardType: TextInputType.phone,
            ),
            CustomTextField(
              label: "password",
              hintText: "password",
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(
              height: 40,
            ),
            RectangularButton(label: "register", onPressed: () {}),
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
                onPressed: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LocalizedText(
                  "already_have_an_account",
                  style: AppTheme.thinTextStyle,
                ),
                TextButton(
                  onPressed: () {},
                  child: const LocalizedText(
                    "sign_in",
                    style: AppTheme.buttonLabel2Style,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
