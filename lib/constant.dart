import 'package:flutter/material.dart';
// color: Color.fromARGB(255, 235, 47, 122),

const kSearchTextFeild = InputDecoration(
  hintStyle: TextStyle(
    color: Color.fromARGB(255, 114, 113, 113),
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(19.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 87, 75, 151), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(19.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromARGB(255, 87, 75, 151), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(19.0)),
  ),
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

const kPlanetConatinerGradient = <Color>[
  Color.fromARGB(255, 164, 6, 69),
  Color(0xFF161426), //red
  // Color.fromARGB(255, 163, 40, 143),
  // Color.fromARGB(255, 3, 10, 47), //pink
  // Color.fromARGB(255, 30, 82, 204),
  // Color.fromARGB(255, 3, 10, 47), //blue
];
