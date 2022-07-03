import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  const CustomTextField({
    Key? key,
    required this.label,
    this.validator,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocalizedText(
              label,
              style: AppTheme.normalTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: AppTheme.textFieldDecoration(),
              child: TextFormField(
                  controller: controller,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  validator: validator,
                  style: AppTheme.normalTextStyle,
                  decoration: AppTheme.textFieldInputDecoration()
                      .copyWith(hintText: hintText)),
            ),
          ],
        ));
  }
}
