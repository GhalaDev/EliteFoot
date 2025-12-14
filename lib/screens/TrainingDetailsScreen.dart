import 'package:flutter/material.dart';

class TrainingDetailsScreen extends StatelessWidget {
  const TrainingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ============================
            //   Progress Circle
            // ============================
            Center(
              child: Transform.scale(
                scale: 1.9, // 👈 غيّر الرقم إلى 2 أو 2.5 لو تبغاها أكبر
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    CircularProgressIndicator(
                      value: 0.40,
                      strokeWidth: 6,
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

            // ============================
            //   Speed Drills
            // ============================
            _buildTrainingSection(
              icon: Icons.directions_run,
              title: "Speed Drills:",
              description:
                  "• 6 sets x 30 meters (90% max speed)\n• 6 sets x 30 meters (60 sec rest between sets)",
            ),

            const SizedBox(height: 20),

            // ============================
            //   Squat Jumps #1
            // ============================
            _buildTrainingSection(
              icon: Icons.fitness_center,
              title: "Squat Jumps:",
              description: "• 4 sets x 8 Single-Leg RDL (3 sets per leg)",
            ),

            const SizedBox(height: 20),

            // ============================
            //   Squat Jumps #2
            // ============================
            _buildTrainingSection(
              icon: Icons.fitness_center,
              title: "Squat Jumps:",
              description: "• 4 sets x 8 reps",
            ),

            const SizedBox(height: 20),

            // ============================
            //   Static Stretches
            // ============================
            _buildTrainingSection(
              icon: Icons.accessibility_new,
              title: "Static Stretches & Foam Rolling:",
              description:
                  "• Perform static stretches and foam rolling for muscle relaxation",
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ======================================================
  //     Training Section Widget (مطابق للتصميم الثاني)
  // ======================================================
  Widget _buildTrainingSection({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      color: Colors.grey[900],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Color(0xFFD14232), size: 40),
            const SizedBox(width: 15),

            // النصوص
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
                    style: const TextStyle(fontSize: 16, color: Colors.white70),
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
