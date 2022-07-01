import 'package:flutter/material.dart';

class BottomQuestion extends StatelessWidget {
  const BottomQuestion({
    Key? key,
    required this.question,
    required this.actionText,
    this.onPressed,
  }) : super(key: key);

  final String question;
  final String actionText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: const TextStyle(
            fontFamily: 'Poppins Regular',
            fontSize: 15,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: const TextStyle(
              fontFamily: 'Poppins Regular',
              fontSize: 15,
              color: Color(0xFF68A4F4),
            ),
          ),
        )
      ],
    );
  }
}
