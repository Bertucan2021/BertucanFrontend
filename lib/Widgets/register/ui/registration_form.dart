import 'package:bertucanfrontend/Widgets/login/login_page.dart';
import 'package:bertucanfrontend/Widgets/register/ui/call_to_action_button.dart';
import 'package:bertucanfrontend/Widgets/register/ui/custom_textfiled.dart';
import 'package:bertucanfrontend/Widgets/register/ui/form_bottom_question.dart';
import 'package:bertucanfrontend/Widgets/register/ui/password_field.dart';
import 'package:bertucanfrontend/Widgets/register/validators.dart';
import 'package:bertucanfrontend/bloc/user/register/register_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bertucanfrontend/bloc/user/register/register_state.dart';
import 'package:bertucanfrontend/bloc/user/register/resgister_bloc.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  late String full_name = '';
  late String email = '';
  late String phone = '';
  late String password = '';

  void _handleFormSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<RegisterBloc>().add(Register(firstName: full_name, lastName: full_name, email: email, phoneNumber: phone, password: password));
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
            onChanged: (value) => {full_name = value},
          ),
          SizedBox(
            height: screenHeight * 0.025,
          ),
          CustomTextField(
            labelText: 'Email',
            hintText: 'username@example.com',
            inputType: TextInputType.emailAddress,
            validator: (value) => _validator.validateEmail(value)?.toString(),
            onChanged: (value) => {email = value},
          ),

          CustomTextField(
              labelText: 'Phone',
              hintText: '0900000000',
              inputType: TextInputType.emailAddress,
              validator: (value) => _validator.validatePhone(value)?.toString(),
              onChanged: (value) => {phone = value}),
          SizedBox(
            height: screenHeight * 0.015,
          ),
          PasswordField(
              labelText: 'Password',
              hintText: 'Password*',
              validator: (value) => _validator.validatePassword(value)?.toString(),
              onChanged: (value) => {password = value}
              //   context
              //       .read<SignupBloc>()
              //       .add(SignupPasswordChanged(password: value)),
              // );
              ),
          SizedBox(
            height: screenHeight * 0.05,
          ),
        BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
          print(state.toString());
          if (state is RegisterErrorState) {
            return Text(state.errorMessage!, style: const TextStyle(color: Colors.red),);
          }
          return Container();
        }),
          SizedBox(
            height: screenHeight * 0.004,
          ),
          BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
            print(state.toString());
            if (state is RegisterSuccessState) {
              Navigator.pushNamed(context, '/');
            } else if (state is RegisterLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return CallToActionButton(
              labelText: 'Register',
              onPressed: _handleFormSubmit,
              backgroundColor: const Color(0xFFE95F9F),
              foregroundColor: Colors.white,
            );
          }),

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
