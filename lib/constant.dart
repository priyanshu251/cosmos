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
        // Color(0xFF2E365B),
        // Color(0xFF683352),
        // Color(0xFF0A0005),//pink
        Color(0xFF772E6B),
        Color(0xFF014D81), //bck2
        // Color.fromARGB(255, 5, 25, 123),
        // Color.fromARGB(255, 2, 9, 51), //blue
      ]),
);

const kGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      // Color.fromARGB(255, 168, 51, 86),
      // Color(0xFF595185),//pink
      Color.fromARGB(255, 166, 56, 148),
      Color.fromARGB(255, 6, 113, 185), //bck2
      // Color.fromARGB(255, 18, 69, 187),
      // Color.fromARGB(255, 8, 20, 84), //blue
    ]);
