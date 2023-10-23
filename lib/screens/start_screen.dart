import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myquiz/constants/constants.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.startQuiz});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: [primaryColor, primaryAccentColor],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/backgroundImage.png",
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
            width: double.infinity,
          ),
          Positioned(
            top: 400,
            child: BlurryContainer(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 51),
              blur: 5,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/avengersLogo.png",
                    width: 180,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 47,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                    "Avengers".toUpperCase(),
                  ),
                  Text(
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      color: Colors.white70,
                    ),
                    "Join The Quest Of Your Marvel Heros",
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        // shape: StadiumBorder(), // gives rounded button
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(17)))),
                    onPressed: startQuiz,
                    icon: const Icon(
                      Icons.flash_on,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Start Quiz",
                      style: GoogleFonts.roboto(
                        color: secondaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
