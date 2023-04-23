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
        // Color.fromRGBO(229, 115, 79, 1),
        // Color.fromRGBO(155, 72, 44, 1),
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
      Color.fromARGB(
          255, 18, 69, 187), //rgba(229,115,79,255)//rgba(159,72,46,255)
      Color.fromARGB(255, 8, 20, 84),
    ]);
