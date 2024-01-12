import 'package:chatapp/Constants/const.dart';
import 'package:chatapp/Models/msgmodel.dart';
import 'package:chatapp/Widgets/chatbubble.dart';
import 'package:chatapp/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Chatpage extends StatelessWidget {
  static String id = 'chatpage';

  const Chatpage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllertext = TextEditingController();
    CollectionReference messages =
        FirebaseFirestore.instance.collection(messageCollections);
    final controller = ScrollController();
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kcreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> msglist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              msglist.add(
                Message.fromjason(
                  snapshot.data!.docs[i],
                ),
              );
            }
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Chat '), Text('App')],
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      _signOut(context);
                    },
                    icon: const Icon(Icons.logout_outlined),
                  )
                ],
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: controller,
                      itemCount: msglist.length,
                      itemBuilder: (context, index) {
                        return msglist[index].id == email
                            ? Chatbubble(
                                mess: msglist[index],
                              )
                            : ChatbubbleForfriend(mess: msglist[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                              controller: controllertext,
                              onChanged: (data) {
                                controllertext.text = data;
                              },
                              decoration: InputDecoration(
                                hintText: 'Message',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              )),
                        ),
                        IconButton(
                          onPressed: () {
                            messages.add(
                              {
                                kmessage: controllertext.text,
                                kcreatedAt: DateTime.now(),
                                'id': email
                              },
                            );
                            controllertext.clear();
                            controller.animateTo(0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          },
                          icon: const Icon(Icons.send),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const ModalProgressHUD(
              inAsyncCall: true,
              child: Scaffold(),
            );
          }
        });
  }

  _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginPage.id, (Route<dynamic> route) => false);
  }
}
