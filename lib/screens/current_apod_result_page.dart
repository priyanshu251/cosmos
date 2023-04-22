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
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 32, 31, 31),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  child: InteractiveViewer(
                      //zoomable image
                      minScale: 0.8,
                      maxScale: 2.5,
                      child: Image.network(widget.apodData['url'],
                          fit: BoxFit.fill)),
                ),
                Text(
                  widget.apodData['explanation'],
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
