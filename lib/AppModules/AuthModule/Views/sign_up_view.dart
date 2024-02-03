import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/AppModules/AuthModule/ViewModels/auth_view_model.dart';
import 'package:demo/Utils/spaces.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Utils/app_btn.dart';
import '../../../Utils/edit_text_field.dart';
import '../../../Utils/utils.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  AuthViewModel authViewModel = Get.put(AuthViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
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
              controller: authViewModel.signUpName.value,
              hint: "Name",
              hintColor: Colors.grey,
            ),
            20.height,
            EditTextField(
              controller: authViewModel.signUpEmail.value,
              hint: "Email",
              hintColor: Colors.grey,
            ),
            20.height,
            EditTextField(
              controller: authViewModel.signUpPass.value,
              hint: "Password",
              hintColor: Colors.grey,
            ),
            30.height,
            AppBTN(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: authViewModel.signUpEmail.value.text,
                      password: authViewModel.signUpPass.value.text);
                  await FirebaseFirestore.instance
                      .collection("users")
                      .doc(authViewModel.signUpEmail.value.text)
                      .set(
                    {
                      "name": authViewModel.signUpName.value.text,
                      "email": authViewModel.signUpEmail.value.text,
                    },
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    Utils.showSnackBar(
                      title: "Password",
                      message: "Password is weak!",
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      icon: Icons.warning,
                    );
                  } else if (e.code == 'email-already-in-use') {
                    Utils.showSnackBar(
                      title: "Email",
                      message: "Account already exists!",
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      icon: Icons.warning,
                    );
                  }
                }
              },
              title: "Sign Up",
            ),
            30.height,
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
