import 'package:flutter/material.dart';
import 'InjuryReportConcussion.dart';
import 'InjuryReportHamstring.dart';
import 'InjuryReportAnkle.dart'; // 👈 استيراد تقرير الكاحل

class InjuryHistoryScreen extends StatelessWidget {
  const InjuryHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Injury History",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "PROBABILITY OF KNEE INJURY:",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "73%",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.redAccent,
                    size: 40,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Injury History",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // ===== Hamstring Strain → تقرير العضلة الخلفية =====
            injuryItem(
              icon: Icons.fitness_center,
              title: "Hamstring Strain",
              date: "Jul 6, 2023",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const InjuryReportHamstring(),
                  ),
                );
              },
            ),

            // ===== Ankle Sprain → تقرير الكاحل =====
            injuryItem(
              icon: Icons.directions_run,
              title: "Ankle Sprain",
              date: "Jan 11, 2022",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const InjuryReportAnkle()),
                );
              },
            ),

            // ===== Concussion → تقرير الارتجاج =====
            injuryItem(
              icon: Icons.psychology,
              title: "Concussion",
              date: "Sep 24, 2021",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const InjuryReportConcussion(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ===== عنصر إصابة قابل للضغط =====
  Widget injuryItem({
    required IconData icon,
    required String title,
    required String date,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.redAccent, size: 35),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  date,
                  style: const TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
