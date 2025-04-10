import 'package:flutter/material.dart';
import 'package:sewar/userscreens/homepage.dart';
import '/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'theme/themeprovider.dart';
import 'userscreens/matchpage.dart';
import 'package:sewar/theme/app_styles.dart';
import 'package:sewar/theme/themeprovider.dart';
import 'companyscreens/homepage.dart';
 

 // يفضل تشغيل التطبيق عبر المتصفح وليس الهاتف لأنه يبطئ العمليات
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registration UI',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: const Color.fromARGB(255, 135, 135, 135),
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
} 