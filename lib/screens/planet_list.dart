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

dynamic planetData;
bool hasData = false;
bool? isPlanetData;

class _PlanetListState extends State<PlanetList> {
  double? minTempValue;
  double? maxTempValue;
  void updatePlanetList(double newMinTempValue, double newMaxTempValue) async {
    if (newMinTempValue > newMaxTempValue) {
      double swap = newMinTempValue;
      newMinTempValue = newMaxTempValue;
      newMaxTempValue = swap;
    }
    planetData =
        await APODModel().getPlanetData(newMinTempValue, newMaxTempValue);
    setState(() {
      minTempValue = newMinTempValue;
      maxTempValue = newMaxTempValue;
      if (planetData != null) {
        hasData = true;
      } else {
        hasData = false;
      }
    });
  }

  @override
  void initState() {
    updatePlanetList(30, 4050);
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
                margin: const EdgeInsets.fromLTRB(16, 10, 16, 10),
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
                          onPress: (newMinTempValue) {
                            updatePlanetList(
                                newMinTempValue * 100, maxTempValue!);
                          },
                        ),
                        ExpandedPlanetParameters(
                          parameter: 'max:',
                          onPress: (newMaxTempValue) {
                            updatePlanetList(
                                minTempValue!, newMaxTempValue * 100);
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
                        itemCount: (planetData as List).length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PlanetDetails()));
                            },
                            child: PlanetCard(
                              screenHeight: screenHeight,
                              screenwidth: screenwidth,
                              planetName: planetData[index]['name'],
                            ),
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

class ExpandedPlanetParameters extends StatefulWidget {
  ExpandedPlanetParameters({required this.parameter, required this.onPress});
  final String parameter;
  final void Function(double) onPress;

  @override
  State<ExpandedPlanetParameters> createState() =>
      _ExpandedPlanetParametersState();
}

class _ExpandedPlanetParametersState extends State<ExpandedPlanetParameters> {
  APODModel apodModel = APODModel();

  double sliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        children: [
          Text(
            widget.parameter,
            style: const TextStyle(color: Color.fromARGB(255, 228, 228, 228)),
          ),
          Expanded(
            child: Slider(
              activeColor: const Color.fromARGB(255, 39, 98, 236),
              value: sliderValue,
              min: 0.39,
              max: 40.5,
              // label: sliderValue.toStringAsFixed(1),
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;
                });
                widget.onPress(
                    newValue); //why even after raeching at minimum and maximum value the slider keeps updating the value that to the same number
              },
            ),
          ),
          Text(
            sliderValue.toStringAsFixed(1), // Display slider value
            style: const TextStyle(color: Colors.white),
          ),
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
