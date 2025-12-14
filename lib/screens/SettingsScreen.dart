import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AccountTypeScreen.dart';
import 'PlayerDashboardScreen.dart';
import 'CoachWelcomeScreen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  bool isNotificationsEnabled = true;
  String language = 'English (US)';
  bool isSubscribed = false;

  // الرجوع حسب نوع الحساب
  Future<void> _goBack(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final type = prefs.getString('accountType');

    if (type == 'coach') {
      // يرجع لواجهة الكوتش
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const CoachWelcomeScreen()),
      );
    } else {
      // يرجع لواجهة اللاعب
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const PlayerDashboardScreen()),
      );
    }
  }

  // تسجيل خروج
  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('accountType');
    await prefs.remove('chosenAccountType');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const AccountTypeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => _goBack(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // General Section
            const Text(
              'General',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Divider(color: Colors.grey),

            // Dark Mode
            _buildBox(
              child: SwitchListTile(
                title: const Text(
                  'Dark Mode',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                value: isDarkMode,
                onChanged: (bool value) {
                  setState(() => isDarkMode = value);
                },
                activeThumbColor: Colors.green,
                inactiveThumbColor: Colors.grey,
              ),
            ),

            // Language
            _buildBox(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Language',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Text(
                          language,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.black,
                    builder: (context) {
                      return ListView(
                        children: ['English (US)', 'Arabic', 'Spanish']
                            .map(
                              (lang) => ListTile(
                                title: Text(
                                  lang,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                onTap: () {
                                  setState(() => language = lang);
                                  Navigator.pop(context);
                                },
                              ),
                            )
                            .toList(),
                      );
                    },
                  );
                },
              ),
            ),

            // Notifications
            _buildBox(
              child: SwitchListTile(
                title: const Text(
                  'Notifications',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                value: isNotificationsEnabled,
                onChanged: (bool value) {
                  setState(() => isNotificationsEnabled = value);
                },
                activeThumbColor: Colors.green,
                inactiveThumbColor: Colors.grey,
              ),
            ),

            // Subscription Details
            _buildBox(
              child: ListTile(
                title: const Text(
                  'Subscription Details',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  // TODO: صفحة تفاصيل الاشتراك
                },
              ),
            ),

            const SizedBox(height: 20),

            // Account Section
            const Text(
              'Account',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Divider(color: Colors.grey),

            // Change Password
            _buildBox(
              child: ListTile(
                title: const Text(
                  'Change Password',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  // TODO: صفحة تغيير كلمة المرور
                },
              ),
            ),

            // Privacy Policy / Terms
            _buildBox(
              child: ListTile(
                title: const Text(
                  'Privacy Policy Terms of Service',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  // TODO: صفحة الشروط والسياسة
                },
              ),
            ),

            const SizedBox(height: 20),

            // Log Out Button
            Center(
              child: ElevatedButton(
                onPressed: () => _logout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 120,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // App Version Text
            const Center(
              child: Text(
                'APP Version: 2.3.0',
                style: TextStyle(
                  color: Color.fromARGB(255, 101, 100, 100),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox({required Widget child}) {
    return Container(
      width: 327,
      height: 55,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF212122),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
