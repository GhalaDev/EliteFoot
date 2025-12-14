import 'package:flutter/material.dart';

class FatigueScreen extends StatelessWidget {
  const FatigueScreen({super.key});

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
              // ===== العنوان الرئيسي =====
              const Center(
                child: Text(
                  "FATIGUE LEVEL",
                  style: TextStyle(
                    color: Color(0xFFEB2B23),
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // ===== أيقونة التحذير =====
              const Center(
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: Color(0xFFEB2B23),
                  size: 110,
                ),
              ),

              const SizedBox(height: 40),

              // ===== الرسم + النسبة 76% High =====
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // الرسم على اليسار
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 220,
                      child: CustomPaint(painter: _FatigueGraphPainter()),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // النسبة على اليمين
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "76%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "High",
                          style: TextStyle(
                            color: Color(0xFFEB2B23),
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // ===== نص الشرح =====
              const Text(
                "The player’s current stress level is 76%, which is considered high. "
                "This indicates that the player may be under significant physical "
                "or mental pressure. It is recommended to give the player time for "
                "rest and recovery to ensure optimal performance and avoid the "
                "negative effects of accumulated stress.",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

/// يرسم المحاور + الخط + النقاط مثل التصميم
class _FatigueGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // خلفية اختيارية (شفافة هنا)
    final axisPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final tickPaint = Paint()
      ..color = Colors.white70
      ..strokeWidth = 1.5;

    final linePaint = Paint()
      ..color = const Color(0xFFEB2B23)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = const Color(0xFFEB2B23)
      ..style = PaintingStyle.fill;

    // هوامش داخل الرسم
    final double left = size.width * 0.15;
    final double bottom = size.height * 0.85;
    final double top = size.height * 0.15;
    final double right = size.width * 0.95;

    // محور Y
    canvas.drawLine(Offset(left, top), Offset(left, bottom), axisPaint);

    // محور X
    canvas.drawLine(Offset(left, bottom), Offset(right, bottom), axisPaint);

    // علامات صغيرة على محور Y
    const int yTicks = 5;
    final double yStep = (bottom - top) / yTicks;
    for (int i = 1; i < yTicks; i++) {
      final dy = bottom - i * yStep;
      canvas.drawLine(Offset(left - 5, dy), Offset(left, dy), tickPaint);
    }

    // علامات صغيرة على محور X
    const int xTicks = 6;
    final double xStep = (right - left) / xTicks;
    for (int i = 1; i <= xTicks; i++) {
      final dx = left + i * xStep;
      canvas.drawLine(Offset(dx, bottom), Offset(dx, bottom + 5), tickPaint);
    }

    // نقاط الرسم (x, y) كنسب
    final points = <Offset>[
      Offset(left + xStep * 0.2, bottom - (bottom - top) * 0.15),
      Offset(left + xStep * 1.0, bottom - (bottom - top) * 0.35),
      Offset(left + xStep * 2.0, bottom - (bottom - top) * 0.25),
      Offset(left + xStep * 3.2, bottom - (bottom - top) * 0.50),
      Offset(left + xStep * 4.3, bottom - (bottom - top) * 0.30),
      Offset(left + xStep * 5.2, bottom - (bottom - top) * 0.65),
    ];

    // مسار الخط
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, linePaint);

    // رسم الدوائر على كل نقطة
    for (final p in points) {
      canvas.drawCircle(p, 5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
