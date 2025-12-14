import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'PlayerDashboardScreen.dart';
import 'CoachWelcomeScreen.dart';
import 'LoginScreen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  Future<void> _signUp(BuildContext context) async {
    print("Sign Up button pressed");

    final prefs = await SharedPreferences.getInstance();
    final accountType = prefs.getString('accountType');

    if (accountType == 'coach') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const CoachWelcomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PlayerDashboardScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_elite.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // SIGN UP title
              const Positioned(
                left: 40,
                top: 50,
                child: Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontFamily: 'Baloo Bhaina',
                    color: Color(0xFFC01A1A),
                    fontSize: 40,
                    letterSpacing: 1.57,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Gray Form Box
              Positioned(
                left: 33,
                top: 150,
                child: Container(
                  width: 327,
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create Your Account',
                        style: TextStyle(
                          fontFamily: 'Baloo Bhaina',
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),

                      TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Full Name',
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

                      TextField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
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
                          onPressed: () => _signUp(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // "Already have an account?" → return to LoginScreen
              Positioned(
                left: 44,
                top: 650,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    "Already have an account?",
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
