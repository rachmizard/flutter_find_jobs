import 'package:find_jobs/theme.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const SecondaryButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 45,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(66),
            ),
          ),
          child: Text(
            text,
            style: secondaryButtonTextStyle,
          ),
        ));
  }
}
