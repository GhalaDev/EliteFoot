import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

class PerformanceImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              /// شريط علوي: زر رجوع + عنوان
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Performance Overview',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                          shadows: [
                            Shadow(
                              blurRadius: 6,
                              color: Colors.black,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),

              const SizedBox(height: 16),

              /// المحتوى الرئيسي
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// دائرة Overall Fitness + الشيبز
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 210,
                          height: 210,
                          child: CustomPaint(
                            painter: FitnessCirclePainter(0.85),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    'Overall Fitness',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '85%',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 42,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 24),

                        Column(
                          children: [
                            _buildRightChip('90%'),
                            const SizedBox(height: 14),
                            _buildRightChip('78%'),
                            const SizedBox(height: 14),
                            _buildRightChip('88%'),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    /// عناوين الشارت
                    const Text(
                      'Progress Charts',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Speed (km/h)',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 12),

                    /// الشارت
                    SizedBox(
                      height: 170,
                      child: CustomPaint(painter: SpeedLineChartPainter()),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              /// صندوق الإنجازات في الأسفل (نفس لون البوكسات)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0x6DC01A1A), // نفس لون البوكسات مع شفافية
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: const Color(0xFFC01A1A), // نفس اللون بدون شفافية
                    width: 1.4,
                  ),
                ),
                child: FutureBuilder<List<String>>(
                  future: loadAchievements(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          'Error loading data',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Latest Achievements',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          for (var achievement in snapshot.data!)
                            _buildAchievementItem(achievement),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'No achievements found',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // دالة تحميل الإنجازات
  Future<List<String>> loadAchievements() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      'New Personal Best – Sprint (10.5s)',
      'Completed 5 consecutive by 10kg',
    ];
  }

  // عنصر الإنجاز
  static Widget _buildAchievementItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  // التشيبز الحمراء بنفس اللون الجديد
  static Widget _buildRightChip(String text) {
    return Container(
      width: 78,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0x6DC01A1A), // #C01A1A مع شفافية 43%
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

/// دائرة الـ Fitness
class FitnessCirclePainter extends CustomPainter {
  final double progress;

  FitnessCirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = math.min(size.width, size.height) / 2 - 10;

    final bgPaint = Paint()
      ..color = Colors.red.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;

    final fgPaint = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, bgPaint);

    final startAngle = -math.pi / 2;
    final sweep = 2 * math.pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweep,
      false,
      fgPaint,
    );

    final dotX = center.dx + radius * math.cos(startAngle);
    final dotY = center.dy + radius * math.sin(startAngle);

    canvas.drawCircle(Offset(dotX, dotY), 5, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// رسم الشارت بعد التنسيق
class SpeedLineChartPainter extends CustomPainter {
  final List<double> speeds = [5, 9, 12, 16, 19];

  @override
  void paint(Canvas canvas, Size size) {
    final axis = Paint()
      ..color = Colors.white24
      ..strokeWidth = 1;

    final line = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // تعبئة أفتح عشان ما يطلع بلوك غامق
    final fill = Paint()
      ..color =
          const Color(0x33C01A1A) // نفس اللون لكن شفافية خفيفة (حوالي 20%)
      ..style = PaintingStyle.fill;

    const double left = 40.0;
    const double right = 10.0;
    const double top = 10.0;
    const double bottom = 26.0;

    final chartWidth = size.width - left - right;
    final chartHeight = size.height - top - bottom;

    final origin = Offset(left, size.height - bottom);

    // مستطيل منطقة الشارت عشان نعمل clip بزوايا ناعمة
    final chartRect = Rect.fromLTWH(left, top, chartWidth, chartHeight);
    final rrect = RRect.fromRectAndRadius(chartRect, const Radius.circular(8));

    // نقص الرسم داخل منطقة الشارت فقط
    canvas.save();
    canvas.clipRRect(rrect);

    // المحاور
    canvas.drawLine(origin, Offset(size.width - right, origin.dy), axis);
    canvas.drawLine(origin, Offset(left, top), axis);

    const maxY = 20.0;
    final stepX = chartWidth / (speeds.length - 1);

    final path = Path();
    final fillPath = Path();

    for (int i = 0; i < speeds.length; i++) {
      final x = left + stepX * i;
      final y = origin.dy - (chartHeight * (speeds[i] / maxY));
      final p = Offset(x, y);

      if (i == 0) {
        path.moveTo(p.dx, p.dy);
        fillPath.moveTo(p.dx, origin.dy);
        fillPath.lineTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
        fillPath.lineTo(p.dx, p.dy);
      }
    }

    fillPath.lineTo(left + chartWidth, origin.dy);
    fillPath.close();

    canvas.drawPath(fillPath, fill);
    canvas.drawPath(path, line);

    canvas.restore(); // إنهاء القص

    // نص أسفل الشارت
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: const TextSpan(
        text: 'Last 4 Weeks',
        style: TextStyle(color: Colors.white70, fontSize: 12),
      ),
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(left + (chartWidth - textPainter.width) / 2, origin.dy + 4),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
