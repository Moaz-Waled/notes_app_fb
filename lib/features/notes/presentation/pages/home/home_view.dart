import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notes_app_fb/core/cache/cache_helper.dart';
import 'package:notes_app_fb/features/auth/presentation/pages/login/login_view.dart';
import 'package:notes_app_fb/features/notes/presentation/pages/home/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'My Notes',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              await CacheHelper().saveData(key: 'isLoggedin', value: false);
              Get.offAll(
                () => LoginView(),
                transition: Transition.fade,
                duration: Duration(milliseconds: 300),
              );
            },
            icon: Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
      ),
      body: HomeBody(),
    );
  }
}
