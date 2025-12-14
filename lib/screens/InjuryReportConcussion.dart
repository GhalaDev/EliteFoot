import 'package:flutter/material.dart';

class InjuryReportConcussion extends StatelessWidget {
  const InjuryReportConcussion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // === APPBAR بدون عنوان ===
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // === BODY ===
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // ===== العنوان تحت السهم =====
            const Text(
              'Injury Report Concussion',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Player Name: Jude Bellingham',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Date: Sep 14, 2021',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Injury Type: Mild concussion',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              'Incident: Direct head collision during defensive play.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            SizedBox(height: 16),
            Divider(color: Colors.grey),
            SizedBox(height: 16),

            Text(
              'Medical Diagnosis:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Neurological exam and head CT were performed. '
              'No hemorrhage or fractures. Diagnosed as Grade I concussion.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            SizedBox(height: 16),
            Divider(color: Colors.grey),
            SizedBox(height: 16),

            Text(
              'Treatment Plan:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• Full cognitive and physical rest for 7 days\n'
              '• Daily monitoring by team physician\n'
              '• Cognitive testing required before resuming training',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            SizedBox(height: 16),
            Divider(color: Colors.grey),
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Re-injury risk
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Column(
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
                        SizedBox(height: 8),
                        Text(
                          'Depends on future impact severity',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),

                // Estimated Return Date
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Estimated Return Date:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '01/01/2022',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
