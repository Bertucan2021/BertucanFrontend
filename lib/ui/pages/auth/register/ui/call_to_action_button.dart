import 'package:flutter/material.dart';

class CallToActionButton extends StatelessWidget {
  CallToActionButton(
      {Key? key,
      required this.onPressed,
      required this.labelText,
      this.leadingIcon,
      this.backgroundColor = Colors.white,
      this.foregroundColor = Colors.grey,
      this.borderSide = BorderSide.none})
      : super(key: key) {
    if (leadingIcon != null) {
      _child = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          leadingIcon!,
          const SizedBox(
            width: 10.0,
          ),
          Text(
            labelText,
            style: TextStyle(
              fontFamily: 'Poppins Bold',
              fontSize: 18.0,
              color: foregroundColor,
            ),
          ),
        ],
      );
    } else {
      _child = Text(
        labelText,
        style: TextStyle(
          fontFamily: 'Poppins Bold',
          fontSize: 18.0,
          color: foregroundColor,
        ),
      );
    }
  }
  final VoidCallback onPressed;
  final String labelText;
  final Widget? leadingIcon;
  final Color backgroundColor;
  final Color foregroundColor;
  final BorderSide borderSide;

  late final Widget _child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      elevation: 0.0,
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      onPressed: onPressed,
      child: _child,
      shape: StadiumBorder(
        side: borderSide,
      ),
      color: backgroundColor,
    );
  }
}
