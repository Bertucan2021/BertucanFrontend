import 'package:bertucanfrontend/Widgets/register/ui/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Text(
            widget.labelText,
            style: Theme.of(context).textTheme.headline2?.copyWith(
                  fontSize: 18,
                  color: const Color(0xFF3F3F3F),
                  fontFamily: 'Poppins Regular',
                ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.0065,
        ),
        CustomTextFormField(
          validator: widget.validator,
          onChanged: widget.onChanged,
          obscureText: _obscureText,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
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
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Color(0xFF535461)),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )),
          style: TextStyle(
            fontSize: screenHeight * 0.021,
            fontFamily: 'Poppins Medium',
          ),
        ),
      ],
    );
  }
}
