import 'package:flutter/material.dart';

/// Categories data
///
/// Class to manage categories data like images, text and colors.
class AppCategories {
  /// Constant messages per category
  static const Map<String, String> categoryMessage = {
    'Vivienda':
        'Por medio de acciones diarias iremos cambiando nuestros hábitos y estilos de vida. Estos directamente se verán reflejados en nuestra vivienda y formatos de consumo. Sigue el camino Rewind y poco a poco veras como estas se verán reflejadas en tu forma de vida.',
    'Compras':
        'La diversión no es sinónimo de consumismo. El consumo responsable y la economía circular son dos de las grandes bases de este maravilloso estilo de vida. Con Rewind poco a poco incorporarás estos conceptos en tu vida para siempre.',
    'Movilidad':
        'Entendemos que viajar, sea por ocio o trabajo, es difícil de cambiar pero podemos generar acciones graduales e ir impactando poco a poco. Con Rewind verás que existen muchas maneras de viajar e impactar positivamente',
    'Alimentación':
        'Cambiar los hábitos alimenticios es una de las cosas más difíciles que hay. Vivimos en una época donde las opciones son ilimitadas, tomar acción y consumir aquellas que aportan al medio ambiente y nuestra salud es nuestra responsabilidad.',
    'Ocio':
        'La diversión no es sinónimo de consumismo. El consumo responsable y la economía circular son dos de las grandes bases de este maravilloso estilo de vida. Con Rewind poco a poco incorporarás estos conceptos en tu vida para siempre.',
  };

  /// Color to each category
  static Map<String, Color> categoriesColor = const {
    'Vivienda': Color(0xffFA9B5B),
    'Compras': Color(0xff94CEE4),
    'Movilidad': Color(0xff91B175),
    'Alimentación': Color(0xffD1A3D6),
    'Ocio': Color(0xffEFC88F),
  };
}
