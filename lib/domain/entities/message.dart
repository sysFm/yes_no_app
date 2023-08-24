// en los archivo que se encuentran dentro de la carpeta domain es codigo dart puro

enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

// se agrega {} para convertirlos en parametros con nombre
  Message({required this.text, this.imageUrl, required this.fromWho});
}
