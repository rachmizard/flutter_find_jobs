// ignore_for_file: prefer_const_constructors

import 'package:find_jobs/models/job_category_model.dart';
import 'package:find_jobs/widgets/category_job_cover.dart';
import 'package:find_jobs/widgets/job_tile.dart';
import 'package:find_jobs/widgets/section.dart';
import 'package:flutter/material.dart';

class JobCategoryDetailPage extends StatelessWidget {
  const JobCategoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as JobCategoryModel;

    double sizeBoxScrollHeight = MediaQuery.of(context).size.height -
        270 -
        MediaQuery.of(context).padding.top;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Column(
            children: [
              CategoryJobCover(
                  imageUrl: args.imageUrl,
                  title: args.name,
                  subtitle: args.subtitle),
              SizedBox(
                height: sizeBoxScrollHeight,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Section(title: 'Big Componies', children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: const [
                              JobTile(
                                  jobTitle: 'Front-end Developer',
                                  company: 'Google',
                                  imageUrl: 'assets/images/google_icon.png'),
                              JobTile(
                                  jobTitle: 'React Developer',
                                  company: 'Facebook',
                                  imageUrl: 'assets/images/facebook_icon.png'),
                              JobTile(
                                  jobTitle: 'Full Stack Engineer Developer',
                                  company: 'Instagram',
                                  imageUrl: 'assets/images/instagram_icon.png'),
                            ],
                          ),
                        )
                      ]),
                      SizedBox(
                        height: 30,
                      ),
                      Section(title: 'New Startups', children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: const [
                              JobTile(
                                  jobTitle: 'Front-end Developer',
                                  company: 'Google',
                                  imageUrl: 'assets/images/google_icon.png'),
                              JobTile(
                                  jobTitle: 'React Developer',
                                  company: 'Facebook',
                                  imageUrl: 'assets/images/facebook_icon.png'),
                              JobTile(
                                  jobTitle: 'Full Stack Engineer Developer',
                                  company: 'Instagram',
                                  imageUrl: 'assets/images/instagram_icon.png'),
                            ],
                          ),
                        )
                      ])
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
