import 'package:flutter/material.dart';
import 'package:sewar/userscreens/homepage.dart';
import 'theme/app_styles.dart';
import 'package:flutter/cupertino.dart';

class NewUserScreen extends StatefulWidget {
  const NewUserScreen({super.key});

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  bool isDark = false;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppStyles.backgroundDecoration(isDark: isDark),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row
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
                    'New User',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Text',
                      color: AppStyles.textLight,
                    ),
                  ),

                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Female', style: TextStyle(color: Colors.white)),
                      SizedBox(width: 12),
                      Transform.scale(
                        scale: 1.3,
                        child: CupertinoSwitch(
                          value: isMale,
                          onChanged: (val) => setState(() => isMale = val),
                          activeColor: isMale ? Colors.blue : Colors.pinkAccent,
                          trackColor:
                              isMale
                                  ? Colors.blue.withOpacity(0.4)
                                  : Colors.pink.withOpacity(0.4),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text('Male', style: TextStyle(color: Colors.white)),
                    ],
                  ),

                  const SizedBox(height: 30),
                  _buildTextField('First Name', 'example Yumna'),
                  const SizedBox(height: 16),
                  _buildTextField('Last Name', 'example Aljasem'),
                  const SizedBox(height: 16),
                  _buildTextField('Email', 'example@gmail.com'),
                  const SizedBox(height: 16),
                  _buildTextField('Create Password', '', obscure: true),
                  const SizedBox(height: 16),
                  _buildTextField('Confirm Password', '', obscure: true),

                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppStyles.buttonPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: TextStyle(fontSize: 20, fontFamily: 'Text'),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserHomeScreen(isDark: isDark,)),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: AppStyles.textLight),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Divider with text
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
                        'Or Register with',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
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

                  // Social icons row
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

                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // TODO: go to login
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.white70),
                          children: [
                            TextSpan(
                              text: "Log in",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool obscure = false}) {
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
