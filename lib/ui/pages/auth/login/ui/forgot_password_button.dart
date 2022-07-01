import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.topRight,
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'EnterEmailPage.pageRoute');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.0125),
            child: const Text(
              'Forgot password?',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins Regular',
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
