import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/register/register_view.dart';

class GoToRegWidget extends StatelessWidget {
  const GoToRegWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account ? ', style: TextStyle(fontSize: 16)),
        GestureDetector(
          onTap: () {
            Get.to(
              () => RegisterView(),
              transition: Transition.rightToLeft,
              duration: Duration(milliseconds: 300),
            );
          },
          child: Text(
            'Register',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 250, 181, 77),
            ),
          ),
        ),
      ],
    );
  }
}
