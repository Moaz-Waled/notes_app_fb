import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/shared/app_text_field.dart';
import 'package:notes_app_fb/core/shared/field_title.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/widgets/google_login_button.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/widgets/user_login_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formStateKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          VerticalSpace(value: 1),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Forget password ?',
                style: TextStyle(
                  color: const Color.fromARGB(255, 34, 34, 34),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          VerticalSpace(value: 4),
          UserLoginButton(onPressed: () {}),
          VerticalSpace(value: 4),
          GoogleLoginButton(onPressed: () {}),
        ],
      ),
    );
  }
}
