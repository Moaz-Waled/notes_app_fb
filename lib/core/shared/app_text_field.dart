import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? obscureText;

  const AppTextField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(46, 158, 158, 158),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: suffixIcon,
      ),
      cursorColor: Colors.black,
      obscureText: obscureText ?? false,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'this field is required';
        }
        return null;
      },
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUnfocus,
    );
  }
}
