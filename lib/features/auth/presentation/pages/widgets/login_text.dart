import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        VerticalSpace(value: 1),
        Text(
          'Login to continue using the app',
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
  }
}
