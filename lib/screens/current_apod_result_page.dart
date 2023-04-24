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
        backgroundColor: const Color.fromRGBO(24, 25, 32,
            1), //teal const Color.fromARGB(255, 0, 19, 19), //const Color.fromARGB(255, 3, 0, 42),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.apodData['title']} -',
                  style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
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
