import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // استيراد شاشة CoachFeedbackScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // لا حاجة لـ `const` هنا لأن الكائن ليس ثابتاً
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // إخفاء الشريط الأخضر في الأعلى
      theme: ThemeData(
        primarySwatch: Colors.blue, // تحديد اللون الأساسي
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(), // تعيين CoachFeedbackScreen كـ الصفحة الرئيسية
    );
  }
}
