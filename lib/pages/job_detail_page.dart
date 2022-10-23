// ignore_for_file: prefer_const_constructors

import 'package:find_jobs/models/job_model.dart';
import 'package:find_jobs/widgets/applied_job_alert.dart';
import 'package:find_jobs/widgets/buttons/primary_button.dart';
import 'package:find_jobs/widgets/job_qualification_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage> {
  bool isApplied = false;

  @override
  void initState() {
    super.initState();
    isApplied = false;
  }

  void _applyJob() {
    setState(() {
      isApplied = true;
    });
  }

  void _cancelApplyJob() {
    setState(() {
      isApplied = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    JobModel job = ModalRoute.of(context)!.settings.arguments as JobModel;

    Widget header() {
      return Column(
        children: [
          Center(
              child: Image.network(
            job.companyLogo,
            width: 60,
            height: 60,
          )),
          const SizedBox(
            height: 20,
          ),
          Text(job.name,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color(0xff272C2F),
              )),
          Text("${job.companyName} - ${job.location}",
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
          items: job.about.map((text) => text.toString()).toList(),
        ),
      );
    }

    Widget qualifications() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: JobDetailItemSection(
          title: 'Qualifications',
          items: job.qualifications.map((text) => text.toString()).toList(),
        ),
      );
    }

    Widget responsibilities() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 51),
        child: JobDetailItemSection(
          title: 'Responsibilities',
          items: job.responsibilities.map((text) => text.toString()).toList(),
        ),
      );
    }

    Widget actions() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 80, left: 80),
            child: isApplied
                ? PrimaryButton(
                    onPressed: () => _cancelApplyJob(),
                    text: "Cancel Apply",
                    colorScheme: PrimaryButtonColorScheme.danger)
                : PrimaryButton(
                    onPressed: () => _applyJob(),
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

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: isApplied
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 30),
                        child: AppliedJobAlert(),
                      )
                    : Container(),
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
