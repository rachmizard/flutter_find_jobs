import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Build Your Next\nFuture Career Like\na Master",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "18,000 jobs available",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                const Spacer(
                  flex: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 45,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(66),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff4141A4),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: 200,
                          height: 45,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.white,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(66),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed('/sign-in');
                              },
                              child: Text(
                                "Sign In",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
