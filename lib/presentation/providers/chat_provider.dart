// los provider se utilizan para manejar los estados
import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

// ChangeNotifier notifica cuando se realiza algun cambio
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola!', fromWho: FromWho.me),
    Message(text: 'Ya salio del trabajo?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
// agrega nuevos mensajes a mostrar
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    // actualiza el estado de la aplicacion para volver a renderizar la aplicacion
    notifyListeners();
  }
}
