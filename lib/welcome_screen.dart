import 'package:flutter/material.dart';
import 'login.dart';
import 'new_company_screen.dart';
import 'new_user_screen.dart';
import 'package:sewar/theme/app_styles.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppStyles.lightBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/user/logo.png',
                  height: 350,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: 40),

                // زر Login
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyles.buttonPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Text',
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: AppStyles.textLight),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // زر New User
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyles.buttonLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Text',
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewUserScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'New User',
                      style: TextStyle(color: AppStyles.textDark),
                    ),
                  ),
                ),

                SizedBox(height: 16),

                // زر New Company
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppStyles.buttonLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Text',
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewCompanyScreen()),
                      );
                    },
                    child: Text(
                      'New Company',
                      style: TextStyle(color: AppStyles.textDark),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
