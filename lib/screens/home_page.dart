import 'package:astro_pro/constant.dart';
import 'package:astro_pro/screens/add_parameter_screen.dart';
import 'package:astro_pro/screens/planet_list.dart';
import 'package:astro_pro/screens/star_list.dart';
import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AssetsAudioPlayer assetsAudioPlayer;

  @override
  void initState() {
    super.initState();
    AssetsAudioPlayer.newPlayer().open(Audio("audio/intersteller1.mp3"),
        autoStart: true,
        loopMode: LoopMode.single,
        playInBackground: PlayInBackground.disabledRestoreOnForeground);
    setState(() {});
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   leading: const Icon(Icons.menu),
      //   title: const Text(
      //     'astro_pro',
      //     style: TextStyle(fontFamily: "Entanglement", fontSize: 28),
      //   ),
      //   centerTitle: true,
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.vertical(
      //       bottom: Radius.circular(30),
      //     ),
      //   ), //shape not working
      //   actions: const [Icon(Icons.arrow_back)],
      //   flexibleSpace: Container(decoration: kGradientDecoration),
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bck1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 50, 20, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                'Space\nExploration',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: w * 0.156,
                  fontFamily: "Saturday",
                ),
              ),
              SizedBox(
                height: w * 0.02,
              ),
              Text(
                'Embark on a cosmic adventure with our space exploration app. Discover captivating astronomical pictures of the day from NASA\'s API. Customize and explore a curated list of planets based on temperature, mass, and radius preferences. Dive into the fascinating world of stars with a comprehensive corresponding list.',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: w * 0.2,
              ),
              ExplorationTitle(
                title: 'APOD',
                onPress: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: const AddParameterScreen(),
                      ),
                    ),
                  );
                },
              ),
              ExplorationTitle(
                  title: 'Planets',
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const PlanetList())));
                  }),
              ExplorationTitle(
                title: 'Stars',
                onPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const StarList())));
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class ExplorationTitle extends StatelessWidget {
  const ExplorationTitle({super.key, this.title, this.onPress});
  final String? title;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 200,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(0),
          onPressed: onPress,
          child: Ink(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: kRedGradient,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
