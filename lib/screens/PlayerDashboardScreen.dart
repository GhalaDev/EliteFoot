import 'package:flutter/material.dart';
import 'WorkoutPlanScreen.dart';
import 'CoachFeedbackScreen.dart';
import 'PerformanceImageScreen.dart';
import 'SettingsScreen.dart'; 

class PlayerDashboardScreen extends StatelessWidget {
  const PlayerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // نص الترحيب
            Positioned(
              top: 0,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Welcome,Bellingham',
                    style: TextStyle(
                      color: Color(0xFFD14232),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // صورة اللاعب
            Positioned(
              left: -1,
              top: 355,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/player_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // البوكسات الثلاثة (Plan / Progress / Coach Notes)
            Positioned(
              top: screenHeight * 0.09,
              left: 25,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // *************** Plan Player ***************
                  _buildDashboardBox(
                    context,
                    iconPath: 'assets/plan_icon.png',
                    title1: "   Plan",
                    title2: "  Player",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => WorkoutPlanScreen()),
                      );
                    },
                  ),

                  const SizedBox(width: 20),

                  // *************** Progress Player ***************
                  _buildDashboardBox(
                    context,
                    iconPath: 'assets/progress_icon.png',
                    title1: "Progress",
                    title2: "Player",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PerformanceImageScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(width: 20),

                  // *************** Coach Notes ***************
                  _buildDashboardBox(
                    context,
                    iconPath: 'assets/coach_notes_icon.png',
                    title1: "Coach's",
                    title2: "Notes",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CoachFeedbackScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // زر SETTINGS قابل للضغط
            Positioned(
              left: 20,
              top: 280,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()),
                  );
                },
                child: Container(
                  width: 345,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(199, 209, 66, 50),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "SETTINGS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // *************** Widget مختصر للبوكس ***************
  Widget _buildDashboardBox(
    BuildContext context, {
    required String iconPath,
    required String title1,
    required String title2,
    required VoidCallback onTap,
  }) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 180,
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFD14232), width: 2),
          ),
        ),
        Positioned(
          top: 2,
          left: -8,
          child: IconButton(
            icon: Image.asset(iconPath, width: 100, height: 100),
            onPressed: onTap,
          ),
        ),
        Positioned(
          top: 120,
          left: 20,
          child: Column(
            children: [
              Text(
                title1,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                title2,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
