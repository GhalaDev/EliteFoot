import 'package:flutter/material.dart';
import 'TrainingDetailsScreen.dart'; // استيراد شاشة TrainingDetailsScreen
// استيراد صفحة PlayerDashboardScreen

class WorkoutPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // جعل الخلفية السوداء لتناسب المظهر
      appBar: AppBar(
        backgroundColor: Colors.black, // جعل لون الـ AppBar أسود
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // السهم الرجوع
          onPressed: () {
            // عند الضغط على السهم، العودة إلى صفحة PlayerDashboardScreen
            Navigator.pop(context); // العودة إلى الصفحة السابقة
          },
        ),
      ),
      body: SafeArea(
        // استخدام SafeArea لضمان أن العناصر لا تتداخل مع الـ AppBar
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black, // لون الخلفية للعنوان
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Today's Training Plan", // النص
                  style: TextStyle(
                    fontSize: 30, // حجم النص
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20), // مسافة بين العنوان وبقية العناصر

              Container(
                width: double.infinity,
                height: 260,
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                    255,
                    49,
                    49,
                    49,
                  ), // اللون الرمادي الداكن
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Today's Workout",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Workout Items
                      WorkoutItem(
                        title: "Running",
                        time: "20 minutes",
                        note: "15 minutes",
                      ),
                      WorkoutItem(
                        title: "Speed Drills",
                        time: "15 minutes",
                        note: "15 minutes",
                      ),
                      WorkoutItem(
                        title: "Strength Training",
                        time: "N/A",
                        note: "",
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Total Time: 65 minutes",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Coach's Note with the custom image
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 220,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFF8F1C17), // لون البوكس
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/image6.png', // تأكد من مسار الصورة الصحيح
                          width: 50, // حجم الأيقونة
                          height: 50,
                        ),
                        SizedBox(width: 12), // مسافة بين الأيقونة والنص
                        Text(
                          "Coach's Note",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2), // مسافة بين النص والفقرة
                    Text(
                      "Today, focus on the quality of movement before speed. Maintain a straight back in strength exercises, and be ready to increase speed gradually.",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Start Workout Button with the specified size and position
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // عند الضغط على زر "Start Workout"، التوجه إلى TrainingDetailsScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TrainingDetailsScreen(),
                    ), // الانتقال إلى TrainingDetailsScreen
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ), // زيادة المسافات الداخلية
                  backgroundColor: Color(0xFFD04130), // تغيير لون الزر
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    "Start Workout",
                    style: TextStyle(
                      fontSize: 25, // حجم النص يمكنك التحكم فيه هنا
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // تغيير لون النص إلى الأبيض
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

class WorkoutItem extends StatelessWidget {
  final String title;
  final String time;
  final String note;

  WorkoutItem({required this.title, required this.time, required this.note});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
          Text(time, style: TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }
}
