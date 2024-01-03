// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  final String question;
  final String nameofbutton;

  VoidCallback? onpressed;

  Custom_Button({
    super.key,
    this.onpressed,
    required this.question,
    required this.nameofbutton,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question),
        TextButton(onPressed:onpressed, child: Text(nameofbutton))
      ],
    );
  }
}
