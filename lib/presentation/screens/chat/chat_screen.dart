import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://m.media-amazon.com/images/M/MV5BNjAwN2NhMDctMTU0Yi00MWNjLWEyZjItY2Q2ODZiNTQ5YjU0XkEyXkFqcGdeQXVyMjAzMjcxNTE@._V1_.jpg'),
          ),
        ),
        title: const Text('Texto 1'),
      ),
      body: _ChatView(), // equivale a un div en html
    ); // el scafold es la estructura inicial de las aplicaciones
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// observar los cambios en la lista de mensajes
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      // define un area que no desborda con el norch del telefono
      child: Column(children: [
        Expanded(
            // toma todo el espacio proporcionado por el widget padre
            // se utiiliza ListView con el constructor builder para que crearlo en tienpo de ejecucion
            child: ListView.builder(
          controller:
              chatProvider.chatScrollController, // enlace con chat provider
          itemCount: chatProvider.messageList.length,
          itemBuilder: (context, index) {
            // muestra las burbujas con el texto
            final message = chatProvider.messageList[index];
            return (message.fromWho == FromWho.hers)
                ? const HerMessageBubble()
                : MyMessageBubble(message: message);
          },
        )),
        // caja de texto
        MessageFieldBox(onValue: (value) => chatProvider.sendMessage(value))
      ]),
    ));
  }
}
