import 'package:astro_pro/constant.dart';
import 'package:astro_pro/screens/current_apod_result_page.dart';
import 'package:astro_pro/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:astro_pro/utility/custom_appbar.dart';

import 'package:transparent_image/transparent_image.dart';

class InfiniteAPOD extends StatefulWidget {
  @override
  State<InfiniteAPOD> createState() => _InfiniteAPODState();
}

class _InfiniteAPODState extends State<InfiniteAPOD> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 12, 0),
              child: Row(
                children: [
                  Text(
                    'Astronomical Pictures',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: 23),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const APODRandomImage();
                },
                cacheExtent: 3000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class APODRandomImage extends StatefulWidget {
  const APODRandomImage({super.key});

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
        margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
        padding: const EdgeInsets.all(0),
        height: screenHeight * 0.3,
        width: screenWidth * 0.8,
        child: hasData
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CurrentAPODResultPage(apodData: data)));
                },
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: InteractiveViewer(
                      minScale: 0.8,
                      maxScale: 2.5,
                      child: Hero(
                        tag: data['date'],
                        // flightShuttleBuilder: (flightContext, animation,
                        //     flightDirection, fromHeroContext, toHeroContext) {
                        //   return RotationTransition(
                        //     turns: animation,
                        //     child: toHeroContext.widget,
                        //   );
                        // },
                        child: FadeInImage(
                          placeholder: MemoryImage(kTransparentImage),
                          image: NetworkImage(data['url']),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 8),
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Colors.black,
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0),
                          ],
                        ),
                      ),
                      child: Text(
                        '${data['title']} >',
                      ),
                    ),
                  ),
                ]),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}

// Stack(
//           children: [
//             FadeInImage(
//               placeholder: MemoryImage(kTransparentImage),
//               image: NetworkImage(meal.imageUrl),
//               fit: BoxFit.cover,
//               height: 200,
//               width: double.infinity,
//             ),
//             Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   color: Colors.black54,
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
//                   child: Column(
//                     children: [
//                       Text(
//                         meal.title,
//                         maxLines: 2,
//                         textAlign: TextAlign.center,
//                         softWrap: true,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           MealItemTrait(
//                               icon: Icons.schedule,
//                               label: '${meal.duration} min'),
//                           const SizedBox(width: 12),
//                           MealItemTrait(
//                               icon: Icons.work, label: complexityText),
//                           const SizedBox(width: 12),
//                           MealItemTrait(
//                               icon: Icons.attach_money,
//                               label: affordabilityText),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ))
//           ],
//         ),