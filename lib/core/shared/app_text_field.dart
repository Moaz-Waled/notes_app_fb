import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? isConfirmPassword;
  final String? password;
  final bool? isEmail;

  const AppTextField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.obscureText,
    this.isConfirmPassword,
    this.password,
    this.isEmail,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: isEmail ?? false ? TextInputType.emailAddress : null,
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
        if ((isConfirmPassword ?? false) && value.trim() != password) {
          return 'confirm password must be similar to password';
        }
        if (isEmail ?? false) {
          final emailRegex = RegExp(
            r'^[A-Za-z0-9._%+-]+@(gmail|yahoo|outlook|hotmail|icloud|protonmail|proton|zohomail|gmx|aol)\.(com|me)$',
          );
          if (!emailRegex.hasMatch(value)) {
            return 'please enter a valid email';
          }
        }
        return null;
      },
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUnfocus,
    );
  }
}
