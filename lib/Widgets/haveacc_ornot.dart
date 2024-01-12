import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  final String nameofbutton;
  final String haveornot;
  final VoidCallback? onpressed;
  const LoginImage({
    super.key,
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
        TextButton(onPressed: onpressed, child: Text(nameofbutton))
      ],
    );
  }
}
