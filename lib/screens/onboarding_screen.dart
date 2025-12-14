import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AccountTypeScreen.dart'; // استيراد شاشة AccountTypeScreen

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _pageIndex = 0;

  final List<_OnboardData> _pages = const [
    _OnboardData(
      title: 'Daily Training\nPlans Designed\nfor You !',
      subtitle: 'Start improving your performance with personalized drills',
      titleFontSize: 40,
      subtitleFontSize: 20,
    ),
    _OnboardData(
      title: 'Real-Time Coach\nFeedback !',
      subtitle: 'Receive instant notes from your\ncoach after every workout',
      titleFontSize: 40,
      subtitleFontSize: 20,
    ),
    _OnboardData(
      title: 'Track Your Weekly\nProgress !',
      subtitle: 'Visualize your growth and stay\nmotivated throughout your journey',
      titleFontSize: 40,
      subtitleFontSize: 20,
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true); // حفظ القيمة في SharedPreferences
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const AccountTypeScreen()),
    );
  }

  void _onNext() {
    if (_pageIndex < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _onSkip() {
    _finishOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_elite.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final data = _pages[index];
                    return _OnboardCard(data: data);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: _onSkip,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        backgroundColor: Colors.transparent,
                      ),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF3B30),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        _pageIndex == _pages.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardData {
  final String title;
  final String subtitle;
  final double titleFontSize;
  final double subtitleFontSize;

  const _OnboardData({
    required this.title,
    required this.subtitle,
    this.titleFontSize = 22,
    this.subtitleFontSize = 14,
  });
}

class _OnboardCard extends StatelessWidget {
  final _OnboardData data;
  const _OnboardCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                data.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFFF3B30),
                  fontSize: data.titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                data.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: data.subtitleFontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
