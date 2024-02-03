import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  const EditTextField({super.key, required this.controller, required this.hint, required this.hintColor});

  final TextEditingController controller;
  final String hint;
  final Color hintColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
        hintStyle:  TextStyle(
          color: hintColor,
        )
      ),
    );
  }
}
