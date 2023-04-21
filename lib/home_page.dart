import 'package:astro_pro/constant.dart';
import 'package:astro_pro/screens/add_parameter_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late AssetsAudioPlayer assetsAudioPlayer;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // AssetsAudioPlayer.newPlayer().open(Audio("audio/hidan.mp3"),
    //     autoStart: true, loopMode: LoopMode.single);
    _controller = VideoPlayerController.asset('video/into_the_stars.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  void dispose() {
    // assetsAudioPlayer.dispose();
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text(
          'Astro_Pro',
          style: TextStyle(fontFamily: "Entanglement", fontSize: 28),
        ),
        centerTitle: true,
        actions: const [Icon(Icons.close)],
        flexibleSpace: Container(
          decoration: kGradientDecoration,
        ),
      ),
      body: Stack(children: <Widget>[
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 50, 20, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Space\nExploration',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 60.0,
                  color: Colors.white,
                  fontFamily: "Saturday",
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Space exploration is the use of astronomy and space technology to explore outer space. While the exploration of space is carried out mainly by astronomers with telescopes, its physical exploration is conducted both by uncrewed robotic space probes and human spaceflight.',
                style: TextStyle(color: Colors.white, fontSize: 17),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: mediaquery.size.height * 0.2,
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
                        child: AddParameterScreen(),
                      ),
                    ),
                  );
                },
              ),
              ExplorationTitle(
                title: 'Planets',
              ),
              ExplorationTitle(
                title: 'Stars',
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class ExplorationTitle extends StatelessWidget {
  ExplorationTitle({this.title, this.onPress});
  final String? title;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
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
            gradient: kGradient,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title!,
              style: kExplorationButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
