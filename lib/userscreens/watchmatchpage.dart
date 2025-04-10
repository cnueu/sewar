import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:provider/provider.dart';
import 'package:sewar/theme/app_styles.dart';
import 'package:sewar/theme/themeprovider.dart';

class WatchMatch extends StatelessWidget {
  final String team1;
  final String team2;
  final String team1Image;
  final String team2Image;
  final String time;
  final String location;

  const WatchMatch({
    super.key,
    required this.team1,
    required this.team2,
    required this.team1Image,
    required this.team2Image,
    required this.time,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDark;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: AppStyles.backgroundDecoration(isDark: isDark),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
                      ),
                      const Spacer(),
                      Text(
                        '$team1 VS $team2',
                        style: const TextStyle(
                          fontFamily: 'Title',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                  const SizedBox(height: 20),

                  //  النتيجة
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Image.asset(team1Image, width: 50),
                                Text(team1, style: const TextStyle(color: Colors.white)),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  '1 - 0',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  time,
                                  style: const TextStyle(
                                    color: Colors.white60,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(team2Image, width: 50),
                                Text(team2, style: const TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(location, style: const TextStyle(color: Colors.white54)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  //  التبديل بين الأوضاع
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Deaf/Blind Vibration', style: TextStyle(color: Colors.white60)),
                      Switch(
                        value: true,
                        onChanged: (val) {},
                        activeColor: Colors.deepPurpleAccent,
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 2.6,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildOptionButton('Statistics', selected: true),
                      _buildOptionButton('Menu'),
                      _buildOptionButton('Cameras'),
                      _buildOptionButton('AI Chat'),
                      _buildOptionButton('Events'),
                      _buildOptionButton('Votes'),
                      _buildOptionButton('Games'),
                      _buildOptionButton('Map'),
                      _buildOptionButton('Tickets'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(91, 0, 0, 0),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white.withOpacity(0.2)),
                        ),
                        child: ListView(
                          children: [
                            _buildUnifiedStatRow('Shots on Target', 1, 1),
                            _buildUnifiedStatRow('Shots off Target', 3, 2),
                            _buildUnifiedStatRow('Blocked Shots', 3, 3),
                            _buildUnifiedStatRow('Possession (%)', 44, 56),
                            _buildUnifiedStatRow('Corner Kicks', 4, 6),
                            _buildUnifiedStatRow('Offsides', 3, 1),
                            _buildUnifiedStatRow('Fouls', 44, 56),
                            _buildUnifiedStatRow('Throw-ins', 4, 6),
                            _buildUnifiedStatRow('Yellow Cards', 3, 1),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionButton(String title, {bool selected = false}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: selected ? Colors.white : const Color.fromARGB(23, 0, 0, 0),
        foregroundColor: selected ? Colors.black : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.zero,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
      child: Center(child: Text(title, textAlign: TextAlign.center)),
    );
  }

  Widget _buildUnifiedStatRow(String title, int team1, int team2) {
    int total = team1 + team2;
    double t1Ratio = total == 0 ? 0.5 : team1 / total;
    double t2Ratio = total == 0 ? 0.5 : team2 / total;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(255, 50, 73, 74),
                    Colors.transparent,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: (t1Ratio * 100).toInt(),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      height: 23,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(121, 141, 8, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Color.fromRGBO(55, 106, 1, 1),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 60),
              Expanded(
                flex: (t2Ratio * 100).toInt(),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      height: 26,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(121, 141, 8, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const Positioned(
                      left: 0,
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Color.fromRGBO(55, 106, 1, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(55, 106, 1, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$team1',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(55, 106, 1, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$team2',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
