import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/shared/buttons.dart';

class SendEmailButton extends StatelessWidget {
  final void Function()? onPressed;

  const SendEmailButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GeneralButton(
        onPressed: onPressed,
        color: const Color.fromARGB(255, 250, 181, 77),
        child: Text(
          'Send email',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
