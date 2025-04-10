import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sewar/companyscreens/aimodels.dart';
import 'package:sewar/companyscreens/companyprofilepage.dart';
import 'package:sewar/companyscreens/matchesschedule.dart';
import 'package:sewar/companyscreens/yourmatchpage.dart';
import 'package:sewar/userscreens/matchesschedule.dart';
import '../theme/app_styles.dart';
import 'package:blur/blur.dart';
import 'package:sewar/userscreens/aimodels.dart';
import 'package:sewar/userscreens/userprofilepage.dart';
import 'package:sewar/userscreens/matchpage.dart';
import 'package:provider/provider.dart';
import 'package:sewar/theme/themeprovider.dart';

class CompanyHomeScreen extends StatefulWidget {
  final bool isDark;

  const CompanyHomeScreen({Key? key, required this.isDark}) : super(key: key);

  @override
  State<CompanyHomeScreen> createState() => _CompanyHomeScreenState();
}

class _CompanyHomeScreenState extends State<CompanyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDark; 

    return Scaffold(
      body: Container(
        decoration: AppStyles.companybackgroundDecoration(isDark: isDark),
        child: SafeArea(
          child: Stack(
            children: [
              // === المحتوى الرئيسي
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // === الهيدر ===
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // الصورة والموقع
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(
                                'assets/companylogo.jpg',
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/user/icons/locationicon.png',
                                      width: 20,
                                      height: 20,
                                      color: Colors.white70,
                                    ),
                                    const SizedBox(width: 6),
                                    const Text(
                                      'saudi arabia - Riyadh',
                                      style: TextStyle(
                                        fontFamily: 'Text',
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        // زر التنبيهات والثيم
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(
                                isDark ? Icons.wb_sunny : Icons.dark_mode,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                themeProvider.toggleTheme();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Hello , User',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Title',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'last news and posts',
                      style: TextStyle(color: Colors.white60),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Viral',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Title',
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.white ,size: 50,),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    _buildPostCard(
                      title: 'Company',
                      imagePath: 'assets/footballstudio.png',
                      description:
                          'don’t forget about our match in 22 May at al-jawhara... Bring Your Family to enjoy !!',
                      likes: 1.2,
                    ),

                    const SizedBox(height: 20),

                    _buildPostCard(
                      title: 'Company',
                      imagePath: 'assets/robot.png',
                      description: 'Our new AI assistant just dropped 👀',
                      likes: 3.5,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),

              // ===== الشريط السفلي =====
              Positioned(
                bottom: 30,
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
                                    const Color.fromARGB(
                                      255,
                                      146,
                                      146,
                                      146,
                                    ).withOpacity(0.40),
                                    const Color.fromARGB(
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
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              CompanyHomeScreen(isDark: isDark),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/company/icons/sellectedhomepageicon.png',
                                  width: 26,
                                  height: 26,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => CoMatchesScheduleScreen(
                                            isDark: isDark,
                                          ),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/company/icons/unsellectedmatchpageicon.png',
                                  width: 26,
                                  height: 26,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => CompanyChatsScreen(
                                            isDark: isDark,
                                          ),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/company/icons/unsellectedaipageicon.png',
                                  width: 26,
                                  height: 26,
                                  color: AppStyles.icongray,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              CompanyProfile(isDark: isDark),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/company/icons/unsellecteddatapageicon.png', 
                                  width: 26,
                                  height: 26,
                                  color: AppStyles.icongray,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              CompanyProfile(isDark: isDark),
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/company/icons/unsellectedprofilepageicon.png', 
                                  width: 26,
                                  height: 26,
                                  
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
        ),
      ),
    );
  }

  Widget _buildPostCard({
    required String imagePath,
    required String title,
    required String description,
    required double likes,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 199, 199, 199).withOpacity(0.10),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),

                  Positioned.fill(
                    child: Container(color: Colors.black.withOpacity(0.25)),
                  ),
                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                size: 23,
                                color: Colors.redAccent,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${likes}k',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),

                              SizedBox(width: 15),

                              const Icon(
                                Icons.heart_broken,
                                size: 23,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${likes}k',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ← النصوص تحت الصورة
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/companylogo.jpg'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          fontFamily: 'Title',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
