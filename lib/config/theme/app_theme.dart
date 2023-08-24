import 'package:flutter/material.dart';

// las variables con _ son variables privadas
const Color _customColor = Color(0xFF49149F);

// lista de colores del tema de la aplicacion
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
// validaciones de colores permitidos
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Colors must be between 0 and ${_colorThemes.length}'); // con las aserciones se valida que sea mayor que 0

// metodo que retorma tipo theme
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
