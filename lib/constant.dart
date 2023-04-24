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
        // Color.fromRGBO(155, 72, 44, 1), //orange
        Color.fromARGB(255, 5, 25, 123),
        Color.fromARGB(255, 2, 9, 51), //blue
        // Color.fromRGBO(48, 108, 96, 1),
        // Color.fromRGBO(17, 54, 48, 1),
        // Color.fromRGBO(6, 23, 21, 1), //teal
      ]),
);

const kGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      // Color.fromARGB(255, 18, 139, 187),
      // Color.fromARGB(255, 17, 37, 153),
      Color.fromARGB(255, 18, 69, 187),
      Color.fromARGB(255, 8, 20, 84), //blue
      // Color.fromRGBO(55, 117, 104, 1),
      // Color.fromRGBO(28, 72, 65, 1),
      // Color.fromRGBO(11, 41, 38, 1), //teal
    ]);
