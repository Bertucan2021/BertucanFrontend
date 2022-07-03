import 'package:flutter/material.dart';

class AppTheme {
  //colors
  static const Color primaryColor = Color(0xFFE95F9F);
  static const Color white = Color(0xFFFFFFFF);

  static const Color containerBlack = Color(0xFF4B4B4B);
  static const Color textFieldGrey = Color(0xFFEFF3F3);

  static const Color textBlack = Color(0xFF3F3F3F);
  static const Color hintGrey = Color(0xFF878890);
  static const Color textBlue = Color(0xFF68A4F4);

  //text styles
  static const TextStyle normalTextStyle = TextStyle(
    fontSize: 18,
    color: textBlack,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle thinTextStyle = TextStyle(
    fontSize: 14,
    color: textBlack,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle hintTextStyle = TextStyle(
    fontSize: 16,
    color: hintGrey,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    color: primaryColor,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle title2Style = TextStyle(
    fontSize: 24,
    color: textBlack,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle buttonLabelStyle = TextStyle(
    fontSize: 18,
    color: white,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle buttonLabel2Style = TextStyle(
    fontSize: 16,
    color: textBlue,
    fontWeight: FontWeight.w700,
  );

  //box decorations
  static BoxDecoration textFieldDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: textFieldGrey,
      );

  static BoxDecoration primaryColoredRectangularButtonDecoration() =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: primaryColor,
      );

  static BoxDecoration nonPrimaryColoredRectangularButtonDecoration() =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: containerBlack,
      );

  //input decorations
  static InputDecoration textFieldInputDecoration() => const InputDecoration(
      border: InputBorder.none,
      hintStyle: AppTheme.hintTextStyle,
      contentPadding: EdgeInsets.only(left: 10));
}
