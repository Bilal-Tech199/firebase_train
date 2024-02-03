import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/AppModules/AuthModule/Views/sign_up_view.dart';
import 'package:demo/Utils/app_btn.dart';
import 'package:demo/Utils/edit_text_field.dart';
import 'package:demo/Utils/spaces.dart';
import 'package:demo/Utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../ViewModels/auth_view_model.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  AuthViewModel authViewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EditTextField(
              controller: authViewModel.signInEmail.value,
              hint: "Email",
              hintColor: Colors.grey,
            ),
            20.height,
            EditTextField(
              controller: authViewModel.signInPass.value,
              hint: "Password",
              hintColor: Colors.grey,
            ),
            30.height,
            AppBTN(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance

                      .signInWithEmailAndPassword(email: authViewModel.signInEmail.value.text, password: authViewModel.signInPass.value.text)
                      .then((value) async {
                    Utils.showSnackBar(
                      title: "Welcome",
                      message: "Welcome to Baller Central",
                      color: Colors.green,
                      textColor: Colors.white,
                      icon: Icons.done,
                    );

                  });
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'invalid-credential') {
                    Utils.showSnackBar(
                      title: "Invalid",
                      message: "Invalid Email or Password",
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      icon: Icons.warning,
                    );
                  }
                }
              },
              title: "Sign In",
            ),
            30.height,
            InkWell(
              onTap: () {
                Utils.to(page: SignUpView());
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
