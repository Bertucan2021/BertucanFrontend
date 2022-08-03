import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/controllers/auth_controller.dart';
import 'package:bertucanfrontend/ui/widgets/custom_dialog.dart';
import 'package:bertucanfrontend/ui/widgets/custom_textfield.dart';
import 'package:bertucanfrontend/ui/widgets/localized_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetPassCode extends StatelessWidget {
  SetPassCode({Key? key}) : super(key: key);
  final AuthController _authController = Get.find();

  final TextEditingController _passCodeController = TextEditingController();
  final TextEditingController _passCodeController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        title: 'passcode',
        content: [
          Form(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            CustomTextField(
              label: 'enter_passcode',
              controller: _passCodeController,
              obscureText: true,
              hintText: 'enter_your_passcode',
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'passcode_canot_be_null'.tr;
                }
              },
            ),
            CustomTextField(
                label: 'confirm_passcode',
                controller: _passCodeController2,
                obscureText: true,
                keyboardType: TextInputType.number,
                hintText: 'enter_your_passcode',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'passcode_canot_be_null'.tr;
                  } else if (value.trim() != _passCodeController.text) {
                    return 'the_two_passcodes_are_not_the_same';
                  }
                })
          ])),
        ],
        onCancel: () {
          _passCodeController.clear();
          _passCodeController2.clear();
        },
        onConfirm: () {
          if (_formKey.currentState!.validate()) {
            _authController.setPasscode(_passCodeController.text);
            _passCodeController.clear();
            _passCodeController2.clear();
            Get.back();
          }
        });
  }
}
