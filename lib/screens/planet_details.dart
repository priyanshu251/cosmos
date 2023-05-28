import 'package:astro_pro/constant.dart';
import 'package:flutter/material.dart';

class PlanetDetails extends StatelessWidget {
  PlanetDetails({this.planetDetails, this.index});
  dynamic planetDetails;
  int? index;

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
                        colors: kPlanetConatinerGradient),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 350.0)),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.017,
                  left: screenWidth * 0.029,
                  child: Text(
                    '# $index',
                    style: kExplorationButtonTextStyle,
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
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
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
                  child: Text(
                    " ${planetDetails['name']}",
                    style: TextStyle(
                        fontSize: screenHeight * 0.041,
                        color: Colors.white,
                        fontFamily: 'PTSerif-Regular',
                        fontWeight: FontWeight.w300),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlanetDetailPanel(
                        'Mass (Jupiter)',
                        planetDetails['mass'].toString(),
                        screenWidth,
                        screenHeight),
                    PlanetDetailPanel(
                        'Radius (Jupiter)',
                        planetDetails['radius'].toString(),
                        screenWidth,
                        screenHeight),
                    PlanetDetailPanel(
                        'Period (Earth Days)',
                        planetDetails['period'].toString(),
                        screenWidth,
                        screenHeight),
                    // PlanetDetailPanel('Semi Major Axis',
                    //     planetDetails['semi_major_axis'].toString()),
                    PlanetDetailPanel(
                        'Temperatue (Kelvin)',
                        planetDetails['temperature'].toString(),
                        screenWidth,
                        screenHeight),
                    PlanetDetailPanel(
                        'Distance Light Year',
                        planetDetails['distance_light_year'].toString(),
                        screenWidth,
                        screenHeight),
                    PlanetDetailPanel(
                        'Hot Star Mass',
                        planetDetails['host_Star_mass'].toString(),
                        screenWidth,
                        screenHeight)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row PlanetDetailPanel(String detailName, String detailValue,
      double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${detailName}",
          style: kPlanetDetailLeftTextStyle.copyWith(
              fontFamily: 'Playfair', fontSize: screenWidth * 0.045),
          textAlign: TextAlign.left,
        ),
        Text(
          ':',
          style:
              kPlanetDetailLeftTextStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          detailValue,
          style: kPlanetDetailRightTextStyle.copyWith(
              fontFamily: 'Playfair', fontSize: screenWidth * 0.045),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
