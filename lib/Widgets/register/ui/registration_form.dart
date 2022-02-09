import 'package:bertucanfrontend/Widgets/login/login_page.dart';
import 'package:bertucanfrontend/Widgets/register/ui/call_to_action_button.dart';
import 'package:bertucanfrontend/Widgets/register/ui/custom_textfiled.dart';
import 'package:bertucanfrontend/Widgets/register/ui/form_bottom_question.dart';
import 'package:bertucanfrontend/Widgets/register/ui/password_field.dart';
import 'package:bertucanfrontend/Widgets/register/validators.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  void _handleFormSubmit() {
    if (_formKey.currentState!.validate()) {
      // context.read<SignupBloc>().add(SignupSubmitted());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Validators _validator = Validators();
    final screenHeight = MediaQuery.of(context).size.height;
    // print(displayHeight(context));
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            labelText: 'Full Name',
            hintText: 'Marry Doe',
            validator: (value) => _validator.validateName(value)?.toString(),
            onChanged: (value) => {},
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          CustomTextField(
            labelText: 'Email',
            hintText: 'username@example.com',
            inputType: TextInputType.emailAddress,
            validator: (value) => _validator.validateEmail(value)?.toString(),
            onChanged: (value) => {},
          ),

          CustomTextField(
              labelText: 'Phone',
              hintText: '0987654321',
              inputType: TextInputType.emailAddress,
              validator: (value) => _validator.validatePhone(value)?.toString(),
              onChanged: (value) => {}),
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
              //       .read<SignupBloc>()
              //       .add(SignupPasswordChanged(password: value)),
              // );
              ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Container(),
          SizedBox(
            height: screenHeight * 0.004,
          ),
          CallToActionButton(
            labelText: 'Register',
            onPressed: _handleFormSubmit,
            backgroundColor: const Color(0xFFE95F9F),
            foregroundColor: Colors.white,
          ),

          SizedBox(
            height: screenHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'OR',
                style: TextStyle(fontFamily: 'Poppins Bold', fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          CallToActionButton(
            labelText: 'Continue without Account',
            onPressed: _handleFormSubmit,
            backgroundColor: const Color(0xFF4B4B4B),
            foregroundColor: Colors.white,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //         width: 50,
          //         height: 50,
          //         decoration: BoxDecoration(
          //             color: const Color(0xFFEFF3F3),
          //             borderRadius: BorderRadius.circular(40),
          //             backgroundBlendMode: BlendMode.dstOut,
          //             boxShadow: const [
          //               BoxShadow(
          //                 color: Color(0xFFEFF3F3),
          //                 offset: Offset(1.0, 4.0),
          //                 blurRadius: 20.0,
          //               )
          //             ]),
          //         // child: Image.asset('assets/google-icon.png')),
          //   ],
          // ),
          // return CallToActionButton(
          //   labelText: '',
          //   onPressed: () async {
          //     var token = await continueWithGoogle();
          //     context
          //       .read<ContinueWithGoogleBloc>()
          //       .add(ContinueWithGooglePressed(token: token)
          //     );
          //   },
          //   leadingIcon: Image.asset('assets/google-icon.png'),
          //   borderSide: BorderSide(color: border, width: 0.0),
          // );

          SizedBox(
            height: screenHeight * 0.015,
          ),
          BottomQuestion(
            question: 'Already have an account?',
            actionText: 'Log In',
            onPressed: () {
              Navigator.pushNamed(context, LoginPage.pageRoute);
            },
          ),
        ],
      ),
    );
  }
}
