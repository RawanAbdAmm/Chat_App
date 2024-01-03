import 'package:chatapp/Models/msgmodel.dart';
import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
 const Chatbubble({
    super.key,
    required this.mess
  });
 final Message mess;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:const EdgeInsets.only(left: 16, top: 16, bottom: 12,right: 32),
       
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 235, 165, 74),
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
        ),
        child: Text(mess.message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class ChatbubbleForfriend extends StatelessWidget {
 const ChatbubbleForfriend({
    super.key,
    required this.mess
  });
 final Message mess;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:const EdgeInsets.only(left: 16, top: 16, bottom: 12,right: 32),
       
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30)),
        ),
        child: Text(mess.message, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
