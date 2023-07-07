import 'package:astro_pro/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  // FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(24, 25, 32, 1),
        sliderTheme: SliderThemeData(
          activeTrackColor: const Color.fromARGB(255, 87, 75, 151),
          thumbColor: const Color.fromARGB(255, 87, 75, 151),
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 8, // Set the desired thumb radius here
          ),
          trackHeight: 2,
        ),
        textTheme:
            GoogleFonts.titilliumWebTextTheme(ThemeData.dark().textTheme),
      ),
      home: HomePage(),
    );
  }
}
//GoogleFonts.titilliumWebTextTheme(ThemeData.dark().textTheme),