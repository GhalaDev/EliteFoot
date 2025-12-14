import 'package:flutter/material.dart';
import 'DashboardScreen .dart';
import 'PlayerTrainingPlanScreen.dart';
import 'heart_rate_screen.dart';
import 'Vo2MaxScreen.dart';
import 'injury_history_screen.dart';
import 'fatigue_screen.dart'; // << استيراد شاشة التعب

class InjuryRiskScreen extends StatelessWidget {
  const InjuryRiskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ====== صورة اللاعب ======
          Positioned(
            left: -25,
            top: 140,
            child: Image.asset(
              'assets/injury_player_image.png',
              width: 450,
              height: 700,
              fit: BoxFit.contain,
            ),
          ),

          // ====== زر الرجوع ======
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => DashboardScreen()),
                );
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),

          // ====== العنوان ======
          const Positioned(
            top: 100,
            left: 30,
            child: Text(
              'HIGH RISK OF\nINJURY!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),

          // ====== Heart Rate ======
          Positioned(
            left: 37,
            top: 634,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HeartRateScreen()),
                );
              },
              child: _infoBox("Heart Rate"),
            ),
          ),

          // ====== VO2 Max ======
          Positioned(
            left: 37,
            top: 702,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VO2MaxScreen()),
                );
              },
              child: _infoBox("VO2 Max"),
            ),
          ),

          // ====== Previous Injuries ======
          Positioned(
            left: 211,
            top: 631,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => InjuryHistoryScreen()),
                );
              },
              child: _infoBox("Previous Injuries"),
            ),
          ),

          // ====== Fatigue Level ======
          Positioned(
            left: 211,
            top: 702,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FatigueScreen()),
                );
              },
              child: _infoBox("Fatigue Level"),
            ),
          ),

          // ====== Modify Player Plan ======
          Positioned(
            left: 37,
            top: 772,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PlayerTrainingPlanScreen()),
                );
              },
              child: _infoBox("Modify Player Plan", fullWidth: true),
            ),
          ),
        ],
      ),
    );
  }

  // ====== البوكس المشترك ======
  static Widget _infoBox(String text, {bool fullWidth = false}) {
    return Container(
      width: fullWidth ? 319 : 145,
      height: 59,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD04130), width: 2),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
