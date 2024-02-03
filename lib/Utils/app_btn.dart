import 'package:flutter/material.dart';

class AppBTN extends StatelessWidget {
  const AppBTN(
      {super.key,
       this.height=45,
       this.width=100,
      required this.onPressed,
       this.color=Colors.green,
       this.textColor=Colors.white,
      required this.title});

  final double height;
  final double width;
  final onPressed;
  final Color color;
  final Color textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
