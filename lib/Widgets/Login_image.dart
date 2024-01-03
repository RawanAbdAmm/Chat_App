import 'package:flutter/material.dart';

class Login_Image extends StatelessWidget {
final String text;
final String image;

  const Login_Image({super.key, required this.text, required this.image,  });

  @override
  Widget build(BuildContext context) {
    return Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(image),
               Positioned(
                top: 60,
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 30, color: Color.fromARGB(132, 0, 0, 0)),
                ),
              ),
            ],

    );
  }
}
