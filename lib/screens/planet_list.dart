import 'package:astro_pro/constant.dart';
import 'package:flutter/material.dart';
import 'planet_details.dart';

class PlanetList extends StatelessWidget {
  const PlanetList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(24, 25, 32, 1),
        body: Container(
          child: Column(
            children: <Widget>[
              //This Container will remains constant
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(37, 42, 52, 1).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                      title: const Text(
                        'Mass',
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: const Color.fromARGB(255, 30, 82, 204),
                      collapsedTextColor: Colors.white,
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      children: [
                        ExpandedPlanetParameters(parameter: 'min:'),
                        ExpandedPlanetParameters(parameter: 'max:'),
                      ],
                    ),
                    ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                      title: const Text(
                        'Radius',
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: const Color.fromARGB(255, 30, 82, 204),
                      collapsedTextColor: Colors.white,
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      children: [
                        ExpandedPlanetParameters(parameter: 'min:'),
                        ExpandedPlanetParameters(parameter: 'max:'),
                      ],
                    ),
                    ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                      title: const Text(
                        'Orbital Period',
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: const Color.fromARGB(255, 30, 82, 204),
                      collapsedTextColor: Colors.white,
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      children: [
                        ExpandedPlanetParameters(parameter: 'min:'),
                        ExpandedPlanetParameters(parameter: 'max:'),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  //This is Scrollable Container
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlanetDetails()),
                            );
                          },
                          child: PlanetCard(
                              planetName: '# Planet: 1',
                              screenHeight: screenHeight,
                              screenwidth: screenwidth),
                        ),
                        PlanetCard(
                            planetName: '# Planet: 1',
                            screenHeight: screenHeight,
                            screenwidth: screenwidth),
                        PlanetCard(
                            planetName: '# Planet: 1',
                            screenHeight: screenHeight,
                            screenwidth: screenwidth),
                        PlanetCard(
                            planetName: '# Planet: 1',
                            screenHeight: screenHeight,
                            screenwidth: screenwidth),
                        PlanetCard(
                            planetName: '# Planet: 1',
                            screenHeight: screenHeight,
                            screenwidth: screenwidth),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlanetCard extends StatelessWidget {
  const PlanetCard(
      {required this.screenHeight,
      required this.screenwidth,
      required this.planetName});

  final double screenHeight;
  final double screenwidth;
  final String planetName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: screenHeight * 0.1,
      width: screenwidth * 1,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(37, 42, 52, 1).withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        planetName,
        style: kExplorationButtonTextStyle,
      ),
    );
  }
}

class ExpandedPlanetParameters extends StatelessWidget {
  ExpandedPlanetParameters({required this.parameter});
  final String parameter;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        children: [
          Text(
            parameter,
            style: const TextStyle(color: Color.fromARGB(255, 228, 228, 228)),
          ),
          Expanded(
            child: Slider(
              activeColor: const Color.fromARGB(255, 30, 82, 204),
              value: 0.5,
              min: 0.0,
              max: 1.0,
              onChanged: (value) {},
            ),
          )
        ],
      ),
    );
  }
}
