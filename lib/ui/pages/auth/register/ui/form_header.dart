import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.08),
      child: Text(
        labelText,
        style: Theme.of(context).textTheme.headline1?.copyWith(
              fontFamily: 'Poppins Bold',
              fontSize: screenHeight * 0.05,
              color: Colors.grey,
            ),
      ),
    );
  }
}
