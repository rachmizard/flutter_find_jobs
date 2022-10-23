import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppliedJobAlert extends StatelessWidget {
  const AppliedJobAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 9),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffECEDF1),
          borderRadius: BorderRadius.circular(50)),
      child:
          Text("You have applied this job and the recruiter will contact you",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: const Color(0xffA2A6B4),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )),
    );
  }
}
