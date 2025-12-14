import 'package:flutter/material.dart';

class TrainingPlanScreen extends StatefulWidget {
  const TrainingPlanScreen({super.key});

  @override
  _TrainingPlanScreenState createState() => _TrainingPlanScreenState();
}

class _TrainingPlanScreenState extends State<TrainingPlanScreen> {
  final TextEditingController planTitleController = TextEditingController();
  final TextEditingController coachNoteController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  final List<Map<String, String>> players = [
    {'name': 'Bellingham', 'image': 'assets/bellingham.jpg'},
    {'name': 'Vinicius JR', 'image': 'assets/vinicius.jpg'},
    {'name': 'Brahim Diaz', 'image': 'assets/brahim.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.red,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Plan Title',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            TextField(
              controller: planTitleController,
              decoration: InputDecoration(
                hintText: 'Enter plan title',
                filled: true,
                fillColor: Colors.black,
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),

            const Text(
              'Select Players',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 10),

            Center(
              child: Container(
                width: 380,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: players.map((player) {
                        return GestureDetector(
                          onTap: () {
                            // منطق اختيار اللاعب لاحقاً
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7.0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 20),
                                Container(
                                  width: 105,
                                  height: 105,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFD04130),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFD04130),
                                      ),
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundImage: AssetImage(
                                          player['image']!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  player['name']!,
                                  style: TextStyle(
                                    color: Colors.grey[300],
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const Positioned(
                      left: 10,
                      bottom: 10,
                      child: Text(
                        'more...',
                        style: TextStyle(
                          color: Color.fromARGB(255, 133, 131, 131),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // منطق إضافة التمرين
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(182, 244, 67, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 115,
                  ),
                ),
                child: const Text(
                  '+ Add Exercise',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Date & Time',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            TextField(
              controller: dateTimeController,
              decoration: InputDecoration(
                hintText: 'Pick date and time',
                filled: true,
                fillColor: Colors.black,
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 20),

            const Text(
              'Coach\'s Note',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            TextField(
              controller: coachNoteController,
              decoration: InputDecoration(
                hintText: 'Add special instructions here...',
                filled: true,
                fillColor: Colors.black,
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLines: 1,
              style: const TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  final planTitle = planTitleController.text;
                  final coachNote = coachNoteController.text;
                  final dateTime = dateTimeController.text;

                  // حالياً نطبع في الـ console
                  print('Plan Title: $planTitle');
                  print('Coach\'s Note: $coachNote');
                  print('Date & Time: $dateTime');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(182, 244, 67, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 125,
                  ),
                ),
                child: const Text(
                  'Publish Plan',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
