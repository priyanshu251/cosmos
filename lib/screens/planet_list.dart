//1)initial planet does not match initial slider values
//3)radius parameter not working accurately   4)add pop-up to show slider value
//5) somewhere i am assinging wrong value of minrad iam assinging it to newmaxrad

import 'package:astro_pro/constant.dart';
import 'package:astro_pro/services/api_data.dart';
import 'package:flutter/material.dart';
import 'planet_details.dart';
import 'dart:math';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanetList extends StatefulWidget {
  const PlanetList({super.key});

  @override
  State<PlanetList> createState() => _PlanetListState();
}

int? length;
String? planetName;
dynamic planetData;
bool hasData = false;
bool? isPlanetData;

class _PlanetListState extends State<PlanetList> {
  APODModel apodModel = APODModel();

  bool massSwitchValue = true;
  bool radSwitchValue = true;
  bool tempSwitchValue = true;
  double? minMassValue;
  double? maxMassValue;
  double? minRadValue;
  double? maxRadValue;
  double? minTempValue;
  double? maxTempValue;

  void updatePlanetList(
      bool newMassSwitchValue,
      bool newRadSwitchValue,
      bool newTempSwitchValue,
      double newMinMassValue,
      double newMaxMassValue,
      double newMinRadValue,
      double newMaxRadValue,
      double newMinTempValue,
      double newMaxTempValue) async {
    if (newMinMassValue > newMaxMassValue) {
      double swap = newMinMassValue;
      newMinMassValue = newMaxMassValue;
      newMaxMassValue = swap;
    }
    if (newMinRadValue > newMaxRadValue) {
      double swap = newMinRadValue;
      newMinRadValue = newMaxRadValue;
      newMaxRadValue = swap;
    }
    if (newMinTempValue > newMaxTempValue) {
      double swap = newMinTempValue;
      newMinTempValue = newMaxTempValue;
      newMaxTempValue = swap;
    }
    planetData = await APODModel().getPlanetData(
        newMassSwitchValue,
        newRadSwitchValue,
        newTempSwitchValue,
        newMinMassValue,
        newMaxMassValue,
        newMinRadValue,
        newMaxRadValue,
        newMinTempValue,
        newMaxTempValue);
    setState(() {
      massSwitchValue = newMassSwitchValue;
      radSwitchValue = newRadSwitchValue;
      tempSwitchValue = newTempSwitchValue;
      minMassValue = newMinMassValue;
      maxMassValue = newMaxMassValue;
      minRadValue = newMinRadValue;
      maxRadValue = newMaxRadValue;
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
    updatePlanetList(true, true, true, 0.000007, 60, 0.0009, 7, 39, 4050);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(24, 25, 32, 1),
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 16, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(17, 5, 17, 0),
                      // width: screenwidth * 0.8,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(37, 42, 52, 1)
                            .withOpacity(0.8),
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: kSearchTextFeild.copyWith(
                          hintText: 'Search planet by name',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.white60,
                          ),
                        ),
                        onChanged: (value) {
                          planetName = value;
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      var planetDataByName =
                          await apodModel.planetDataByName(planetName!);
                      if (!mounted) return;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PlanetDetails(
                            planetDetails: planetDataByName,
                            ind: 0,
                          ),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                    ),
                  ),
                ],
              ),
            ),
            //This Container will remains constant
            Container(
              margin: const EdgeInsets.fromLTRB(16, 10, 16, 7),
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(37, 42, 52, 1).withOpacity(0.8),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                    maintainState: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mass',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 18),
                        ),
                        Switch(
                          value: massSwitchValue,
                          activeColor: const Color.fromARGB(255, 87, 75, 151),
                          onChanged: (newMassSwitchValue) {
                            setState(() {
                              massSwitchValue = newMassSwitchValue;
                            });
                            updatePlanetList(
                                newMassSwitchValue,
                                radSwitchValue,
                                tempSwitchValue,
                                minMassValue!,
                                maxMassValue!,
                                minRadValue!,
                                maxRadValue!,
                                minTempValue!,
                                maxTempValue!);
                          },
                        ),
                      ],
                    ),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    children: [
                      ExpandedPlanetParameters(
                        parameter: 'min:',
                        initialSliderValue: -7.5,
                        minSliderValue: -11.8839,
                        maxSliderValue: 4.0943,
                        onPress: (newMinmassValue) {
                          updatePlanetList(
                              massSwitchValue,
                              radSwitchValue,
                              tempSwitchValue,
                              exp(newMinmassValue),
                              maxMassValue!,
                              minRadValue!,
                              maxRadValue!,
                              minTempValue!,
                              maxTempValue!);
                        },
                      ),
                      ExpandedPlanetParameters(
                        parameter: 'max:',
                        initialSliderValue: -7.5,
                        minSliderValue: -11.8839,
                        maxSliderValue: 4.1,
                        onPress: (newMaxMassValue) {
                          updatePlanetList(
                              massSwitchValue,
                              radSwitchValue,
                              tempSwitchValue,
                              minMassValue!,
                              exp(newMaxMassValue),
                              minRadValue!,
                              maxRadValue!,
                              minTempValue!,
                              maxTempValue!);
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                    maintainState: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Radius',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 18),
                        ),
                        Switch(
                          value: radSwitchValue,
                          activeColor: const Color.fromARGB(255, 87, 75, 151),
                          onChanged: (newRadSwitchValue) {
                            setState(() {
                              radSwitchValue = newRadSwitchValue;
                            });
                            updatePlanetList(
                                massSwitchValue,
                                newRadSwitchValue,
                                tempSwitchValue,
                                minMassValue!,
                                maxMassValue!,
                                minRadValue!,
                                maxRadValue!,
                                minTempValue!,
                                maxTempValue!);
                          },
                        ),
                      ],
                    ),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    children: [
                      ExpandedPlanetParameters(
                        parameter: 'min:',
                        initialSliderValue: -5,
                        minSliderValue: -7.0131,
                        maxSliderValue: 1.9459,
                        onPress: (newMinRadValue) {
                          updatePlanetList(
                              massSwitchValue,
                              radSwitchValue,
                              tempSwitchValue,
                              minMassValue!,
                              maxMassValue!,
                              exp(newMinRadValue),
                              maxRadValue!,
                              minTempValue!,
                              maxTempValue!);
                        },
                      ),
                      ExpandedPlanetParameters(
                        parameter: 'max:',
                        initialSliderValue: -5,
                        minSliderValue: -7.0131,
                        maxSliderValue: 1.9459,
                        onPress: (newMaxRadValue) {
                          updatePlanetList(
                              massSwitchValue,
                              radSwitchValue,
                              tempSwitchValue,
                              minMassValue!,
                              maxMassValue!,
                              minRadValue!,
                              exp(newMaxRadValue),
                              minTempValue!,
                              maxTempValue!);
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                    maintainState: true,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Temperature',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 18),
                        ),
                        Switch(
                          value: tempSwitchValue,
                          activeColor: const Color.fromARGB(255, 87, 75, 151),
                          onChanged: (newTempSwitchValue) {
                            setState(() {
                              tempSwitchValue = newTempSwitchValue;
                            });
                            updatePlanetList(
                                massSwitchValue,
                                radSwitchValue,
                                newTempSwitchValue,
                                minMassValue!,
                                maxMassValue!,
                                minRadValue!,
                                maxRadValue!,
                                minTempValue!,
                                maxTempValue!);
                          },
                        ),
                      ],
                    ),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    children: [
                      ExpandedPlanetParameters(
                        parameter: 'min:',
                        initialSliderValue: 5.5,
                        minSliderValue: 3.6376,
                        maxSliderValue: 8.3067,
                        onPress: (newMinTempValue) {
                          updatePlanetList(
                              massSwitchValue,
                              radSwitchValue,
                              tempSwitchValue,
                              minMassValue!,
                              maxMassValue!,
                              minRadValue!,
                              maxRadValue!,
                              exp(newMinTempValue),
                              maxTempValue!);
                        },
                      ),
                      ExpandedPlanetParameters(
                        parameter: 'max:',
                        initialSliderValue: 5.5,
                        minSliderValue: 3.6376,
                        maxSliderValue: 8.3067,
                        onPress: (newMaxTempValue) {
                          updatePlanetList(
                              massSwitchValue,
                              radSwitchValue,
                              tempSwitchValue,
                              minMassValue!,
                              maxMassValue!,
                              minRadValue!,
                              maxRadValue!,
                              minTempValue!,
                              exp(newMaxTempValue));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Text(
            //   'List Of Planets With Matching Statistics',
            //   style: TextStyle(
            //       color: Color.fromARGB(255, 177, 171, 171),
            //       fontSize: screenHeight * 0.0222,
            //       fontWeight: FontWeight.w400),
            // ),
            Expanded(
              child: hasData
                  ? AnimationLimiter(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: (planetData as List).length,
                        itemBuilder: (context, index) {
                          length = (planetData as List).length;
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 1000),
                            child: SlideAnimation(
                              verticalOffset: 80.0,
                              child: FadeInAnimation(
                                child: PlanetCard(
                                  screenHeight: screenHeight,
                                  screenwidth: screenwidth,
                                  planetName: planetData[index]['name'],
                                  index: index,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedPlanetParameters extends StatefulWidget {
  ExpandedPlanetParameters({
    required this.parameter,
    required this.initialSliderValue,
    required this.minSliderValue,
    required this.maxSliderValue,
    required this.onPress,
  });

  final String parameter;
  double initialSliderValue;
  final double minSliderValue;
  final double maxSliderValue;
  final void Function(double) onPress;

  @override
  State<ExpandedPlanetParameters> createState() =>
      _ExpandedPlanetParametersState();
}

class _ExpandedPlanetParametersState extends State<ExpandedPlanetParameters> {
  APODModel apodModel = APODModel();
  double? sliderValue;

  @override
  void initState() {
    super.initState();
    sliderValue = widget.initialSliderValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Row(
        children: [
          Text(
            widget.parameter,
          ),
          Expanded(
            child: SliderTheme(
              data: Theme.of(context).sliderTheme,
              child: Slider(
                value: sliderValue!,
                min: widget.minSliderValue,
                max: widget.maxSliderValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
                onChangeEnd: (newValue) {
                  setState(() {
                    sliderValue = newValue;
                  });
                  widget.onPress(
                      newValue); //why even after reaching at minimum and maximum value the slider keeps updating the value that to the same number
                },
              ),
            ),
          ),
          Text(
            exp(sliderValue!).toStringAsFixed(6),
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
      required this.planetName,
      required this.index});

  final double screenHeight;
  final double screenwidth;
  final String planetName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => PlanetDetails(
                      planetDetails: planetData,
                      length: length,
                      ind: index,
                    ))));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 10, 16, 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: screenHeight * 0.1,
        width: screenwidth * 1,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(37, 42, 52, 1).withOpacity(0.8),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            planetName,
            style: GoogleFonts.exo(
                textStyle: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }
}
