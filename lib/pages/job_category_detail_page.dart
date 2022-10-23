// ignore_for_file: prefer_const_constructors

import 'package:find_jobs/models/job_category_model.dart';
import 'package:find_jobs/pages/job_detail_page.dart';
import 'package:find_jobs/services/job_service.dart';
import 'package:find_jobs/widgets/category_job_cover.dart';
import 'package:find_jobs/widgets/job_tile.dart';
import 'package:find_jobs/widgets/section.dart';
import 'package:flutter/material.dart';

class JobCategoryDetailPage extends StatelessWidget {
  const JobCategoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as JobCategoryModel;
    JobService jobService = JobService();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: jobService.getJobs(category: args.name),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    CategoryJobCover(
                      imageUrl: args.imageUrl!,
                      title: args.name!,
                      subtitle:
                          snapshot.connectionState == ConnectionState.done &&
                                  snapshot.data!.isNotEmpty
                              ? "${snapshot.data!.length} available"
                              : "calculating...",
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Section(title: 'Big Componies', children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: snapshot.connectionState ==
                                    ConnectionState.waiting
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Column(
                                    children: snapshot.data!
                                        .map(
                                          (job) => JobTile(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          JobDetailPage())),
                                              jobTitle: job.name!,
                                              company: job.companyName!,
                                              imageUrl: job.companyLogo!),
                                        )
                                        .toList(),
                                  ),
                          )
                        ]),
                        SizedBox(
                          height: 30,
                        ),
                        Section(title: 'New Startups', children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: snapshot.connectionState ==
                                    ConnectionState.waiting
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Column(
                                    children: snapshot.data!
                                        .map(
                                          (job) => JobTile(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          JobDetailPage())),
                                              jobTitle: job.name!,
                                              company: job.companyName!,
                                              imageUrl: job.companyLogo!),
                                        )
                                        .toList(),
                                  ),
                          )
                        ])
                      ],
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
