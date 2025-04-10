import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:sewar/userscreens/matchesschedule.dart';
import 'package:sewar/theme/app_styles.dart';
import 'package:sewar/userscreens/aimodels.dart';
import 'package:sewar/userscreens/userprofilepage.dart';
import 'package:sewar/userscreens/homepage.dart';

class MatchCategoriesScreen extends StatelessWidget {
  final bool isDark;

  const MatchCategoriesScreen({Key? key, required this.isDark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: AppStyles.backgroundDecoration(isDark: isDark),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        'Matches',
                        style: TextStyle(
                          fontFamily: 'Title',
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Category',
                      style: TextStyle(
                        fontFamily: 'Title',
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'currently created',
                      style: TextStyle(
                        fontFamily: 'Text',
                        fontSize: 23,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildCategoryCard(
                            'Foot Ball',
                            'assets/footballstudio.png',
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          MatchesScheduleScreen(isDark: isDark),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 20),
                          _buildCategoryCard(
                            'Basket Ball',
                            'assets/basketball.png',
                          () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          MatchesScheduleScreen(isDark: isDark),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 20),
                          _buildCategoryCard('Electric', 'assets/esports.png', () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          MatchesScheduleScreen(isDark: isDark),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 20),
                          _buildCategoryCard(
                            'Base Ball',
                            'assets/baseball.png',
                          () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          MatchesScheduleScreen(isDark: isDark),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 20),
                          _buildCategoryCard('Tennis', 'assets/tennis.png', () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          MatchesScheduleScreen(isDark: isDark),
                                ),
                              );
                            },
                          ),

                          SizedBox(height: 20),
                          _buildCategoryCard(' Golf', 'assets/Golf.png', () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          MatchesScheduleScreen(isDark: isDark),
                                ),
                              );
                            },
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // شريط التنقل السفلي
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Blur(
                        blur: 11.4,
                        colorOpacity: 0.15,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(
                                  255,
                                  146,
                                  146,
                                  146,
                                ).withOpacity(0.40),
                                Color.fromARGB(
                                  255,
                                  97,
                                  95,
                                  95,
                                ).withOpacity(0.40),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserHomeScreen(isDark: isDark),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/user/icons/unsellectedhomepageicon.png',
                              width: 26,
                              height: 26,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          MatchCategoriesScreen(isDark: isDark),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/user/icons/sellectedmatchpageicon.png',
                              width: 26,
                              height: 26,
                              
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => ChatsScreen(isDark: isDark),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/user/icons/unsellectedaipageicon.png',
                              width: 26,
                              height: 26,
                              color: AppStyles.icongray,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => UserProfile(isDark: isDark),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/user/icons/unsellectedprofilepageicon.png',
                              width: 26,
                              height: 26,
                              color: AppStyles.icongray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      
    );
  }

  // الكارد لكل نوع رياضة
  Widget _buildCategoryCard(
    String title,
    String imagePath,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.4),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 90,
                width: double.infinity,
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                  child: Container(color: Colors.black.withOpacity(0.3)),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Title',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
