import 'dart:math';

import 'package:flutter/material.dart';

List<String> colorsList = ['red', 'green', 'blue', 'orange'];

String getRandomColorName() {
  final random = Random();
  final randomInt = random.nextInt(4);
  return colorsList[randomInt];
}

Color getTextColor(String text) {
  switch (text) {
    case 'red':
      return Colors.red.shade900;
    case 'green':
      return Colors.green.shade900;
    case 'blue':
      return Colors.blue.shade900;
    case 'orange':
      return Colors.orange.shade900;
    default:
      return Colors.orange.shade900;
  }
}

Color getColor(String text) {
  switch (text) {
    case 'red':
      return Colors.red.shade300;
    case 'green':
      return Colors.green.shade300;
    case 'blue':
      return Colors.blue.shade300;
    case 'orange':
      return Colors.orange.shade300;
    default:
      return Colors.orange.shade300;
  }
}
