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
        Color(0xFF772E6B),
        Color(0xFF014D81),
      ]),
);

const kGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color.fromARGB(255, 166, 56, 148),
      Color.fromARGB(255, 6, 113, 185), //pink
    ]);

const kRedGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color.fromARGB(255, 168, 51, 86),
      Color(0xFF595185), //red
    ]);

const kBlueGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: <Color>[
      Color.fromARGB(255, 18, 69, 187),
      Color.fromARGB(255, 8, 20, 84), //blue
    ]);

const kPlanetConatinerGradient = <Color>[
  Color.fromARGB(255, 164, 6, 69),
  Color(0xFF161426), //red
  // Color.fromARGB(255, 163, 40, 143),
  // Color.fromARGB(255, 3, 10, 47), //pink
  // Color.fromARGB(255, 30, 82, 204),
  // Color.fromARGB(255, 3, 10, 47), //blue
];
