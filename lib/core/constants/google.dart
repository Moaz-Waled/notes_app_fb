import 'package:google_sign_in/google_sign_in.dart';

class Google {
  static final GoogleSignIn googleSignIn = GoogleSignIn.instance;

  static Future<void> init() async {
    await googleSignIn.initialize();
  }
}