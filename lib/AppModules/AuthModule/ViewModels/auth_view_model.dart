import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends GetxController{


  Rx<TextEditingController> signInEmail = TextEditingController().obs;
  Rx<TextEditingController> signInPass = TextEditingController().obs;
  Rx<TextEditingController> signUpName = TextEditingController().obs;
  Rx<TextEditingController> signUpEmail = TextEditingController().obs;
  Rx<TextEditingController> signUpPass = TextEditingController().obs;

}