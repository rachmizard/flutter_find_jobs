// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryJobCover extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? subtitle;

  const CategoryJobCover(
      {super.key, required this.imageUrl, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 270,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            )),
        Container(
            width: double.infinity,
            height: 270,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      const Color(0xff2A327D).withOpacity(0.0),
                      const Color(0xff0D1240),
                    ],
                    stops: const [
                      0.0,
                      1.0
                    ])),
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 178),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      subtitle ?? "",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
