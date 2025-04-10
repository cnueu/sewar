import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'userscreens/homepage.dart';
import 'theme/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDark = false;
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppStyles.backgroundDecoration(isDark: isDark),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // رجوع + الثيم
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              IconButton(
                                icon: Icon(
                                  isDark ? Icons.wb_sunny : Icons.dark_mode,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isDark = !isDark;
                                  });
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),
                          Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Text',
                              color: AppStyles.textLight,
                            ),
                          ),

                          const SizedBox(height: 30),
                          _buildTextField(
                            'Email address',
                            'example@gmail.com',
                            suffixIcon: Icons.check_circle_outline,
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            'Password',
                            '********',
                            obscure: obscurePassword,
                            suffixIcon:
                                obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                            onSuffixTap: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                          ),

                          const SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // TODO: Forgot password
                              },
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(color: Colors.purpleAccent),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            height: 60,
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
                                  MaterialPageRoute(
                                    builder: (context) =>  UserHomeScreen(isDark: isDark),
                                  ),
                                );
                              },
                              child: Text(
                                'Log in',
                                style: TextStyle(color: AppStyles.textLight),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),

                          // Divider مع النص
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.white38,
                                  thickness: 1,
                                  endIndent: 10,
                                ),
                              ),
                              Text(
                                'Or Login with',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.white38,
                                  thickness: 1,
                                  indent: 10,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // أيقونات تسجيل دخول
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSocialIconBox('assets/abshericon.png'),
                              SizedBox(width: 16),
                              _buildSocialIconBox('assets/googleicon.png'),
                              SizedBox(width: 16),
                              _buildSocialIconBox('assets/appleicon.png'),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Sign up تحت
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to sign up
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Don’t have an account? ",
                                  style: TextStyle(color: Colors.white70),
                                  children: [
                                    TextSpan(
                                      text: "Sign up",
                                      style: TextStyle(
                                        color: Colors.purpleAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          Spacer(), // توازن لو كانت الصفحة قصيرة
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    String hint, {
    bool obscure = false,
    IconData? suffixIcon,
    VoidCallback? onSuffixTap,
  }) {
    return TextField(
      obscureText: obscure,
      style: TextStyle(color: AppStyles.textLight),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white70),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white38),
        filled: true,
        fillColor: AppStyles.inputFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        suffixIcon:
            suffixIcon != null
                ? IconButton(
                  onPressed: onSuffixTap,
                  icon: Icon(suffixIcon, color: Colors.white54),
                )
                : null,
      ),
    );
  }

  Widget _buildSocialIconBox(String assetPath, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Image.asset(assetPath, fit: BoxFit.contain),
      ),
    );
  }
}
