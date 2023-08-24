import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController =
        TextEditingController(); // maneja o manipula eventos cuando es asociado a un TextFormField
    // hacer focus a un elemento
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(35));

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              // utilizando la relacion hecha con textController se obtiene el valor de input
              final textValue = textController.value.text;
              textController.clear();
              onValue(textValue);
            },
            icon: const Icon(Icons.send_outlined)));

    return TextFormField(
        onTapOutside: (event) {
          focusNode
              .unfocus(); // remueve el foco cuando se hace clic fuere del TextFormField
        },
        focusNode:
            focusNode, // mantiene el foco luego de presionar el enter en el teclado
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          textController.clear();
          // hacer foco
          focusNode.requestFocus();
          onValue(value);
        });
  }
}
