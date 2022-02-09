import 'package:bertucanfrontend/Widgets/register/ui/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.validator,
      this.onChanged,
      this.inputType = TextInputType.text,
      this.initialValue})
      : super(key: key);

  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType inputType;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontSize: 18,
                  color: const Color(0xFF3F3F3F),
                  fontFamily: 'Poppins Regular',
                ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        CustomTextFormField(
          validator: validator,
          keyboardType: inputType,
          onChanged: onChanged,
          initialValue: initialValue,
          decoration: InputDecoration(
            fillColor: const Color(0xFFEFF3F3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color(0xFFEFF3F3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFFEFF3F3),
                width: 2.0,
              ),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 15.0),
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xFF535461)),
          ),
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'Poppins Medium',
          ),
        ),
      ],
    );
  }
}
