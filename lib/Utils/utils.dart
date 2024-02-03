import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Utils {
  static to({required Widget page}) {
    Get.to(
      page,
      duration: Duration(milliseconds: 400),
      transition: Transition.rightToLeft,
    );
  }
  static offAll({required Widget page}) {
    Get.offAll(
      page,
      duration: Duration(milliseconds: 400),
      transition: Transition.rightToLeft,
    );
  }

  static showSnackBar({
    required String title,
    required String message,
    required Color color,
    required Color textColor,
    required IconData icon,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: color,
      colorText: textColor,
      icon: Icon(
        icon,
        color: textColor,
      ),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(16),
    );
  }
}
