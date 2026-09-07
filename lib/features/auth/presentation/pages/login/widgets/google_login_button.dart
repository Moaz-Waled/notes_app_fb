import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/constants/app_images.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/widgets/login_button.dart';

class GoogleLoginButton extends StatelessWidget {
  final void Function()? onPressed;

  const GoogleLoginButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return LoginButton(
      onPressed: onPressed,
      color: Colors.redAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Login with',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          HorizontalSpace(value: 1),
          Image.asset(AppIcons.google, width: 25, height: 25),
        ],
      ),
    );
  }
}
