import 'package:find_jobs/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInputGroup extends StatefulWidget {
  final String label;
  final String? hintText;
  final String? initialValue;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  const TextInputGroup(
      {super.key,
      required this.label,
      this.hintText,
      this.initialValue,
      this.obscureText = false,
      this.validator,
      this.onSaved});

  @override
  State<TextInputGroup> createState() => _TextInputGroupState();
}

class _TextInputGroupState extends State<TextInputGroup> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue ?? '';
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: titleTextStyle,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.disabled,
          controller: controller,
          obscureText: widget.obscureText,
          validator: widget.validator,
          onSaved: widget.onSaved,
          style:
              GoogleFonts.poppins(color: const Color(0xff4141A4), fontSize: 16),
          decoration: InputDecoration(
            fillColor: const Color(0xffF1F0F5),
            filled: true,
            hintText: widget.hintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            errorStyle: GoogleFonts.poppins(
                color: const Color(0xffFF5B37), fontSize: 12),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(100),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffFF5B37)),
              borderRadius: BorderRadius.circular(100),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffFF5B37)),
              borderRadius: BorderRadius.circular(100),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff4141A4)),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }
}
