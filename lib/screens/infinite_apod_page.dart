import 'package:astro_pro/services/networking.dart';
import 'package:flutter/material.dart';
import '../services/networking.dart';

class InfiniteAPOD extends StatefulWidget {
  @override
  State<InfiniteAPOD> createState() => _InfiniteAPODState();
}

class _InfiniteAPODState extends State<InfiniteAPOD> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 32, 31, 31),
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
              'https://api.nasa.gov/planetary/apod?api_key=237go3yWSmfxSH7slPZB2k10kcXmmULSvcc8AHuc&count=1')
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
    return Container(
        margin: const EdgeInsets.all(10),
        height: 300,
        width: screenWidth * 0.8,
        child: hasData
            ? Image(image: NetworkImage(data['url']))
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
