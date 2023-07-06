import 'package:astro_pro/constant.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CurrentAPODResultPage extends StatefulWidget {
  //is it important to be a stateful widget?
  CurrentAPODResultPage({super.key, required this.apodData});
  dynamic apodData;

  @override
  State<CurrentAPODResultPage> createState() => _CurrentAPODResultPageState();
}

class _CurrentAPODResultPageState extends State<CurrentAPODResultPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Text(
                '${widget.apodData['title']}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 23),
              ),
              Text(
                '(Date: ${widget.apodData['date']})', //add two days
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 4,
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
                      tag: widget.apodData['date'],
                      child: FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(
                          widget.apodData['url'],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.apodData['explanation'],
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: const Color.fromARGB(255, 207, 199, 199)),
                textAlign: TextAlign.justify,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
