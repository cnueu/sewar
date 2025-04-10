import 'package:flutter/material.dart';
import 'package:sewar/theme/app_styles.dart';
import 'package:blur/blur.dart';
import 'package:sewar/userscreens/userprofilepage.dart';
import 'package:sewar/userscreens/matchpage.dart';
import 'package:sewar/userscreens/homepage.dart';
import 'package:sewar/userscreens/insidchat.dart';

class ChatsScreen extends StatelessWidget {
  final bool isDark;

  const ChatsScreen({Key? key, required this.isDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(decoration: AppStyles.backgroundDecoration(isDark: isDark)),

          // خلفية شفافة للمحادثات تبدأ من تحت الهيدر
          Positioned.fill(
            top: 265,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/idkcolor.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                border: Border(
                  top: BorderSide(
                    color: Colors.white, 
                    width: 1.0, 
                  ),
                ),
              ),
            ),
          ),

          // المحتوى داخل SafeArea
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الهيدر
                  Row(
                    children: [
                      SizedBox(width: 9),

                      const Spacer(),
                      Text(
                        'Chats',
                        style: TextStyle(
                          fontFamily: 'Title',
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 110),
                    ],
                  ),
                  SizedBox(height: 25),

                  // models
                  Transform.translate(
                    offset: Offset(12, -25), // ← 10 يمين، -10 فوق
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MODELS',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white60,
                            fontFamily: 'Text',
                            letterSpacing: 3,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            _buildModelAvatar(
                              'assets/Deepseek.png',
                              'DeepSeek',
                            ),
                            const SizedBox(width: 16),
                            _buildModelAvatar('assets/llama.png', 'llama'),
                            const SizedBox(width: 16),
                            _buildModelAvatar('assets/Qwen.png', 'Qwen'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // المحادثات
                  Expanded(
                    child: ListView(
                      children: [
                        _buildChatTile(
                          context,
                          'assets/Deepseek.png',
                          'DeepSeek Model',
                          'No Problem, here',
                          '08:43',
                        ),
                        SizedBox(height: 5),
                        _buildChatTile(
                          context,
                          'assets/Deepseek.png',
                          'DeepSeek Model',
                          'Will do, super, thanks!',
                          'Tue',
                        ),
                        SizedBox(height: 5),
                        _buildChatTile(
                          context,
                          'assets/llama.png',
                          'Llama Model',
                          'Uploaded file.',
                          'Sun',
                        ),
                        SizedBox(height: 5),
                        _buildChatTile(
                          context,
                          'assets/Qwen.png',
                          'Qwen Model',
                          'Here is another tutorial...',
                          '23 Mar',
                        ),
                        SizedBox(height: 5),
                        _buildChatTile(
                          context,
                          'assets/Qwen.png',
                          'Qwen Model',
                          'No worries! I',
                          '18 Mar',
                        ),
                        SizedBox(height: 5),
                        _buildChatTile(
                          context,
                          'assets/Qwen.png',
                          'Qwen Model',
                          'Sure, here\'s the file yo..',
                          '01 Feb',
                        ),
                        SizedBox(height: 5),
                        _buildChatTile(
                          context,
                          'assets/Qwen.png',
                          'Qwen Model',
                          'Sure, here\'s the file yo..',
                          '01 Feb',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // الشريط السفلي - Bottom Navigation Bar
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
                              'assets/user/icons/unsellectedmatchpageicon.png',
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
                                      (context) => ChatsScreen(isDark: isDark),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/user/icons/sellectedaipageicon.png',
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

  Widget _buildModelAvatar(String imagePath, String name) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 30, 
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'Text',
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildChatTile(
    BuildContext context,
    String avatarPath,
    String modelName,
    String message,
    String time,
  ) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => InsideChat(
                  isDark: isDark,
                  modelName: modelName,
                  avatarPath: avatarPath,
                ),
          ),
        );
      },
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(10, 10),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(avatarPath),
        ),
      ),
      contentPadding: const EdgeInsets.only(right: 10),
      title: Text(
        modelName, 
        style: const TextStyle(
          fontFamily: 'Text',
          fontSize: 25,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(
          fontFamily: 'Text',
          fontSize: 18,
          color: Colors.white60,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: const TextStyle(
          fontFamily: 'Text',
          fontSize: 20,
          color: Colors.white60,
        ),
      ),
    );
  }
}
