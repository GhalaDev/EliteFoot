import 'package:flutter/material.dart';
import 'CoachWelcomeScreen.dart';
import 'InjuryRiskScreen.dart';
import 'TrainingPlanScreen.dart'; // 👈 جديد

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // زر الرجوع
          Positioned(
            top: 40,
            left: 15,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const CoachWelcomeScreen()),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // أزرار Total Plan و Archived
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFFD04130),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 65,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Total Plan',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        '         Archived',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
                const Divider(color: Colors.red, thickness: 1),
                const SizedBox(height: 10),

                // الإحصائيات
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    StatCard(
                      label: "Total Players",
                      value: "30",
                      width: 120,
                      height: 170,
                    ),
                    SizedBox(width: 10),
                    StatCard(
                      label: "Active Plans",
                      value: "23",
                      width: 120,
                      height: 170,
                    ),
                    SizedBox(width: 10),
                    StatCard(
                      label: "Players Review\nToday",
                      value: "4",
                      width: 120,
                      height: 170,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Quick Actions",
                    style: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // زر Create New Training Plan يفتح واجهة TrainingPlanScreen
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TrainingPlanScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD04130),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(350, 60),
                    ),
                    child: const Text(
                      "Create New Training Plan",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Players Needing Review Today",
                    style: TextStyle(
                      color: Color(0xFF808080),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // قائمة اللاعبين
                Expanded(
                  child: Center(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        PlayerCard(
                          playerName: "Jude Bellingham",
                          color: const Color(0xFFC01A1A),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const InjuryRiskScreen(),
                              ),
                            );
                          },
                        ),
                        const PlayerCard(
                          playerName: "Nacho Fernández",
                          color: Color.fromARGB(221, 54, 54, 54),
                          onTap: null,
                        ),
                        const PlayerCard(
                          playerName: "Federico Valverde",
                          color: Color.fromARGB(221, 54, 54, 54),
                          onTap: null,
                        ),
                        const PlayerCard(
                          playerName: "Vinícius Júnior",
                          color: Color.fromARGB(221, 54, 54, 54),
                          onTap: null,
                        ),
                      ],
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

// ===== StatCard =====
class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final double width;
  final double height;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: const Color(0xFF1E1E1E),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFFD14232), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== PlayerCard =====
class PlayerCard extends StatelessWidget {
  final String playerName;
  final Color color;
  final VoidCallback? onTap;

  const PlayerCard({
    super.key,
    required this.playerName,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: color.withOpacity(0.43),
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: color, width: 2),
        ),
        child: SizedBox(
          width: 350,
          child: ListTile(
            onTap: onTap,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 16,
            ),
            leading: const Icon(Icons.person, color: Colors.white),
            title: Text(
              playerName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
