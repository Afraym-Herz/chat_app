import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
   ChatBubble({super.key , required this.message });
  Message message ;
  @override
  Widget build(BuildContext context) {
    return Align(    
      alignment: Alignment.centerLeft ,
    child: Container(
       padding: const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: kPrimaryColor,
        decoration: const BoxDecoration(
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
        ) ,

        ),
        child: Text(message.message , style: const TextStyle(color: Colors.white),),

    ) 
    );
  }
}



class ChatBubbleForFriend extends StatelessWidget {
   ChatBubbleForFriend({super.key , required this.message });
  Message message ;
  @override
  Widget build(BuildContext context) {
    return Align(    
      alignment: Alignment.centerRight ,
    child: Container(
       padding: const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: kPrimaryColor,
        decoration: const BoxDecoration(
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
        ) ,

        ),
        child: Text(message.message , style: const TextStyle(color: Colors.white),),

    ) 
    );
  }
}