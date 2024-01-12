// ignore_for_file: unused_local_variable

import 'package:chatapp/Widgets/login_image.dart';
import 'package:chatapp/Widgets/custom_button.dart';
import 'package:chatapp/Widgets/customTextField.dart';
import 'package:chatapp/helper/showdialog.dart';
import 'package:chatapp/screens/chatpage.dart';
import 'package:chatapp/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = 'Loginpage';

  @override
  State<LoginPage> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              const LoginImage(
                image: 'images/6310507.jpg',
                text: 'Login',
              ),
              const SizedBox(
                height: 30,
              ),
              Custom_TextField(
                onchanged: (data) {
                  email = data;
                },
                labeltext: 'Email',
                icon: const Icon(Icons.email_outlined),
                visible: false,
              ),
              const SizedBox(
                height: 15,
              ),
              Custom_TextField(
                onchanged: (data) {
                  password = data;
                },
                labeltext: 'Password',
                icon: const Icon(Icons.password_outlined),
                visible: true,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      String errorMessage = '';

                      try {
                        await CreateUserwithEmailandPass();
                        Navigator.pushNamed(context, Chatpage.id,
                            arguments: email);
                        isLoading = true;
                        setState(() {});
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'invalid-credential') {
                          errorMessage = ('Email or password is wrong');
                        }

                        isLoading = false;

                        setState(() {});

                        showerrmsg(context, 'Login Error', errorMessage);
                      }
                    } else {}
                  },
                  child: const Text('Login')),
              CustomButton(
                question: 'don\'t have an account?',
                nameofbutton: 'Sign Up',
                onpressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) =>const RegisterScreen()),
                  );
                },
              )
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> CreateUserwithEmailandPass() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
