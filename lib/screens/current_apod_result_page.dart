import 'package:astro_pro/constant.dart';
import 'package:flutter/material.dart';

class CurrentAPODResultPage extends StatefulWidget {
  //is it important to be a stateful widget?
  CurrentAPODResultPage({required this.apodData});
  dynamic apodData;

  @override
  State<CurrentAPODResultPage> createState() => _CurrentAPODResultPageState();
}

class _CurrentAPODResultPageState extends State<CurrentAPODResultPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(24, 25, 32, 1),
        body: Container(
          margin: const EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${widget.apodData['title']}',
                textAlign: TextAlign.center,
                style: kExplorationButtonTextStyle.copyWith(
                    fontSize: screenHeight * 0.035,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '(Date: ${widget.apodData['date']})', //add two days
                style: kExplorationButtonTextStyle.copyWith(
                    fontSize: screenHeight * 0.019,
                    fontWeight: FontWeight.w300),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: InteractiveViewer(
                      //zoomable image
                      minScale: 0.8,
                      maxScale: 2.5,
                      child: Hero(
                        tag: 'apod',
                        child: Image.network(widget.apodData['url'],
                            fit: BoxFit.fill),
                      )),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    widget.apodData['explanation'],
                    textAlign: TextAlign.justify,
                    style: kExplorationButtonTextStyle.copyWith(
                        fontSize: screenHeight * 0.0254,
                        fontFamily: "Playfair"),
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
