import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/shared/space_widget.dart';

class AuthPageTitle extends StatelessWidget {
  final String? title;
  final String? subtitle;
  
  const AuthPageTitle({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        VerticalSpace(value: 1),
        Text(
          subtitle!,
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
      ],
    );
  }
}
