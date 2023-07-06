import 'package:astro_pro/constant.dart';
import 'package:flutter/material.dart';

class StarDetails extends StatefulWidget {
  StarDetails({this.starDetails, this.ind, this.length});
  dynamic starDetails;
  int? length;
  int? ind;

  @override
  State<StarDetails> createState() => _StarDetailsState();
}

class _StarDetailsState extends State<StarDetails> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
                    '# ${widget.ind}',
                  ),
                ),
                Positioned(
                  right: screenWidth * 0,
                  top: screenHeight * 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
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
                    'Star',
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
                    widget.starDetails[widget.ind]['name'],
                    style: TextStyle(
                        fontSize: screenHeight * 0.041,
                        color: Colors.white,
                        fontFamily: 'PTSerif-Regular',
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.58,
                  right: screenHeight * 0.03,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (widget.ind! < widget.length! - 1) {
                          widget.ind = widget.ind! + 1;
                        } else {}
                      });
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          const Color.fromRGBO(37, 42, 52, 1).withOpacity(0.8),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.58,
                  left: screenHeight * 0.03,
                  child: Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.ind! > 0) {
                            widget.ind = widget.ind! - 1;
                          }
                        });
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color.fromRGBO(37, 42, 52, 1)
                            .withOpacity(0.8),
                        child: const Center(child: Icon(Icons.arrow_back)),
                      ),
                    );
                  }),
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
                    StarDetailPanel(
                        'Constellation',
                        widget.starDetails[widget.ind]['constellation'],
                        screenWidth,
                        screenHeight),
                    // StarDetailPanel(
                    //     'Right Ascension', starDetails['right_ascension']),
                    StarDetailPanel(
                        'Declination',
                        widget.starDetails[widget.ind]['declination'],
                        screenWidth,
                        screenHeight),
                    StarDetailPanel(
                        'Apparent Mag',
                        widget.starDetails[widget.ind]['apparent_magnitude'],
                        screenWidth,
                        screenHeight),
                    StarDetailPanel(
                        'Absolute Mag',
                        widget.starDetails[widget.ind]['absolute_magnitude'],
                        screenWidth,
                        screenHeight),
                    StarDetailPanel(
                        'Distance Light Year',
                        widget.starDetails[widget.ind]['distance_light_year'],
                        screenWidth,
                        screenHeight),
                    StarDetailPanel(
                        'Spectral Class',
                        widget.starDetails[widget.ind]['spectral_class'],
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

  Row StarDetailPanel(String detailName, String detailValue, double screenWidth,
      double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${detailName}",
          textAlign: TextAlign.left,
        ),
        Text(
          ':',
        ),
        Text(
          detailValue,
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
