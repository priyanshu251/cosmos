// 0)planet names are static     1)fix const item count of list builder     2)only min temp parameter is working

import 'package:astro_pro/constant.dart';
import 'package:astro_pro/services/api_data.dart';
import 'package:flutter/material.dart';
import 'planet_details.dart';

class PlanetList extends StatefulWidget {
  const PlanetList({super.key});

  @override
  State<PlanetList> createState() => _PlanetListState();
}

var planetData;
var planetDataLength;
int index = 0;
bool hasData = false;

class _PlanetListState extends State<PlanetList> {
  double? value;
  void updatePlanetList(double newValue) async {
    planetData = await APODModel().getPlanetData(newValue);
    planetDataLength = await APODModel().getPlanetDataLength(newValue);
    setState(() {
      if (index < planetDataLength) {
        index++;
      }
      value = newValue;
      hasData = true;
    });
  }

  @override
  void initState() {
    updatePlanetList(10);
    super.initState();
  }

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
                    // ExpansionTile(
                    //   tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                    //   title: const Text(
                    //     'Mass',
                    //     style: TextStyle(fontSize: 20),
                    //   ),
                    //   textColor: const Color.fromARGB(255, 30, 82, 204),
                    //   collapsedTextColor: Colors.white,
                    //   iconColor: Colors.white,
                    //   collapsedIconColor: Colors.white,
                    //   children: [
                    //     ExpandedPlanetParameters(
                    //         parameter: 'min:', onPress: updatePlanetList()),
                    //     ExpandedPlanetParameters(
                    //         parameter: '(x2):', onPress: updatePlanetList()),
                    //     ExpandedPlanetParameters(
                    //         parameter: 'max:', onPress: updatePlanetList()),
                    //   ],
                    // ),
                    // ExpansionTile(
                    //   tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                    //   title: const Text(
                    //     'Radius',
                    //     style: TextStyle(fontSize: 20),
                    //   ),
                    //   textColor: const Color.fromARGB(255, 30, 82, 204),
                    //   collapsedTextColor: Colors.white,
                    //   iconColor: Colors.white,
                    //   collapsedIconColor: Colors.white,
                    //   children: [
                    //     ExpandedPlanetParameters(
                    //         parameter: 'min:', onPress: updatePlanetList()),
                    //     ExpandedPlanetParameters(
                    //         parameter: '(x2):', onPress: updatePlanetList()),
                    //     ExpandedPlanetParameters(
                    //         parameter: 'max:', onPress: updatePlanetList()),
                    //   ],
                    // ),
                    ExpansionTile(
                      tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                      title: const Text(
                        'Temperature',
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: const Color.fromARGB(255, 39, 98, 236),
                      collapsedTextColor: Colors.white,
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      children: [
                        const Text(
                          '(x100 kelvin)',
                          style: TextStyle(
                              color: Color.fromARGB(255, 228, 228, 228)),
                        ),
                        ExpandedPlanetParameters(
                          parameter: 'min:',
                          onPress: (newValue) {
                            updatePlanetList(newValue * 100);
                          },
                        ),
                        ExpandedPlanetParameters(
                          parameter: 'max:',
                          onPress: (newValue) {
                            updatePlanetList(newValue * 100);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: hasData
                    ? ListView.builder(
                        itemCount: planetDataLength,
                        itemBuilder: (context, index) {
                          return PlanetCard(
                            screenHeight: screenHeight,
                            screenwidth: screenwidth,
                            planetName: planetData[index]['name'],
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandedPlanetParameters extends StatelessWidget {
  ExpandedPlanetParameters({required this.parameter, required this.onPress});
  final String parameter;
  final void Function(double) onPress;
  APODModel apodModel = APODModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        children: [
          Text(
            parameter,
            style: const TextStyle(color: Color.fromARGB(255, 228, 228, 228)),
          ),
          Expanded(
            child: Slider(
                activeColor: const Color.fromARGB(255, 39, 98, 236),
                value: 30,
                min: 0.3,
                max: 40.2,
                onChanged: onPress),
          )
        ],
      ),
    );
  }
}

class PlanetCard extends StatelessWidget {
  PlanetCard(
      {required this.screenHeight,
      required this.screenwidth,
      required this.planetName});

  final double screenHeight;
  final double screenwidth;
  final String planetName;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => PlanetDetails())));
      },
      child: Container(
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
      ),
    );
  }
}
