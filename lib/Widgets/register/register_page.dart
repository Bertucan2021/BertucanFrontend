import 'package:bertucanfrontend/Widgets/register/ui/form_container.dart';
import 'package:bertucanfrontend/Widgets/register/ui/registration_form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const pageRoute = '/register';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                // Image.asset(
                //   "assets/new-logo.jpeg",
                //   width: MediaQuery.of(context).size.width * 0.5,
                // ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hello there,',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins Regular',
                          color: Color(0xFF3F3F3F)),
                    ),
                    Text('Sign up with,',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Poppins Bold',
                            color: Color(0xFFE95F9F))),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                const FormContainer(
                  form: RegistrationForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
