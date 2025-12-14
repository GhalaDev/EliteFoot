import 'package:flutter/material.dart';

class InjuryReportHamstring extends StatelessWidget {
  const InjuryReportHamstring({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // ===== APPBAR فقط للسهم =====
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      // ===== BODY =====
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // ===============================
            //     العنوان بعد السهم ↓↓
            // ===============================
            const Text(
              'Injury Report',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Hamstring Muscle Strain ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 25), // مسافة إضافية قبل المحتوى
            // ============================
            //        باقي المحتوى
            // ============================
            const Text(
              'Player Name: Jude Bellingham',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10),

            Text(
              'Date: Jul 6, 2023',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10),

            Text(
              'Injury Type: Grade II right hamstring strain',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 10),

            Text(
              'Incident: Sprinting during a friendly match.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            SizedBox(height: 20),
            Divider(color: Colors.white),
            SizedBox(height: 20),

            Text(
              'Medical Diagnosis:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 10),
            Text(
              'MRI confirmed a partial tear of the hamstring muscle fibers without full rupture.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            SizedBox(height: 20),
            Divider(color: Colors.white),
            SizedBox(height: 20),

            Text(
              'Treatment Plan:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),

            Text(
              '• Complete rest for 2 weeks\n'
              '• 4-week physiotherapy program\n'
              '• Weekly progress evaluation',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

            SizedBox(height: 20),
            Divider(color: Colors.white),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Re-injury risk
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
                    SizedBox(height: 10),
                    Text(
                      'Moderate',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),

                // Estimated return
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
                    SizedBox(height: 10),
                    Text(
                      '15/09/2023',
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
