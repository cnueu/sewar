import 'package:flutter/material.dart';
import 'package:sewar/userscreens/aimodels.dart';
import 'package:sewar/userscreens/userprofilepage.dart';
import 'package:sewar/userscreens/matchpage.dart';
import 'package:sewar/userscreens/homepage.dart';
import 'package:blur/blur.dart';

class AppStyles {
  // ----------  ألوان ----------
  static const Color veryLightGray = Color.fromARGB(255, 203, 203, 205);
  static const Color gray = Color.fromARGB(255, 92, 89, 94);
  static const Color veryDarkGray = Color.fromARGB(255, 67, 65, 66);

  static const Color veryLightPurple = Color.fromRGBO(98, 21, 95, 1);
  static const Color purple = Color.fromRGBO(73, 15, 77, 1);
  static const Color veryDarkPurple = Color.fromRGBO(35, 6, 29, 1);

  static const Color veryLightGreen = Color.fromRGBO(102, 111, 46, 1);
  static const Color green = Color.fromRGBO(53, 63, 21, 1);
  static const Color veryDarkGreen = Color.fromRGBO(43, 48, 22, 1);

  static const Color icongray = Color.fromRGBO(41, 45, 50, 1);

  // ألوان النص
  static const Color textLight = Colors.white;
  static const Color textDark = Colors.black;

  // ألوان الأزرار
  static const Color buttonPrimary = Color.fromRGBO(99, 1, 108, 1);
  static const Color buttonLight = Colors.white;

  // لون تعبئة الحقول
  static const Color inputFill = Colors.black12;

  // ---------- الخلفيات ----------
  static const String lightBackgroundImage = 'assets/LightBackground.png';
  static const String darkUserBackgroundImage = 'assets/backgroundUserDark.png';
  static const String darkCompanyBackgroundImage =
      'assets/backgroundCompanyDark.png';

  // ----------  أيقونات الشريط السفلي ----------

  // Bottom nav icons
  static const String iconHomeSelected =
      'assets/user/icons/sellectedhomepageicon.png';
  static const String iconHomeUnselected =
      'assets/user/icons/unsellectedhomepageicon.png';

  static const String iconMatchSelected =
      'assets/user/icons/sellectedmatchpageicon.png';
  static const String iconMatchUnselected =
      'assets/user/icons/unsellectedmatchpageicon.png';

  static const String iconAISelected =
      'assets/user/icons/sellectedaipageicon.png';
  static const String iconAIUnselected =
      'assets/user/icons/unsellectedaipageicon.png';

  static const String iconProfileSelected =
      'assets/user/icons/sellectedprofilepageicon.png';
  static const String iconProfileUnselected =
      'assets/user/icons/unsellectedprofilepageicon.png';

  // ----------  الثيمات حسب المود ----------
  static Color textColor(bool isDark) => isDark ? textLight : textDark;

  static Color iconColor(bool isDark) => isDark ? textLight : icongray;

  static Color backgroundColor(bool isDark) =>
      isDark ? veryDarkGray : veryLightGray;

  static Color buttonColor(bool isDark) => isDark ? purple : veryLightPurple;

  static Decoration backgroundDecoration({
    required bool isDark,
    bool isCompany = false,
  }) {
    String image =
        isDark
            ? (isCompany ? darkCompanyBackgroundImage : darkUserBackgroundImage)
            : lightBackgroundImage;

    return BoxDecoration(
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
    );
  }




  static Decoration companybackgroundDecoration({
    required bool isDark,
    bool isUser = false,
  }) {
    String image =
        isDark
            ? (isUser ? darkUserBackgroundImage : darkCompanyBackgroundImage)
            : lightBackgroundImage;

    return BoxDecoration(
      image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
    );
  }

  static Color placeholderColor(bool isDark) =>
      isDark ? Colors.deepOrange : Colors.cyan;
}










class UserBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final bool isDark;

  const UserBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
       UserHomeScreen(isDark: isDark),
      MatchCategoriesScreen(isDark: isDark),
      ChatsScreen(isDark: isDark),
      UserProfile(isDark: isDark),
    ];

    final List<String> icons = [
      currentIndex == 0
          ? 'assets/user/icons/sellectedhomepageicon.png'
          : 'assets/user/icons/unsellectedhomepageicon.png',
      currentIndex == 1
          ? 'assets/user/icons/sellectedmatchpageicon.png'
          : 'assets/user/icons/unsellectedmatchpageicon.png',
      currentIndex == 2
          ? 'assets/user/icons/sellectedaipageicon.png'
          : 'assets/user/icons/unsellectedaipageicon.png',
      currentIndex == 3
          ? 'assets/user/icons/sellectedprofilepageicon.png'
          : 'assets/user/icons/unsellectedprofilepageicon.png',
    ];

    return Positioned(
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
                          const Color.fromARGB(255, 146, 146, 146).withOpacity(0.4),
                          const Color.fromARGB(255, 97, 95, 95).withOpacity(0.4),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // الأيقونات فوق كل شي
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        if (index != currentIndex) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => pages[index],
                            ),
                          );
                        }
                      },
                      child: Image.asset(
                        icons[index],
                        width: 26,
                        height: 26,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
