import 'package:flutter/material.dart';

class HeartRateScreen extends StatelessWidget {
  const HeartRateScreen({super.key});

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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== العنوان =====
              const Center(
                child: Text(
                  'HEART RATE',
                  style: TextStyle(
                    color: Color(0xFFEB2B23),
                    fontSize: 34,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // ===== القيمة =====
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '170',
                      style: TextStyle(
                        color: Color(0xFFEB2B23),
                        fontSize: 90,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.orangeAccent,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Center(
                child: Text(
                  'bpm',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),

              const SizedBox(height: 40),

              // ===== شريط الـ Zones =====
              _buildZonesBar(),
              const SizedBox(height: 40),

              // ===== معلومات Zones =====
              Row(
                children: [
                  Expanded(
                    child: _zoneInfo(title: 'Peak :', value: 'bpm +170'),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _zoneInfo(title: 'Cardio :', value: 'bpm 169 - 110'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _zoneInfo(
                      title: 'Fat Burning :',
                      value: 'bpm 139 - 110',
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _zoneInfo(title: 'Resting :', value: 'bpm 109 - 60'),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              const Divider(color: Colors.white24),

              const SizedBox(height: 24),

              // ===== Previous High / Low =====
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Previous High :',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '170',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(height: 6),
                        SizedBox(
                          height: 3,
                          width: 80,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Previous Low :',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '67',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ===== Bars فقط بدون المنحنى =====
              SizedBox(
                height: 170,
                width: double.infinity,
                child: CustomPaint(
                  painter: _BarsPainter(), // فقط رسم الأعمدة
                ),
              ),

              const SizedBox(height: 16),

              // ===== النص الأخير =====
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Last updated : ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Now',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'High heart rate indicates significant exertion. Rest and reduce physical activity.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // ===== شريط الـ Zones =====
  Widget _buildZonesBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Peak', style: TextStyle(color: Colors.white70, fontSize: 14)),
            Text(
              'Cardio',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            Text(
              'Fat Burning',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            Text(
              'Resting',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Stack(
          children: [
            Container(
              height: 22,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.8,
              child: Container(
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFEB2B23),
                      Color(0xFFD64A27),
                      Color(0xFFFF8A1E),
                      Color(0xFF4CAF50),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 8,
              top: 4,
              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.orangeAccent, width: 3),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ===== معلومات Zone =====
  Widget _zoneInfo({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 15)),
      ],
    );
  }
}

// =============================
// 🎨 رسم الأعمدة فقط بدون منحنى
// =============================
class _BarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final basePaint = Paint()
      ..color = Colors.white24
      ..strokeWidth = 1;

    // خط أفقي بسيط
    canvas.drawLine(
      Offset(0, size.height * 0.85),
      Offset(size.width, size.height * 0.85),
      basePaint,
    );

    // رسم الأعمدة
    final barPaint = Paint()
      ..color = Colors.orangeAccent
      ..style = PaintingStyle.fill;

    double barWidth = size.width / 40;

    for (int i = 0; i < 35; i++) {
      double x = i * (barWidth + 2);
      double barHeight = (size.height * 0.4) * (0.4 + (i % 5) / 10);

      canvas.drawRect(
        Rect.fromLTWH(x, size.height * 0.85 - barHeight, barWidth, barHeight),
        barPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_) => false;
}
