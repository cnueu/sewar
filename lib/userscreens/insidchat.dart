import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:sewar/theme/app_styles.dart';

class InsideChat extends StatefulWidget {
  final bool isDark;
  final String modelName;
  final String avatarPath;

  const InsideChat({
    Key? key,
    required this.isDark,
    required this.modelName,
    required this.avatarPath, 
  }) : super(key: key);

  @override
  State<InsideChat> createState() => _InsideChatState();
}

class _InsideChatState extends State<InsideChat> {
  final List<Map<String, dynamic>> messages = [
    {
      'isUser': true,
      'sender': 'User',
      'message':
          'حسنًا الآن تحدث معي بالعربية و قدم لي معلومات عن أفضل الأيام لمشاهدة مباراة',
      'isRTL': true,
    },
    {
      'isUser': false,
      'sender': 'AI',
      'message':
          'بالنظر إلى الظروف الجوية، يبدو أن هناك يومين خلال الأسبوع القادم سيكونان الأنسب...',
      'isRTL': true,
    },
  ];

  final TextEditingController messageController = TextEditingController();

  void _sendMessage() {
    String text = messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({
        'isUser': true,
        'sender': 'You',
        'message': text,
        'isRTL': false,
      });
    });

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: AppStyles.backgroundDecoration(isDark: widget.isDark),
          ),
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          widget.avatarPath,
                        ), 
                        radius: 18,
                      ),

                      const SizedBox(width: 12),
                      Text(
                        widget
                            .modelName, 
                        style: const TextStyle(
                          fontFamily: 'Title',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // Messages list
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final msg = messages[index];
                      return buildFancyMessageFixed(
                        isUser: msg['isUser'],
                        sender: msg['sender'],
                        message: msg['message'],
                        isDark: widget.isDark,
                        isRTL: msg['isRTL'] ?? false,
                      );
                    },
                  ),
                ),

                // Input
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 80),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const SizedBox(width: 5),
                        Image.asset(
                          'assets/user/icons/voicechaticon.png',
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: messageController,
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              hintText: "Type a message...",
                              hintStyle: TextStyle(color: Colors.white54),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: _sendMessage,
                          child: const Icon(Icons.send, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFancyMessageFixed({
    required bool isUser,
    required String sender,
    required String message,
    required bool isDark,
    bool isRTL = false,
  }) {
    String avatar = 'assets/robot.png';
    String bubbleImage =
        isUser ? 'assets/usermassagedark.png' : 'assets/aimassagedark.png';

    return Align(
      alignment: isUser ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 320),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bubbleImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: isUser ? TextDirection.ltr : TextDirection.rtl,
              children: [
                CircleAvatar(backgroundImage: AssetImage(avatar), radius: 18),
                const SizedBox(width: 8),
                Text(
                  sender,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            const Divider(color: Colors.white, thickness: 1.0),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: isRTL ? TextAlign.right : TextAlign.left,
              textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
