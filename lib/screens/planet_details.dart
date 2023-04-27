import 'dart:ffi';

import 'package:astro_pro/constant.dart';
import 'package:flutter/material.dart';

class PlanetDetails extends StatelessWidget {
  const PlanetDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(24, 25, 32, 1),
        body: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: screenHeight * 0.68,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Color.fromARGB(255, 30, 82, 204),
                          Color.fromARGB(255, 3, 10, 47),
                        ]),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 350.0)),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.017,
                  left: screenWidth * 0.029,
                  child: const Text(
                    '#1',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Positioned(
                  right: screenWidth * 0,
                  top: screenHeight * 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    splashColor:
                        const Color.fromRGBO(37, 42, 52, 1).withOpacity(0.8),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.11,
                  child: const Text(
                    'Planet',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.274,
                  child: const CircleAvatar(
                    radius: 130, //use media query
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/planet_pic.jpg'),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.17,
                  child: const Text(
                    'Jupiter',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(37, 42, 52, 1).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(25),
                ),
                width: screenWidth,
                height: screenHeight * 0.22,
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Text(
                        'Name : Jupiter',
                        style: kExplorationButtonTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//to curve appBar :
// appBar: AppBar(
        //   title: const Text('Anything'),
        //   backgroundColor: Colors.blue,
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(
        //       bottom: Radius.circular(30),
        //     ),
        //   ),
        // ),