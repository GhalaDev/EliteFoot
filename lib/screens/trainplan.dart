import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrainingPlanScreen(),
    );
  }
}

class TrainingPlanScreen extends StatefulWidget {
  const TrainingPlanScreen({super.key});

  @override
  _TrainingPlanScreenState createState() => _TrainingPlanScreenState();
}

class _TrainingPlanScreenState extends State<TrainingPlanScreen> {
  final TextEditingController planTitleController = TextEditingController();
  final TextEditingController coachNoteController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  // List of players (you can replace this with actual player images or data)
  final List<Map<String, String>> players = [
    {'name': 'Bellingham', 'image': 'assets/bellingham.jpg'},
    {'name': 'Vinicius JR', 'image': 'assets/vinicius.jpg'},
    {'name': 'Brahim Diaz', 'image': 'assets/brahim.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Create New Training Plan',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Adjusted padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Plan Title',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            TextField(
              controller: planTitleController,
              decoration: InputDecoration(
                hintText: 'Enter plan title',
                filled: true,
                fillColor: Colors.black,
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Select Players',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: players.map((player) {
                return GestureDetector(
                  onTap: () {
                    // Handle player selection logic
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: CircleAvatar(
                      radius: 20, // Reduced size of player image
                      backgroundImage: AssetImage(player['image']!),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add exercise logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 25,
                ), // Adjusted padding
              ),
              child: Text('+ Add Exercise'),
            ),
            SizedBox(height: 10),
            Text(
              'Date & Time',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            TextField(
              controller: dateTimeController,
              decoration: InputDecoration(
                hintText: 'Pick date and time',
                filled: true,
                fillColor: Colors.black,
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Coach\'s Note',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            TextField(
              controller: coachNoteController,
              decoration: InputDecoration(
                hintText: 'Add special instructions here...',
                filled: true,
                fillColor: Colors.black,
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              maxLines: 3, // Reduced lines to make it more compact
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Publish the plan logic here
                  String planTitle = planTitleController.text;
                  String coachNote = coachNoteController.text;
                  String dateTime = dateTimeController.text;
                  print('Plan Title: $planTitle');
                  print('Coach\'s Note: $coachNote');
                  print('Date & Time: $dateTime');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ), // Adjusted padding
                ),
                child: Text('Publish Plan'),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
