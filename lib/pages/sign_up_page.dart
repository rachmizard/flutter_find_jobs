// ignore_for_file: prefer_const_constructors

import 'package:find_jobs/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import 'package:find_jobs/models/user_model.dart';

import 'package:find_jobs/providers/auth_provider.dart';

import 'package:find_jobs/theme.dart';

import 'package:find_jobs/widgets/buttons/primary_button.dart';
import 'package:find_jobs/widgets/buttons/secondary_button.dart';
import 'package:find_jobs/widgets/inputs/text_input_group.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  bool isImageUploaded = false;
  Map<String, dynamic> authPayload = {
    'name': '',
    'email': '',
    'password': '',
    'goal': '',
  };

  bool isSubmitting = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);

    void navigateToHome() {
      Navigator.pushReplacementNamed(context, '/home');
    }

    void showMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }

    void onSubmit() async {
      if (_formKey.currentState!.validate()) return;

      _formKey.currentState!.save();

      setState(() {
        isSubmitting = true;
      });

      UserModel? response = await authProvider.signUp(authPayload['email'],
          authPayload['password'], authPayload['name'], authPayload['goal']);

      setState(() {
        isSubmitting = false;
      });

      if (response != null) {
        userProvider.user = response;

        showMessage('Sign up success');
        return navigateToHome();
      }

      if (response == null) {
        return showMessage('Sign up failed');
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
                              initialValue: authPayload['name'],
                              onSaved: (name) => authPayload['name'] = name!,
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
                              initialValue: authPayload['email'],
                              onSaved: (email) => authPayload['email'] = email!,
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
                              initialValue: authPayload['password'],
                              onSaved: (password) =>
                                  authPayload['password'] = password!,
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
                              initialValue: authPayload['goal'],
                              onSaved: (goal) => authPayload['goal'] = goal!,
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
                                onPressed: onSubmit,
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
