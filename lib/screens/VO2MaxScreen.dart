import 'package:flutter/material.dart';

class VO2MaxScreen extends StatelessWidget {
  const VO2MaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // يرجع للشاشة اللي قبل (InjuryRiskScreen)
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // VO2 Max Title
            const Text(
              'VO2 MAX',
              style: TextStyle(
                fontSize: 48,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // VO2 Max Value and Subscripts
            Stack(
              alignment: Alignment.center,
              children: [
                // 64
                const Text(
                  '64',
                  style: TextStyle(
                    fontSize: 100,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // رقم صغير (لو تبي تشيلها احذف هذا البلوك)
                const Positioned(
                  right: 0,
                  bottom: -5,
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Unit
                const Positioned(
                  bottom: -30,
                  child: Text(
                    '64 ml/kg/min',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Progress Bar (image)
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Image.asset(
                'assets/progress_bar_image.png',
                height: 40,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            // Rating labels
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildRatingLabel('Excellent', 0.9, 22.0),
                _buildRatingLabel('Good', 0.5, 22.0),
                _buildRatingLabel('Poor', 0.2, 22.0),
              ],
            ),

            const SizedBox(height: 40),

            // Previous High, Group Average, Goal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatColumn(
                  'Previous High',
                  '64 mL/kg/min',
                  15,
                  15,
                  Colors.white,
                  Colors.grey,
                ),
                _buildStatColumn(
                  'Group Average',
                  '55 mL/kg/min',
                  15,
                  15,
                  Colors.white,
                  Colors.grey,
                ),
                _buildStatColumn(
                  'Goal',
                  '70 mL/kg/min',
                  15,
                  15,
                  Colors.white,
                  Colors.grey,
                ),
              ],
            ),

            const SizedBox(height: 40),

            const Text(
              'Last updated 5 minutes ago',
              style: TextStyle(
                color: Color.fromARGB(255, 249, 248, 248),
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 30),

            // صورة تحت "Last updated"
            Image.asset(
              'assets/image_17.png',
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 25),

            // Quick tip
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Quick Tip: Maintain regular cardio exercises to improve your aerobic capacity.',
                style: TextStyle(color: Colors.grey, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingLabel(String label, double position, double fontSize) {
    return Expanded(
      child: Align(
        alignment: Alignment(position, 0),
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }

  Widget _buildStatColumn(
    String label,
    String value,
    double labelFontSize,
    double valueFontSize,
    Color labelColor,
    Color valueColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(color: labelColor, fontSize: labelFontSize),
        ),
        Text(
          value,
          style: TextStyle(color: valueColor, fontSize: valueFontSize),
        ),
      ],
    );
  }
}
