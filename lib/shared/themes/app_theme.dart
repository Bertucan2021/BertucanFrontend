import 'package:flutter/material.dart';

class AppTheme {
  //colors
  static const Color primaryColor = Color(0xFFE95F9F);
  static const Color secondaryColor = Color(0xFFF7924A);
  static const Color white = Color(0xFFFFFFFF);
  static const Color orange = Color(0xFFFF2020);
  static const Color blue = Color(0xFF2029FF);
  static const Color green = Color(0xFF04DE5B);
  static const Color pink = Color(0xFFFF5353);

  static const Color subtlePink = Color(0xFFFFB1B1);
  static const Color subtleGreen = Color(0xFFA3E7F0);
  static const Color subtleBlue = Color(0xFFBAD5FD);
  static const Color subtlePurple = Color(0xFFECBAFD);

  static const Color containerBlack = Color(0xFF4B4B4B);
  static const Color textFieldGrey = Color(0xFFEFF3F3);
  static const Color creamyBackground = Color(0xFFE5E5E5);

  static const Color textBlack = Color(0xFF3F3F3F);
  static const Color hintGrey = Color(0xFF878890);
  static const Color textBlue = Color(0xFF68A4F4);
  static const Color textGrey = Color(0xFF6B6464);
  static const Color textGrey2 = Color(0xFF999696);
  static const Color boxGrey = Color(0x69C4C4C4);

  //text styles
  static const TextStyle normalTextStyle = TextStyle(
    fontSize: 18,
    color: textBlack,
    fontWeight: FontWeight.w400,
  );
   static const TextStyle normal2TextStyle = TextStyle(
    fontSize: 16,
    color: textBlack,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle thinTextStyle = TextStyle(
    fontSize: 14,
    color: textBlack,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle articleTextStyle = TextStyle(
    fontSize: 16,
    color: textGrey,
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
  static const TextStyle titleStyle2 = TextStyle(
    fontSize: 24,
    color: textBlack,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle titleStyle3 = TextStyle(
    fontSize: 18,
    color: textGrey,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle titleStyle4 = TextStyle(
    fontSize: 18,
    color: textBlack,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle titleStyle5 = TextStyle(
    fontSize: 32,
    color: textBlack,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle boldTitle = TextStyle(
    fontSize: 18,
    color: textBlack,
    fontWeight: FontWeight.w800,
  );
  static const TextStyle greySubtitleStyle = TextStyle(
    fontSize: 14,
    color: textGrey,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle buttonLabelStyle = TextStyle(
    fontSize: 18,
    color: white,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle buttonLabelStyle2 = TextStyle(
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
  static BoxDecoration primaryColoredRoundedButtonDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: primaryColor,
      );
  static BoxDecoration insightCardDecoration() => BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: white,
        boxShadow: [
          BoxShadow(
              color: pink.withOpacity(0.3),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 3),
        ],
        border: Border.all(
          color: subtlePink,
          width: 1,
        ),
      );
  static BoxDecoration orangeBoxDecoration() => const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      color: Color(0xFFF7924A));
  //input decorations
  static InputDecoration textFieldInputDecoration() => const InputDecoration(
      border: InputBorder.none,
      hintStyle: AppTheme.hintTextStyle,
      contentPadding: EdgeInsets.only(left: 10));
}