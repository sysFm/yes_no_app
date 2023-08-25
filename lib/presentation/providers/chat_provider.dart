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
// valida no enviar mensajes vacios
    if (text.isEmpty) return;

// agrega nuevos mensajes a mostrar
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    // actualiza el estado de la aplicacion para volver a renderizar la aplicacion
    notifyListeners();

    // ejecuta el scroll automatico
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    // retrasar 100 milisegundos
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
