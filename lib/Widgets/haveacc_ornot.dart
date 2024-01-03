// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  final String nameofbutton;
  final String haveornot;
  VoidCallback? onpressed;
  LoginImage({
    this.onpressed,
    required this.haveornot,
    required this.nameofbutton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(haveornot),
        TextButton(onPressed: onpressed, child:  Text(nameofbutton))
      ],
    );
  }
}
