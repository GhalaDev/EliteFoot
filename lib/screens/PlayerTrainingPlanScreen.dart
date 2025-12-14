import 'package:flutter/material.dart';

class PlayerTrainingPlanScreen extends StatelessWidget {
  const PlayerTrainingPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // يرجع للصفحة السابقة (InjuryRiskScreen أو اللي فتحت منها)
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Workout Progress Section
            Center(
              child: Transform.scale(
                scale: 1.9,
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    CircularProgressIndicator(
                      value: 0.38,
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation(Color(0xFFD14232)),
                      backgroundColor: Color(0xFF333333),
                    ),
                    Text(
                      "38%",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFD14232),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Speed Drills Section
            _buildTrainingSection(
              icon: Icons.directions_run,
              title: 'Speed Drills:',
              description:
                  '• 6 sets x 30 meters (90% max speed)\n'
                  '• 6 sets x 30 meters (60 sec rest, 60 sec rest between sets)',
            ),
            const SizedBox(height: 20),

            // Squat Jumps Section
            _buildTrainingSection(
              icon: Icons.fitness_center,
              title: 'Squat Jumps:',
              description: '• 4 sets x 8 Single-Leg RDL\n• 3 sets per leg',
            ),
            const SizedBox(height: 20),

            // Squat Jumps Section (second entry)
            _buildTrainingSection(
              icon: Icons.fitness_center,
              title: 'Squat Jumps:',
              description: '• 4 sets + Single x 8 reps',
            ),
            const SizedBox(height: 20),

            // Static Stretches & Foam Rolling Section
            _buildTrainingSection(
              icon: Icons.accessibility_new,
              title: 'Static Stretches & Foam Rolling:',
              description:
                  '• Perform static stretches and foam rolling for muscle relaxation',
            ),
            const SizedBox(height: 10),

            // Modify Player Plan Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // هنا تقدر تحط حفظ/إرسال الخطة أو أي أكشن
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(186, 244, 67, 54),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 90,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Modify Player Plan',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildTrainingSection({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      color: Colors.grey[850],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Color.fromARGB(255, 244, 67, 54), size: 40),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
