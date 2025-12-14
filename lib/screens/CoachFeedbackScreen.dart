import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: CoachFeedbackScreen(),
    );
  }
}

class CoachFeedbackScreen extends StatelessWidget {
  final List<FeedbackItem> feedbackItems = [
    FeedbackItem(
      title: 'Match Review - Last Game',
      coachName: 'Xabi Alonso',
      date: 'November 22, 2025',
      details:
          'Excellent work rate, but focus quicker ball release in the final third...',
      isNext: false,
    ),
    FeedbackItem(
      title: 'Weekly Fitness Target',
      coachName: 'Xabi Alonso',
      date: 'November 20, 2025',
      details:
          'Maintain consistency on your sprints, check your Endurance score...',
      isNext: false,
    ),
    FeedbackItem(
      title: 'Training Session Preparation',
      coachName: 'Xabi Alonso',
      date: 'November 18, 2025',
      details:
          'Remember to wear your heart rate monitor in the morning session...',
      isNext: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Coach\'s Feedback',
          style: TextStyle(
            color: Colors.white, // <<< هنا يخلي النص أبيض
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.black,
      ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Unread (3)',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Archived',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: feedbackItems.length,
                    itemBuilder: (context, index) {
                      final item = feedbackItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.red),
                          ),
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (item.isNext)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        'NEXT',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Coach: ${item.coachName}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Date: ${item.date}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                item.details,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -10,
            left: 0,
            child: Row(
              children: [
                Image.asset(
                  'assets/image 47.png', // تأكد من أنك وضعت الصورة في مجلد "assets" داخل مشروعك
                  width: 100, // يمكنك تعديل الحجم كما تشاء
                  height: 200,
                ),
                SizedBox(width: 1), // المسافة بين الصورة ومربع النص
                Container(
                  width: 200,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18, // هنا يمكنك تحديد حجم النص
                    ),
                    decoration: InputDecoration(
                      hintText: 'Chat with Coach',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none, // بدون حدود
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeedbackItem {
  final String title;
  final String coachName;
  final String date;
  final String details;
  final bool isNext;

  FeedbackItem({
    required this.title,
    required this.coachName,
    required this.date,
    required this.details,
    this.isNext = false,
  });
}
