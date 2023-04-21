import 'package:flutter/material.dart';

const kExplorationButtonTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);

const kGradientDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        Color.fromARGB(255, 5, 25, 123),
        Color.fromARGB(255, 2, 9, 51),
      ]),
);

const kGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      // Color.fromARGB(255, 18, 139, 187),
      // Color.fromARGB(255, 17, 37, 153),
      Color.fromARGB(255, 18, 69, 187),
      Color.fromARGB(255, 8, 20, 84),
    ]);
