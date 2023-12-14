import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:language_translate/routes/main_raoute.dart';

class SplashContainer extends StatefulWidget {
  const SplashContainer({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashContainerState createState() => _SplashContainerState();
}

class _SplashContainerState extends State<SplashContainer> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.goNamed(RouteNames.signUpScreen);
   
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf4e0d9),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'தமிழ் கற்க எளிதான வழி மிகவும் எளிதானது எங்களுடன் இருங்கள்',
              textAlign: TextAlign.center,
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 15,
            ),
            Image.asset(
              'assets/images/read_book_full.jpg',
              scale: 1,
              width: 300,
              height: 200,
            ),
            const SizedBox(height: 15),
            Text(
              'THE EASIEST \nWAY TO LEARN \nTAMIL',
              textAlign: TextAlign.center,
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 10,
            ),
            const Icon(
              Icons.arrow_upward_sharp,
              color: Colors.black,
            ),
            const SizedBox(height: 8),
            Text(
              'SWIPE up\nVERSION 1.0',
              textAlign: TextAlign.center,
              style: GoogleFonts.ibmPlexSans(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      )),
    );
  }
}

//
