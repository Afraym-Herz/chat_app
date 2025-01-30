import 'package:bloc/bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  List<Message> messagesList = [];

  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageReference);
  void sendMessage({required String message, required String email}) {
    try {
      messages.add({
        kMessageReference: message,
        kCreatedAt: DateTime.now(),
        kId: email,
      });
      emit(ChatSuccess(messagesList: messagesList));
    } catch (e) {}
  }

  void getMessage() {
    

    messages.orderBy(kCreatedAt, descending: true).snapshots().listen(
      (event) {
        messagesList.clear() ;
        for (var doc in event.docs) {
          messagesList.add(Message.formJson(doc));
        }
        emit(ChatSuccess(messagesList: messagesList));
      },
    );
  }
}
