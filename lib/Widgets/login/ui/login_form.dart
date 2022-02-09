import 'package:bertucanfrontend/Widgets/register/register_page.dart';
import 'package:bertucanfrontend/Widgets/register/ui/call_to_action_button.dart';
import 'package:bertucanfrontend/Widgets/register/ui/custom_textfiled.dart';
import 'package:bertucanfrontend/Widgets/register/ui/form_bottom_question.dart';
import 'package:bertucanfrontend/Widgets/register/ui/password_field.dart';
import 'package:bertucanfrontend/Widgets/register/validators.dart';
import 'package:flutter/material.dart';

import 'forgot_password_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  void _handleFormSubmit() {
    if (_formKey.currentState!.validate()) {
      // Navigator.pushNamedAndRemoveUntil(
      //     context, '/', ModalRoute.withName(LoginPage.pageRoute));
      // context.read<LoginBloc>().add(LoginSubmitted());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Validators _validator = Validators();
    final screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
              labelText: 'Email',
              hintText: 'username@example.com',
              inputType: TextInputType.emailAddress,
              validator: (value) => _validator.validateEmail(value)?.toString(),
              onChanged: (value) => {}
              //   context
              //       .read<LoginBloc>()
              //       .add(LoginEmailChanged(email: value)),
              // );
              ),
          SizedBox(
            height: screenHeight * 0.015,
          ),
          PasswordField(
              labelText: 'Password',
              hintText: 'Password*',
              validator: (value) =>
                  _validator.validatePassword(value)?.toString(),
              onChanged: (value) => {}
              //   context
              //       .read<LoginBloc>()
              //       .add(LoginPasswordChanged(password: value)),
              // );

              ),
          const ForgotPasswordButton(),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          CallToActionButton(
            labelText: 'Log in',
            onPressed: _handleFormSubmit,
            backgroundColor: const Color(0xFFE95F9F),
            foregroundColor: Colors.white,
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          SizedBox(
            height: screenHeight * 0.015,
          ),
          BottomQuestion(
            question: "Don't have an account?",
            actionText: 'Sign up',
            onPressed: () {
              Navigator.pushNamed(context, RegisterPage.pageRoute);
            },
          ),
        ],
      ),
    );
  }
}
