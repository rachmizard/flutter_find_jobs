// ignore_for_file: prefer_const_constructors

import 'package:find_jobs/models/user_model.dart';
import 'package:find_jobs/providers/auth_provider.dart';
import 'package:find_jobs/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import 'package:find_jobs/theme.dart';
import 'package:find_jobs/widgets/buttons/primary_button.dart';
import 'package:find_jobs/widgets/buttons/secondary_button.dart';
import 'package:find_jobs/widgets/inputs/text_input_group.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final formKey = GlobalKey<FormState>();

  Map<String, dynamic> authPayload = {
    'email': '',
    'password': '',
  };
  bool isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    void navigateToHome() {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }

    void showMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }

    void onSubmit() async {
      try {
        if (!formKey.currentState!.validate()) return;
        formKey.currentState!.save();

        setState(() {
          isSubmitting = true;
        });

        UserModel? response = await authProvider.signIn(
            authPayload['email'], authPayload['password']!);

        if (response != null) {
          userProvider.user = response;

          showMessage('Sign in success');
          navigateToHome();
        }

        if (response == null) {
          showMessage("Email or password is incorrect");
        }
      } catch (e) {
        setState(() {
          isSubmitting = false;
        });
        showMessage(e.toString());
      } finally {
        setState(() {
          isSubmitting = false;
        });
      }
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
                  'Sign In',
                  style: titleTextStyle,
                ),
                Text(
                  'Build Your Career',
                  style: subtitleTextStyle,
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/illustration_1.png",
                        width: 261,
                        height: 240,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextInputGroup(
                              label: "Email Address",
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
                            height: 20,
                          ),
                          TextInputGroup(
                              label: "Password",
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
                            height: 20,
                          ),
                          Column(children: [
                            PrimaryButton(
                              onPressed: onSubmit,
                              text: "Sign In",
                              isLoading: isSubmitting,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SecondaryButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/sign-up');
                              },
                              text: "Create New Account",
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
