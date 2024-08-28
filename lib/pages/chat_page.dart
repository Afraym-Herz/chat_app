import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});
 
 final CollectionReference messages =  FirebaseFirestore.instance.collection(kMessageReference) ;
  static String id = 'ChatPage' ;
  final ScrollController _controller = ScrollController() ;
 final TextEditingController controller = TextEditingController() ;
  @override
  Widget build(BuildContext context) {
     var email = ModalRoute.of(context)!.settings.arguments ;

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt , descending: true ).snapshots() ,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<Message> messagesList = [] ;
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.formJson(snapshot.data!.docs[i]) );
          }
        return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Image.asset(kLogo , width: 60, height: 60 ),
            const SizedBox(width: 10,) ,
            const Text("Chat"),
          ],
        ),
      ),
      body : Column(
        children : [
         Expanded( 
        child : ListView.builder (
        controller : _controller , 
        itemBuilder: (context, index){
         return messagesList[index].id == email? ChatBubble(message: messagesList[index] ) 
         : ChatBubbleForFriend(message:messagesList[index] ) ;
        },
    )
    ),
    Padding(
      padding : const EdgeInsets.all(16) ,
     child : TextField(
      onSubmitted : (data){
        messages.add({
          kMessageReference: data ,
          kCreatedAt : DateTime.now(), 
          kId : email ,
          }) ;
        controller.clear();
        _controller.animateTo(
          0 
          , duration: const Duration(seconds: 3) ,
           curve: Curves.easeIn) ;
      },
      decoration : InputDecoration (
        hintText: "send message",
        suffixIcon: const Icon(
          Icons.send ,
          color: kPrimaryColor,
          ) ,
        border : OutlineInputBorder(
          borderRadius : BorderRadius.circular(16) ,
        ) ,
        enabledBorder : OutlineInputBorder(
          borderRadius : BorderRadius.circular(16) ,
        ) ,
      ) ,
    ),
    ),
     ]
     )
    );} 
    else {
      return const Text("Loading..") ;
     }
      },
    );
  }
}