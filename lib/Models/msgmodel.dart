import 'package:chatapp/Constants/const.dart';

class Message{
  final String message;
final  String id ;
  Message(this.message, this.id);
  factory Message.fromjason(jsonData){
    return Message(jsonData[kmessage],jsonData['id']);
  }
}