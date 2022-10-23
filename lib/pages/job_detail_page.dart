// ignore_for_file: prefer_const_constructors

import 'package:find_jobs/widgets/applied_job_alert.dart';
import 'package:find_jobs/widgets/buttons/primary_button.dart';
import 'package:find_jobs/widgets/job_qualification_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDetailPage extends StatelessWidget {
  const JobDetailPage({super.key});

  Widget header() {
    return Column(
      children: [
        Center(
            child: Image.asset(
          'assets/images/google_icon.png',
          width: 60,
          height: 60,
        )),
        const SizedBox(
          height: 20,
        ),
        Text('Front-End Developer',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color(0xff272C2F),
            )),
        Text("Google, Inc - Jakarta",
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: const Color(0xffB3B5C4),
              fontWeight: FontWeight.w300,
            ))
      ],
    );
  }

  Widget aboutTheJob() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: JobDetailItemSection(
        title: 'About the job',
        qualifications: const [
          'Full-Time On Site',
          'Start at 18,000 per month'
        ],
      ),
    );
  }

  Widget qualifications() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: JobDetailItemSection(
        title: 'Qualifications',
        qualifications: const [
          'Candidate must possess at least a Bachelors Degree.',
          'Able to use Microsoft Office and Google based service.',
          'Have an excellent time management, good at organized and details'
        ],
      ),
    );
  }

  Widget responsibilities() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 51),
      child: JobDetailItemSection(
        title: 'Responsibilities',
        qualifications: const [
          'Initiate and promote any programs, events, training, or activities.',
          'Assessing and anticipating needs and collaborate with Division.',
        ],
      ),
    );
  }

  Widget actions() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 80, left: 80),
          child: PrimaryButton(
              onPressed: () {},
              text: "Apply for Job",
              colorScheme: PrimaryButtonColorScheme.primary),
        ),
        TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
            ),
            child: Text(
              "Message Recruiter",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: const Color(0xff272C2F),
                fontWeight: FontWeight.w300,
              ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 30),
                  child: AppliedJobAlert(),
                ),
              ),
              header(),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 35, left: 24, right: 24),
                  child: Column(
                    children: [
                      aboutTheJob(),
                      qualifications(),
                      responsibilities(),
                      actions()
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
