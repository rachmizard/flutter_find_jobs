// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  bool isSubmitting = false;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isSubmitting = true;
      });

      setState(() {
        _formKey.currentState!.save();

        print({
          'email': _email,
          'password': _password,
        });
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          isSubmitting = false;
        });

        Navigator.of(context).pushReplacementNamed('/home');
      });
    }
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
                      autovalidateMode: AutovalidateMode.always,
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextInputGroup(
                              label: "Email Address",
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
                            height: 20,
                          ),
                          TextInputGroup(
                              label: "Password",
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
                            height: 20,
                          ),
                          Column(children: [
                            PrimaryButton(
                              onPressed: _submit,
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
