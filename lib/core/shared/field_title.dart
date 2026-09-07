import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  final String? title;

  const FieldTitle({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
