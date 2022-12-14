import 'dart:async';

import 'package:find_jobs/models/job_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobTile extends StatelessWidget {
  final JobModel job;
  final FutureOr<void> Function() onTap;

  const JobTile({super.key, required this.onTap, required this.job});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  job.companyLogo,
                  width: 45,
                  height: 45,
                ),
                const SizedBox(
                  width: 27,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.name,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        job.companyName,
                        style: GoogleFonts.poppins(
                          color: const Color(0xffB3B5C4),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
