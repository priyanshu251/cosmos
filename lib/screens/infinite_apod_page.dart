import 'package:astro_pro/screens/current_apod_result_page.dart';
import 'package:astro_pro/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:astro_pro/constant.dart';

class InfiniteAPOD extends StatefulWidget {
  @override
  State<InfiniteAPOD> createState() => _InfiniteAPODState();
}

class _InfiniteAPODState extends State<InfiniteAPOD> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(
            24, 25, 32, 1), //const Color.fromRGBO(24, 25, 32, 1)
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text(
            ' astro_pro',
            style: TextStyle(fontFamily: "Entanglement", fontSize: 28),
          ),
          centerTitle: true,
          shadowColor: Colors.black,
          actions: const [Icon(Icons.arrow_back)],
          flexibleSpace: Container(
            decoration: kGradientDecoration,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return APODRandomImage();
          },
          cacheExtent: 3000,
        ),
      ),
    );
  }
}

class APODRandomImage extends StatefulWidget {
  APODRandomImage();

  @override
  State<APODRandomImage> createState() => _APODRandomImageState();
}

class _APODRandomImageState extends State<APODRandomImage> {
  bool hasData = false;
  dynamic data = null;
  String url = '';
  void load() async {
    while (data == null || data['url'] == null || url[url.length - 1] != 'g') {
      dynamic result = await NetworkHelper(
              'https://api.nasa.gov/planetary/apod?api_key=237go3yWSmfxSH7slPZB2k10kcXmmULSvcc8AHuc&count=1',
              '')
          .getData();
      data = result[0];
      if (data['url'] != null) {
        url = data['url'];
      }
    }
    if (!mounted) return;
    setState(() {
      hasData = true;
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: const EdgeInsets.all(0),
        height: screenHeight * 0.3,
        width: screenWidth * 0.8, //remember this
        child: hasData
            ? MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CurrentAPODResultPage(apodData: data)));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.8,
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    child: InteractiveViewer(
                      minScale: 0.8,
                      maxScale: 2.5,
                      child: Image(
                        image: NetworkImage(data['url']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
