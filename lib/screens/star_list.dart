import 'package:astro_pro/constant.dart';
import 'package:astro_pro/services/api_data.dart';
import 'package:flutter/material.dart';
import 'planet_details.dart';
import 'star_details.dart';

class StarList extends StatefulWidget {
  const StarList({super.key});

  @override
  State<StarList> createState() => _StarListState();
}

int? length;
String? starName;
dynamic starData;
bool hasData = false;
bool? isStarData;

class _StarListState extends State<StarList> {
  APODModel apodModel = APODModel();

  bool appSwitchValue = true;
  bool absSwitchValue = true;
  double? minAppMagValue;
  double? maxAppMagValue;
  double? minAbsMagValue;
  double? maxAbsMagValue;

  void updateStarList(
    bool newAppSwitchValue,
    bool newAbsSwitchValue,
    double newMinAppMagValue,
    double newMaxAppMagValue,
    double newMinAbsMagValue,
    double newMaxAbsMagValue,
  ) async {
    if (newMinAppMagValue > newMaxAppMagValue) {
      double swap = newMinAppMagValue;
      newMinAppMagValue = newMaxAppMagValue;
      newMaxAppMagValue = swap;
    }
    if (newMinAbsMagValue > newMaxAbsMagValue) {
      double swap = newMinAbsMagValue;
      newMinAbsMagValue = newMaxAbsMagValue;
      newMaxAbsMagValue = swap;
    }
    starData = await APODModel().getStarData(
      newAppSwitchValue,
      newAbsSwitchValue,
      newMinAppMagValue,
      newMaxAppMagValue,
      newMinAbsMagValue,
      newMaxAbsMagValue,
    );
    setState(() {
      appSwitchValue = newAppSwitchValue;
      absSwitchValue = newAbsSwitchValue;
      minAppMagValue = newMinAppMagValue;
      maxAppMagValue = newMaxAppMagValue;
      minAbsMagValue = newMinAbsMagValue;
      maxAbsMagValue = newMaxAbsMagValue;
      if (starData != null) {
        hasData = true;
      } else {
        hasData = false;
      }
    });
  }

  @override
  void initState() {
    updateStarList(true, true, -26.76, 28.8, -12.87, 18.5);
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
                          hintText: 'Search star by name',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 87, 75, 151),
                          ),
                        ),
                        onChanged: (value) {
                          starName = value;
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () async {
                        var starDataByName =
                            await apodModel.starDataByName(starName!);
                        if (!mounted) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StarDetails(
                                starDetails: starDataByName, ind: 0),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 23,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            //This Container will remains constant
            Container(
              margin: const EdgeInsets.fromLTRB(16, 10, 16, 15),
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
                        const Text(
                          'Apparent Magnitude',
                          style: kExplorationButtonTextStyle,
                        ),
                        Switch(
                          value: appSwitchValue,
                          activeColor: const Color.fromARGB(255, 87, 75, 151),
                          onChanged: (newAppSwitchValue) {
                            setState(() {
                              appSwitchValue = newAppSwitchValue;
                            });
                            updateStarList(
                                newAppSwitchValue,
                                absSwitchValue,
                                minAppMagValue!,
                                maxAppMagValue!,
                                minAbsMagValue!,
                                maxAbsMagValue!);
                          },
                        ),
                      ],
                    ),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    children: [
                      ExpandedStarParameters(
                        parameter: 'min:',
                        initialSliderValue: 0,
                        minSliderValue: -26.76,
                        maxSliderValue: 28.8,
                        onPress: (newMinAppMagValue) {
                          updateStarList(
                              appSwitchValue,
                              absSwitchValue,
                              newMinAppMagValue,
                              maxAppMagValue!,
                              minAbsMagValue!,
                              maxAbsMagValue!);
                        },
                      ),
                      ExpandedStarParameters(
                        parameter: 'max:',
                        initialSliderValue: 0,
                        minSliderValue: -26.76,
                        maxSliderValue: 28.8,
                        onPress: (newMaxAppMagValue) {
                          updateStarList(
                              appSwitchValue,
                              absSwitchValue,
                              minAppMagValue!,
                              newMaxAppMagValue,
                              minAbsMagValue!,
                              maxAbsMagValue!);
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
                        const Text(
                          'Absolute Magnitude',
                          style: kExplorationButtonTextStyle,
                        ),
                        Switch(
                          value: absSwitchValue,
                          activeColor: const Color.fromARGB(255, 87, 75, 151),
                          onChanged: (newAbsSwitchValue) {
                            setState(() {
                              absSwitchValue = newAbsSwitchValue;
                            });
                            updateStarList(
                                appSwitchValue,
                                newAbsSwitchValue,
                                minAppMagValue!,
                                maxAppMagValue!,
                                minAbsMagValue!,
                                maxAbsMagValue!);
                          },
                        ),
                      ],
                    ),
                    iconColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    children: [
                      ExpandedStarParameters(
                        parameter: 'min:',
                        initialSliderValue: 0,
                        minSliderValue: -12.87,
                        maxSliderValue: 18.5,
                        onPress: (newMinAbsMagValue) {
                          updateStarList(
                              appSwitchValue,
                              absSwitchValue,
                              minAppMagValue!,
                              maxAppMagValue!,
                              newMinAbsMagValue,
                              maxAbsMagValue!);
                        },
                      ),
                      ExpandedStarParameters(
                        parameter: 'max:',
                        initialSliderValue: 0,
                        minSliderValue: -12.87,
                        maxSliderValue: 18.5,
                        onPress: (newMaxAbsMagValue) {
                          updateStarList(
                              appSwitchValue,
                              absSwitchValue,
                              minAppMagValue!,
                              maxAppMagValue!,
                              minAbsMagValue!,
                              newMaxAbsMagValue);
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
                  ? ListView.builder(
                      itemCount: (starData as List).length,
                      itemBuilder: (context, index) {
                        length = (starData as List).length;
                        return starCard(
                          screenHeight: screenHeight,
                          screenwidth: screenwidth,
                          starName: starData[index]['name'],
                          index: index,
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
    );
  }
}

class ExpandedStarParameters extends StatefulWidget {
  ExpandedStarParameters({
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
  State<ExpandedStarParameters> createState() => _ExpandedStarParametersState();
}

class _ExpandedStarParametersState extends State<ExpandedStarParameters> {
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
            style: const TextStyle(color: Color.fromARGB(255, 228, 228, 228)),
          ),
          Expanded(
            child: Slider(
              activeColor: const Color.fromARGB(255, 87, 75, 151),
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
          Text(
            sliderValue!.toStringAsFixed(2),
            style: const TextStyle(color: Color.fromARGB(255, 203, 202, 202)),
          ),
        ],
      ),
    );
  }
}

class starCard extends StatelessWidget {
  starCard(
      {required this.screenHeight,
      required this.screenwidth,
      required this.starName,
      required this.index});

  final double screenHeight;
  final double screenwidth;
  final String starName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => StarDetails(
                      starDetails: starData,
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
            starName,
            style: kExplorationButtonTextStyle.copyWith(fontSize: 21),
          ),
        ),
      ),
    );
  }
}
