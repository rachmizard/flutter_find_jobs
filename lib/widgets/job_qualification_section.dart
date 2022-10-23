import 'package:find_jobs/theme.dart';
import 'package:flutter/material.dart';

class JobDetailItemSection extends StatelessWidget {
  final String title;
  final List<String> qualifications;

  const JobDetailItemSection(
      {super.key, required this.title, required this.qualifications});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: sectionTextStyle),
      const SizedBox(
        height: 16,
      ),
      Column(
        children: List.generate(
            qualifications.length,
            (index) => Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/dot.png',
                          width: 12,
                          height: 12,
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            qualifications[index],
                            style: jobQualificationTextStyle,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                )).toList(),
      )
    ]);
  }
}
