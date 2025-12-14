import 'package:flutter/material.dart';
import 'SettingsScreen.dart'; // شاشة الإعدادات
import 'DashboardScreen .dart'; // شاشة الداشبورد

class CoachWelcomeScreen extends StatelessWidget {
  const CoachWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية السوداء
          Container(color: Colors.black),

          // نص الترحيب
          const Positioned(
            top: 50,
            left: 30,
            right: 20,
            child: Text(
              'Welcome, Coach Xabi Alonso!',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC01A1A),
              ),
              textAlign: TextAlign.left,
            ),
          ),

          // النص الفرعي
          const Positioned(
            top: 170,
            left: 60,
            right: 20,
            child: Text(
              'Your team awaits your guidance',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 112, 112, 112),
              ),
              textAlign: TextAlign.left,
            ),
          ),

          // زر GO TO DASHBOARD → يفتح DashboardScreen
          Positioned(
            left: 47,
            top: 200,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DashboardScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0x99D04130),
                minimumSize: const Size(299, 48),
                textStyle: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              child: const Text(
                'GO TO DASHBOARD',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          // زر SETTINGS → يفتح SettingsScreen
          Positioned(
            left: 47,
            top: 260,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0x99D04130),
                minimumSize: const Size(299, 48),
                textStyle: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              child: const Text(
                'SETTINGS',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          // صورة المدرب
          Positioned(
            left: -18,
            top: 341,
            child: Image.asset(
              'assets/xabi_alonso_image.png',
              width: 429,
              height: 518,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
