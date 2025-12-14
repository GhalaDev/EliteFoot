import 'package:flutter/material.dart';

class InjuryReportAnkle extends StatelessWidget {
  const InjuryReportAnkle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // AppBar يحتوي فقط على السهم
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // ===== العنوان تحت السهم =====
            const Text(
              'Injury Report - Ankle Sprain',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 5),

            const SizedBox(height: 20),

            // ===== باقي محتوى التقرير =====
            const Text(
              'Player Name: Jude Bellingham',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 5),

            const Text(
              'Date: Jan 22, 2022',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 5),

            const Text(
              'Injury Type: Moderate sprain of the left ankle',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 5),

            const Text(
              'Incident: Misstep landing after a jump during training.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            const SizedBox(height: 5),
            const Divider(color: Colors.white),
            const SizedBox(height: 5),

            const Text(
              'Medical Diagnosis:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),

            const Text(
              'X-ray showed no fractures. Clinical assessment revealed partial ligament tear on the lateral side of the ankle.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            const SizedBox(height: 5),
            const Divider(color: Colors.white),
            const SizedBox(height: 5),

            const Text(
              'Treatment Plan:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),

            const Text(
              '• Ankle brace for 10 days\n'
              '• Gradual physical therapy including hydrotherapy\n'
              '• Functional assessment before return to full activity',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            const SizedBox(height: 5),
            const Divider(color: Colors.white),
            const SizedBox(height: 5),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                // Re-injury Risk
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Re-injury Risk:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Low to moderate',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),

                // Estimated Return Date
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Estimated Return:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '20/02/2022',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
