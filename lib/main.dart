import 'package:find_jobs/providers/auth_provider.dart';
import 'package:find_jobs/providers/category_provider.dart';
import 'package:find_jobs/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:find_jobs/pages/home_page.dart';
import 'package:find_jobs/pages/job_category_detail_page.dart';
import 'package:find_jobs/pages/job_detail_page.dart';
import 'package:find_jobs/pages/sign_in_page.dart';
import 'package:find_jobs/pages/sign_up_page.dart';
import 'package:find_jobs/pages/started_page.dart';
import 'package:find_jobs/pages/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashScreenPage(),
          '/started-page': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SigninPage(),
          '/sign-up': (context) => const SignupPage(),
          '/home': (context) => const HomePage(),
          '/job-category-detail': (context) => const JobCategoryDetailPage(),
          '/job-detail': (context) => const JobDetailPage(),
        },
      ),
    );
  }
}
