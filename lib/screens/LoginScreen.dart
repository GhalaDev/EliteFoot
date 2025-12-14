import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'PlayerDashboardScreen.dart';
import 'CoachWelcomeScreen.dart';
import 'SignUpScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> _login(BuildContext context) async {
    print("Login button pressed");

    final prefs = await SharedPreferences.getInstance();
    final accountType = prefs.getString('accountType');

    if (accountType == 'coach') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => CoachWelcomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => PlayerDashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_elite.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // LOGIN title
              const Positioned(
                left: 40,
                top: 50,
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontFamily: 'Baloo Bhaina',
                    color: Color(0xFFC01A1A),
                    fontSize: 40,
                    letterSpacing: 1.57,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Gray Box
              Positioned(
                left: 33,
                top: 150,
                child: Container(
                  width: 327,
                  height: 492,
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontFamily: 'Baloo Bhaina',
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),

                      TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                          ),
                          fillColor: const Color(0xFFD2A6A1).withOpacity(0.1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                          ),
                          fillColor: const Color(0xFFD2A6A1).withOpacity(0.1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.all(16),
                        ),
                      ),
                      const SizedBox(height: 20),

                      SizedBox(
                        width: w * 0.8,
                        child: ElevatedButton(
                          onPressed: () => _login(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ⭐ "Don’t have an account?" → take to SignUpScreen
              Positioned(
                left: 44,
                top: 650,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUpScreen()),
                    );
                  },
                  child: Text(
                    "Don’t have an account?",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
