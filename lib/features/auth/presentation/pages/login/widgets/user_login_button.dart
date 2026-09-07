import 'package:flutter/material.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/widgets/login_button.dart';

class UserLoginButton extends StatelessWidget {
  final void Function()? onPressed;

  const UserLoginButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LoginButton(
      onPressed: onPressed,
      color: const Color.fromARGB(255, 250, 181, 77),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
