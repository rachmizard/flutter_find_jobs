// ignore_for_file: prefer_const_constructors

import 'package:find_jobs/models/job_category_model.dart';
import 'package:find_jobs/models/user_model.dart';
import 'package:find_jobs/providers/auth_provider.dart';
import 'package:find_jobs/providers/user_provider.dart';
import 'package:find_jobs/theme.dart';
import 'package:find_jobs/widgets/hot_job_category_card.dart';
import 'package:find_jobs/widgets/job_tile.dart';
import 'package:find_jobs/widgets/rounded_image.dart';
import 'package:find_jobs/widgets/section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);

    print('authprovider ${authProvider.isLogin}');

    final List<JobCategoryModel> hotCategories = [
      JobCategoryModel(
          id: 'AcqRCVW208yiY1bgKpFT',
          imageUrl: 'assets/images/bg.png',
          name: 'Website Developer',
          subtitle: "1,350 jobs available",
          createdAt: 1618959950809,
          updatedAt: 1618959950809),
      JobCategoryModel(
          id: UniqueKey().toString(),
          imageUrl: 'assets/images/job_1.png',
          name: 'Mobile Developer',
          subtitle: "2,400 jobs available",
          createdAt: 1618959950809,
          updatedAt: 1618959950809),
      JobCategoryModel(
          id: UniqueKey().toString(),
          imageUrl: 'assets/images/job_2.png',
          name: 'App Designer',
          subtitle: "1,200 jobs available",
          createdAt: 1618959950809,
          updatedAt: 1618959950809),
      JobCategoryModel(
          id: UniqueKey().toString(),
          imageUrl: 'assets/images/job_3.png',
          name: 'Content Writer',
          subtitle: "1,200 jobs available",
          createdAt: 1618959950809,
          updatedAt: 1618959950809),
      JobCategoryModel(
          id: UniqueKey().toString(),
          imageUrl: 'assets/images/job_4.png',
          name: 'Video Grapher',
          subtitle: "1,200 jobs available",
          createdAt: 1618959950809,
          updatedAt: 1618959950809),
    ];

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 30, left: 24, right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userProvider.user.email ?? "",
                  style: titleTextStyle,
                ),
                Text(
                  userProvider.user.name ?? "",
                  style: subtitleTextStyle,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                authProvider.isLogin = false;
                userProvider.user = UserModel();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/sign-in', (route) => false);
              },
              child: const RoundedImage(
                imageUrl: 'assets/images/user_pic.png',
              ),
            )
          ],
        ),
      );
    }

    Widget jobCardList() {
      return SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.down,
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: hotCategories.map((category) {
              return Row(
                children: [
                  HotJobCategoryCard(
                    onTap: () => Navigator.pushNamed(
                        context, '/job-category-detail',
                        arguments: JobCategoryModel(
                            id: category.id,
                            imageUrl: category.imageUrl,
                            name: category.name,
                            subtitle: category.subtitle,
                            createdAt: category.createdAt,
                            updatedAt: category.updatedAt)),
                    imageUrl: category.imageUrl,
                    title: category.name,
                  ),
                  SizedBox(
                    width: 16,
                  )
                ],
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget hotCategoriesSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Section(title: 'Hot Categories', children: [jobCardList()]),
        ],
      );
    }

    Widget justPostedSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Section(title: "Just Posted", children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  JobTile(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/job-detail'),
                      jobTitle: 'Front-end Developer',
                      company: 'Google',
                      imageUrl: 'assets/images/google_icon.png'),
                  SizedBox(
                    height: 16,
                  ),
                  JobTile(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/job-detail'),
                      jobTitle: 'UI Designer',
                      company: 'Instagram',
                      imageUrl: 'assets/images/instagram_icon.png'),
                  SizedBox(
                    height: 16,
                  ),
                  JobTile(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/job-detail'),
                      jobTitle: 'Data Scientist',
                      company: 'Facebook',
                      imageUrl: 'assets/images/facebook_icon.png'),
                  SizedBox(
                    height: 16,
                  ),
                  JobTile(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/job-detail'),
                      jobTitle: 'React Developer',
                      company: 'Facebook',
                      imageUrl: 'assets/images/facebook_icon.png')
                ],
              ),
            )
          ]),
        ],
      );
    }

    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(top: 30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          unselectedItemColor: const Color(0xffB3B5C4),
          selectedItemColor: const Color(0xff272C2F),
          currentIndex: 0,
          elevation: 0,
          iconSize: 24,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/dashboard_icon.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon:
                  ImageIcon(AssetImage('assets/images/notification_icon.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/love_icon.png')),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/user_icon.png')),
              label: '',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.down,
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [header(), hotCategoriesSection(), justPostedSection()],
          ),
        ),
      ),
    );
  }
}
