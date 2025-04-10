import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:sewar/companyscreens/aimodels.dart';
import 'package:sewar/companyscreens/companyprofilepage.dart';
import 'package:sewar/companyscreens/homepage.dart';
import 'package:sewar/theme/app_styles.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:sewar/userscreens/matchesschedule.dart';
import 'package:sewar/theme/app_styles.dart';
import 'package:sewar/userscreens/aimodels.dart';
import 'package:sewar/userscreens/matchpage.dart';
import 'package:sewar/userscreens/userprofilepage.dart';
import 'package:sewar/userscreens/homepage.dart';
import 'package:sewar/userscreens/watchmatchpage.dart';

class CoMatchesScheduleScreen extends StatelessWidget {
  final bool isDark;

  const CoMatchesScheduleScreen({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: AppStyles.companybackgroundDecoration(isDark: isDark),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Matches Q',
                        style: TextStyle(
                          fontFamily: 'Title',
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _buildFilterChip('All', true),
                          const SizedBox(width: 12),
                          _buildFilterChip('Currently', false),
                          const SizedBox(width: 12),
                          _buildFilterChip('Soon', false),
                          const SizedBox(width: 12),
                          _buildFilterChip('Finish', false),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),
                    Text(
                      'Create New Match',
                      style: TextStyle(
                        fontFamily: 'Title',
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'currently created',
                      style: TextStyle(
                        fontFamily: 'Text',
                        fontSize: 25,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildMatchCard(
                            context,
                            team1: 'Barcelona',
                            team2: 'Real Madrid',
                            team1Image: 'assets/barcelona.png',
                            team2Image: 'assets/realmadrid.png',
                            time: '22:00',
                            date: 'Today',
                          ),

                          _buildMatchCard(
                            context,
                            team1: 'Al Ahli',
                            team2: 'Al Hilal',
                            team1Image: 'assets/alahli.png',
                            team2Image: 'assets/alhilal.png',
                            time: '19:00',
                            date: '12/5',
                          ),

                          SizedBox(height: 16),
                          _buildMatchCard(
                            context,
                            team1: 'falcons',
                            team2: 'A.P Bren',
                            team1Image: 'assets/falcons.png',
                            team2Image: 'assets/apbren.png',
                            time: '18:00',
                            date: 'Today',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                              'assets/company/icons/sellectedmatchpageicon.png',
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
                              'assets/company/icons/unsellectedprofilepageicon.png',
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

  Widget _buildFilterChip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 8,
      ), 
      decoration: BoxDecoration(
        color:
            selected
                ? const Color(0xFF00C9B7) 
                : const Color(0xFF1F2A44),
        borderRadius: BorderRadius.circular(32), 
        border: Border.all(color: Colors.white.withOpacity(0.05), width: 1.4),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 17, 
          fontFamily: 'Title', 
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildFilterBar(List<String> filters, int selectedIndex) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(filters.length, (index) {
          final isSelected = index == selectedIndex;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _buildFilterChip(filters[index], isSelected),
          );
        }),
      ),
    );
  }

  Widget _buildMatchCard(
    BuildContext context, { 
    required String team1,
    required String team2,
    required String team1Image,
    required String team2Image,
    required String time,
    required String date,
  }) {
    {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0),
            // ====== الشركة و الموقع ======
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/user/companylogo.jpg',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Company',
                      style: TextStyle(
                        fontFamily: 'Title',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/user/icons/locationicon.png',
                      width: 25,
                      height: 25,
                      color: Colors.white70,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Jeddah - Aljawhara',
                      style: TextStyle(
                        fontFamily: 'Text',
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 2),

            // ====== الفريق الأول ======
            Row(
              children: [
                const SizedBox(width: 5),
                Image.asset(team1Image, width: 30, height: 30),
                const SizedBox(width: 12),
                Text(
                  team1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Title',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 1),

            // ====== VS + الوقت + التاريخ + الزر ======
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // VS
                  Text(
                    'VS',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Title',
                      color: Colors.white70,
                    ),
                  ),

                  // الوقت والتاريخ
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Title',
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                          fontFamily: 'Title',
                        ),
                      ),
                    ],
                  ),

                  // زر التفاصيل
                 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => WatchMatch(
                                  team1: 'Barcelona',
                                  team2: 'Real Madrid',
                                  team1Image: 'assets/barcelona.png',
                                  team2Image: 'assets/realmadrid.png',
                                  time: '22:00',
                                  location: 'Jeddah - Aljawhara',
                                ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(111, 159, 33, 1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'More Details',
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontFamily: 'Text',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ====== الفريق الثاني ======
            Row(
              children: [
                const SizedBox(width: 5),
                Image.asset(team2Image, width: 30, height: 30),
                const SizedBox(width: 12),
                Text(
                  team2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Title',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
