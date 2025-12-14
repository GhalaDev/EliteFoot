import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_screen.dart'; // تأكد من استيراد شاشة Onboarding
import 'AccountTypeScreen.dart'; // تأكد من استيراد شاشة AccountTypeScreen
import 'home_screen.dart'; // تأكد من استيراد شاشة HomeScreen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNext(); // دالة تحديد التنقل بعد 5 ثوانٍ
  }

  // الدالة غير المتزامنة لتحميل البيانات والتأخير بشكل غير متزامن
  Future<void> _goNext() async {
    final prefs = await SharedPreferences.getInstance(); // تحميل البيانات بشكل غير متزامن
    final bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;
    final bool chosenAccountType = prefs.getBool('chosenAccountType') ?? false;

    // تأخير لمدة 5 ثوانٍ بشكل غير متزامن
    await Future.delayed(const Duration(seconds: 5));

    // التحقق من القيم وتنقل بين الشاشات
    if (!seenOnboarding) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    } else if (!chosenAccountType) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AccountTypeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_elite.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/logo_elite.png',
            width: 500,
          ),
        ),
      ),
    );
  }
}
