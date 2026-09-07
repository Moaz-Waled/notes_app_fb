import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/shared/app_text_field.dart';
import 'package:notes_app_fb/core/shared/field_title.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/register/widgets/register_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldTitle(title: 'Username'),
          AppTextField(hint: 'Enter your username'),
          VerticalSpace(value: 2),
          FieldTitle(title: 'Email'),
          AppTextField(hint: 'Enter your email'),
          VerticalSpace(value: 2),
          FieldTitle(title: 'Password'),
          AppTextField(
            hint: 'Enter your password',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                showPassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            obscureText: !showPassword,
          ),
          VerticalSpace(value: 2),
          FieldTitle(title: 'Confirm password'),
          AppTextField(
            hint: 'Confirm your password',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  showConfirmPassword = !showConfirmPassword;
                });
              },
              icon: Icon(
                showConfirmPassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            obscureText: !showConfirmPassword,
          ),
          VerticalSpace(value: 4),
          RegisterButton(onPressed: () {}),
        ],
      ),
    );
  }
}
