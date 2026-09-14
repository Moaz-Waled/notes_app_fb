import 'package:flutter/material.dart';
import 'package:notes_app_fb/core/shared/buttons.dart';

class AddButton extends StatelessWidget {
  final void Function()? onPressed;

  const AddButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GeneralButton(
        onPressed: onPressed,
        color: const Color.fromARGB(255, 250, 181, 77),
        child: Text(
          'Add',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
