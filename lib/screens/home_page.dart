import 'package:astro_pro/constant.dart';
import 'package:astro_pro/screens/add_parameter_screen.dart';
import 'package:astro_pro/screens/planet_list.dart';
import 'package:astro_pro/screens/star_list.dart';
import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AssetsAudioPlayer assetsAudioPlayer;
  bool isSoundOn = true;
  double volume = 0.5;

  @override
  void initState() {
    super.initState();
    setState(() {
      assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
      assetsAudioPlayer.open(
        Audio("audio/dunes.mp3"),
        volume: volume,
        autoStart: true,
        loopMode: LoopMode.single,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
      );
    });
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
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bck1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: w * 0.21,
                ),
                Text(
                  'Space\nExploration',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.orbitron(
                    textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: w * 0.129,
                        color: Color.fromARGB(255, 219, 219, 219)),
                  ),
                ),
                SizedBox(
                  height: w * 0.06,
                ),
                Text(
                  'Embark on a cosmic adventure with our space exploration app. Discover captivating astronomical pictures of the day from NASA\'s API. Customize and explore a curated list of planets based on temperature, mass, and radius preferences. Dive into the fascinating world of stars with a comprehensive corresponding list.',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w300, fontSize: w * 0.0355),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: w * 0.15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RotatedBox(
                          quarterTurns: 3,
                          child: Container(
                            width: w / 1.85,
                            child: SliderTheme(
                              data: Theme.of(context).sliderTheme.copyWith(
                                    activeTrackColor: Colors.white70,
                                    inactiveTrackColor: Colors.white30,
                                    thumbColor: const Color.fromARGB(
                                        255, 216, 214, 214),
                                  ),
                              child: Slider(
                                value: volume,
                                min: 0,
                                max: 1,
                                onChanged: (newValue) {
                                  setState(() {
                                    volume = newValue;
                                    assetsAudioPlayer.setVolume(volume);
                                    if (volume == 0) {
                                      isSoundOn = false;
                                    }
                                    if (volume != 0) {
                                      isSoundOn = true;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          isSoundOn ? Icons.music_note : Icons.music_off,
                          color: const Color.fromARGB(255, 216, 214, 214),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        ExplorationTitle(
                          title: 'APOD',
                          onPress: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => SingleChildScrollView(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
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
                                      builder: ((context) =>
                                          const PlanetList())));
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
                      ],
                    ),
                    SizedBox(
                      width: w * 0.035,
                    ),
                  ],
                ),
                SizedBox(
                  height: w * 0.115,
                )
              ],
            ),
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
                style: GoogleFonts.exo(
                    textStyle: Theme.of(context).textTheme.titleLarge),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
