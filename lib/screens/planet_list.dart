import 'package:astro_pro/constant.dart';
import 'package:flutter/material.dart';

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
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(37, 42, 52, 1).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(children: [
                  PlanetParameterTile(parameter: 'Mass: '),
                  PlanetParameterTile(
                    parameter: 'Radius: ',
                  ),
                  PlanetParameterTile(
                    parameter: 'Temperature: ',
                  ),
                ]),
              ),
              Expanded(
                child: SingleChildScrollView(
                  //This is Scrollable Container
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: Column(
                      children: [
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

class PlanetParameterTile extends StatelessWidget {
  PlanetParameterTile({required this.parameter});
  String parameter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          parameter,
          style: kExplorationButtonTextStyle,
        ),
        Slider(
          value: 0.5,
          min: 0,
          max: 1,
          activeColor: const Color.fromARGB(255, 18, 69, 187),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
