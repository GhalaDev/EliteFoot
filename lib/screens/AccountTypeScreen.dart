import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginScreen.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  Future<void> _selectType(BuildContext context, String type) async {
    final prefs = await SharedPreferences.getInstance();

    // نحفظ نوع الحساب (player أو coach)
    await prefs.setString('accountType', type);
    await prefs.setBool('chosenAccountType', true);

    // ✅ في كل الحالات (player أو coach) نروح لصفحة تسجيل الدخول
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Text(
                'CHOOSE YOUR\nACCOUNT TYPE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Baloo Bhaina',
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.05),
                child: Column(
                  children: [
                    // زر PLAYER
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: ElevatedButton(
                        onPressed: () => _selectType(context, 'player'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(
                            255,
                            58,
                            48,
                            0.626,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'PLAYER',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // زر COACH
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: ElevatedButton(
                        onPressed: () => _selectType(context, 'coach'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(
                            255,
                            59,
                            48,
                            0.626,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'COACH',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // الصورة في الأسفل
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.59,
                  child: Image.asset(
                    'assets/account_type_bg.png',
                    fit: BoxFit.cover,
                    width: screenWidth,
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
