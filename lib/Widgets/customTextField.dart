
import 'package:flutter/material.dart';

class Custom_TextField extends StatelessWidget {
  final String labeltext;
  final Icon icon;
  final bool visible;
  Function(String)? onchanged;

   Custom_TextField(
      {super.key,
      required this.labeltext,
      required this.icon,
      required this.visible,this.onchanged});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(

        validator: (value) {
          if(value!.isEmpty){
            return 'Field Can\'t be empty';
          }
          return null;

        },
        onChanged: onchanged,
        obscureText: visible,
        decoration: InputDecoration(
          labelText: labeltext,
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
