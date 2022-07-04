import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const SearchTextField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: AppTheme.normalTextStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText.tr,
          hintStyle:
              AppTheme.greySubtitleStyle.copyWith(fontWeight: FontWeight.w400),
          suffixIcon: Icon(Icons.search),
        ),
        controller: controller,
      ),
    );
  }
}
