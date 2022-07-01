import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const pageRoute = '/login';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(30),
              children: [
                SvgPicture.asset(
                  'assets/undraw_certification_aif8.svg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Welcome back,',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Poppins Bold',
                            color: Color(0xFFE95F9F))),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.018,
                ),
                const FormContainer(
                  form: LoginForm(),
                ),
              ],
            ),
          ),
        ));
  }
}
