import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/shared/buttons.dart';

class LoginButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? color;
  final Widget? child;

  const LoginButton({super.key, this.onPressed, this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GeneralButton(onPressed: onPressed, color: color, child: child),
    );
  }
}
