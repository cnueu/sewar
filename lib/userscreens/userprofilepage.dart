import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
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

class UserProfile extends StatefulWidget {
  final bool isDark;

  const UserProfile({Key? key, required this.isDark}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: AppStyles.backgroundDecoration(isDark: widget.isDark),
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
                    backgroundImage: AssetImage('assets/user/userimage.jpg'),
                  ),

                  const SizedBox(height: 16),

                  Column(
                    children: [
                      const Text(
                        'User',
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
                              fontFamily: 'Title',
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

                  //  النقاط
                  const Text(
                    'Points 36',
                    style: TextStyle(
                      fontFamily: 'Title',
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 30),

                  //  أزرار Previous / Following
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
                              onTap: () => setState(() => isFollowing = false),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      isFollowing
                                          ? Colors.transparent
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Previous Tickets',
                                    style: TextStyle(
                                      fontFamily: 'Title',
                                      color:
                                          isFollowing
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isFollowing = true),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      isFollowing
                                          ? Colors.white
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Following',
                                    style: TextStyle(
                                      fontFamily: 'Title',
                                      color:
                                          isFollowing
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

                  //  العنوان + الخط
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isFollowing
                              ? 'Following Companies'
                              : 'Previous Tickets',
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

                  //  بطاقة حسب الاختيار
                  isFollowing
                      ? buildFollowingCard(
                        logoPath: 'assets/user/companylogo.jpg',
                        name: 'Company',
                        followers: '90k',
                        location: 'saudi arabia – Riyadh',
                      )
                      : _buildTicketCard(
                        id: "XXX–XXXXX",
                        match: "football Asia",
                        place: "Jeddah - Aljawhara",
                        time: "18:00",
                        seat: "M55",
                        note: "Connected with User Face",
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
                          //  Home
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          UserHomeScreen(isDark: widget.isDark),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/user/icons/unsellectedhomepageicon.png',
                              width: 26,
                              height: 26,
                            ),
                          ),

                          //  Match Page
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => MatchCategoriesScreen(
                                        isDark: widget.isDark,
                                      ),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/user/icons/unsellectedmatchpageicon.png',
                              width: 26,
                              height: 26,
                              color: AppStyles.icongray,
                            ),
                          ),

                          //  AI Models
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          ChatsScreen(isDark: widget.isDark),
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

                          //  Profile
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          UserProfile(isDark: widget.isDark),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/user/icons/sellectedprofilepageicon.png',
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


  Widget _buildTicketCard({
    required String id,
    required String match,
    required String place,
    required String time,
    required String seat,
    required String note,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/usermassagedark.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SizedBox(
                width: 90,
                height: 110,
                child: Image.asset(
                  'assets/user/icons/ticketicon.png',
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ticket ID : $id",
                    style: const TextStyle(
                      fontFamily: 'Title',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Match Name: $match",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Title',
                    ),
                  ),
                  Text(
                    "Place : $place",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Title',
                    ),
                  ),
                  Text(
                    "Time : $time",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Title',
                    ),
                  ),
                  Text(
                    "Seat Number: $seat",
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Title',
                    ),
                  ),
                  Text(
                    note,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Title',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  
  Widget buildFollowingCard({
    required String logoPath,
    required String name,
    required String followers,
    required String location,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
          image: const DecorationImage(
            image: AssetImage('assets/usermassagedark.png'),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                logoPath,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontFamily: 'Title',
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Website link',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Title',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Followers : $followers',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Title',
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Image.asset(
                        'assets/user/icons/locationicon.png',
                        width: 16,
                        height: 16,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Title',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
