import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CurrentAPODResultPage extends StatefulWidget {
  CurrentAPODResultPage({required this.apodData});
  dynamic apodData;

  @override
  State<CurrentAPODResultPage> createState() => _CurrentAPODResultPageState();
}

class _CurrentAPODResultPageState extends State<CurrentAPODResultPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(widget.apodData['url']),
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
    );
  }
}
// Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         height: 500,
//         width: 700,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(widget.imageURL),
//             fit: BoxFit.fill,
//             colorFilter: ColorFilter.mode(
//                 Colors.white.withOpacity(0.8), BlendMode.dstATop),
//           ),
//         ),
//       ),