import 'package:flutter/material.dart';

Color colorNameCard(String nameCard) {
  switch (nameCard) {
    case 'Etsalat':
      return Colors.green;
    case 'Vodafon':
      return Colors.red;
    case 'Orange':
      return Colors.orange;
    case 'We':
      return Colors.purpleAccent;
    default:
      break;
  }
  return Colors.yellow;
}
