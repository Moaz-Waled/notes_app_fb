import 'package:get/get.dart';
import 'package:notes_app_fb/core/utils/size_config.dart';

class AppSnackbar {
  static void showSnackbar({required String message}) {
    Get.showSnackbar(
      GetSnackBar(
        borderRadius: 50,
        maxWidth: SizeConfig.defaultSize! * 35,
        message: message,
        duration: Duration(seconds: 3),
        animationDuration: Duration(milliseconds: 100),
      ),
    );
  }
}
