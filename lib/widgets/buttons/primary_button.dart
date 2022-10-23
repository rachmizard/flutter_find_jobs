import 'package:find_jobs/theme.dart';
import 'package:flutter/material.dart';

enum PrimaryButtonColorScheme { primary, danger }

class PrimaryButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final bool isLoading;
  final Enum? colorScheme;

  const PrimaryButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.isLoading = false,
      this.colorScheme = PrimaryButtonColorScheme.primary});

  get getBackgroundColor {
    switch (colorScheme) {
      case PrimaryButtonColorScheme.primary:
        return const Color(0xff4141A4);
      case PrimaryButtonColorScheme.danger:
        return const Color(0xffFD4F56);
      default:
        return const Color(0xff4141A4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(
            backgroundColor: getBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(66),
            ),
          ),
          child: isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  text,
                  style: primaryButtonTextStyle,
                ),
        ));
  }
}
