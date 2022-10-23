// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:find_jobs/theme.dart';
import 'package:find_jobs/widgets/buttons/primary_button.dart';
import 'package:find_jobs/widgets/buttons/secondary_button.dart';
import 'package:find_jobs/widgets/inputs/text_input_group.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  bool isImageUploaded = false;
  String _fullName = '';
  String _email = '';
  String _password = '';
  String _yourGoal = '';

  bool isSubmitting = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isSubmitting = true;
      });

      setState(() {
        _formKey.currentState!.save();
      });

      print({
        'full_name': _fullName,
        'email': _email,
        'password': _password,
        'your_goal': _yourGoal,
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          isSubmitting = false;
        });

        Navigator.pushReplacementNamed(context, '/home');
      });
    }
  }

  Widget uploadImageWidget() {
    return GestureDetector(
      onTap: (() => setState(() {
            isImageUploaded = !isImageUploaded;
          })),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff4141A4)),
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: AssetImage(isImageUploaded
                    ? 'assets/images/user_pic.png'
                    : 'assets/images/icon_upload.png'),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            isImageUploaded ? 'Change Photo' : 'Upload Photo',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: titleTextStyle,
                ),
                Text(
                  'Begin New Journey',
                  style: subtitleTextStyle,
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Column(
                    children: [
                      uploadImageWidget(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 82,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextInputGroup(
                              label: "Full Name",
                              initialValue: _fullName,
                              onSaved: (fullName) => _fullName = fullName!,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Full Name is required";
                                }

                                return null;
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          TextInputGroup(
                              label: "Email Address",
                              initialValue: _email,
                              onSaved: (email) => _email = email!,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email address is required";
                                }

                                if (!isEmail(value)) {
                                  return "Email address is invalid";
                                }

                                return null;
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          TextInputGroup(
                              label: "Password",
                              initialValue: _password,
                              onSaved: (password) => _password = password!,
                              obscureText: true,
                              validator: (value) {
                                if (isNull(value!)) {
                                  return "Password is required";
                                }

                                if (!isLength(value, 6)) {
                                  return "Password must be at least 6 characters";
                                }

                                return null;
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          TextInputGroup(
                              label: "Your Goal",
                              initialValue: _yourGoal,
                              onSaved: (yourGoal) => _yourGoal = yourGoal!,
                              validator: (value) {
                                if (isNull(value!)) {
                                  return "Your Goal is required";
                                }

                                return null;
                              }),
                          SizedBox(
                            height: 40,
                          ),
                          Column(children: [
                            PrimaryButton(
                                onPressed: _submit,
                                text: "Sign Up",
                                isLoading: isSubmitting),
                            SizedBox(
                              height: 10,
                            ),
                            SecondaryButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _formKey.currentState!.reset();
                              },
                              text: "Back To Sign In",
                            )
                          ]),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
