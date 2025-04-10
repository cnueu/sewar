import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:sewar/companyscreens/aimodels.dart';
import 'package:sewar/companyscreens/homepage.dart';
import 'package:sewar/companyscreens/matchesschedule.dart';
import 'package:sewar/theme/app_styles.dart';
import 'package:sewar/userscreens/aimodels.dart';
import 'package:sewar/userscreens/userprofilepage.dart';
import 'package:sewar/userscreens/matchpage.dart';
import 'package:sewar/userscreens/homepage.dart';
import 'package:sewar/theme/app_styles.dart';
import 'package:sewar/theme/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:sewar/theme/app_styles.dart';
import 'package:sewar/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class CompanyProfile extends StatefulWidget {
  final bool isDark;

  const CompanyProfile({Key? key, required this.isDark}) : super(key: key);

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  bool isHistory = false;
  String selectedTab = 'Posts';

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDark;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: AppStyles.companybackgroundDecoration(
              isDark: widget.isDark,
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [Icon(Icons.menu, color: Colors.white)],
                    ),
                  ),

                  const SizedBox(height: 10),

                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/companylogo.jpg'),
                  ),

                  const SizedBox(height: 16),

                  Column(
                    children: [
                      const Text(
                        'Company',
                        style: TextStyle(
                          fontFamily: 'Title',
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/user/icons/locationicon.png',
                            width: 18,
                            height: 18,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'saudi arabia – Riyadh',
                            style: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Text',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Joined Since 3/3/2025',
                        style: TextStyle(
                          color: Colors.white60,
                          fontFamily: 'Title',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  
                  const Text(
                    'Followers: 32K', 
                    style: TextStyle(
                      fontFamily: 'Title',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap:
                                  () => setState(() => selectedTab = 'Posts'),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      selectedTab == 'Posts'
                                          ? Colors.white
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Posts',
                                    style: TextStyle(
                                      fontFamily: 'Title',
                                      color:
                                          selectedTab == 'Posts'
                                              ? Colors.black
                                              : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap:
                                  () => setState(() => selectedTab = 'History'),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      selectedTab == 'History'
                                          ? Colors.white
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'History',
                                    style: TextStyle(
                                      fontFamily: 'Title',
                                      color:
                                          selectedTab == 'History'
                                              ? Colors.black
                                              : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => selectedTab = 'Data'),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      selectedTab == 'Data'
                                          ? Colors.white
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Data',
                                    style: TextStyle(
                                      fontFamily: 'Title',
                                      color:
                                          selectedTab == 'Data'
                                              ? Colors.black
                                              : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedTab == 'Posts'
                              ? 'Posts'
                              : selectedTab == 'History'
                              ? 'History'
                              : 'Data', 
                          style: const TextStyle(
                            fontFamily: 'Title',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),

                        const SizedBox(height: 6),
                        Container(
                          height: 1.5,
                          width: double.infinity,
                          color: Colors.white.withOpacity(0.2),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          //  الشريط السفلي
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
                              'assets/company/icons/unsellectedhomepageicon.png',
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
                                      (context) =>
                                          CompanyChatsScreen(isDark: isDark),
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
                              'assets/company/icons/sellectedcompanyprofilepageicon.png',
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
    );
  }
}
