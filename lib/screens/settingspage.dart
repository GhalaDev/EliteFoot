import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingsScreen(),
    );
  }
}

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

  // Mock function for dropdown menu actions
  void _onDropdownChanged(String? newValue) {
    setState(() {
      language = newValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // General Section
            Text(
              'General',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Divider(color: Colors.grey),
            SwitchListTile(
              title: Text('Dark Mode', style: TextStyle(color: Colors.white)),
              value: isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  isDarkMode = value;
                });
              },
              activeThumbColor: Colors.green,
              inactiveThumbColor: Colors.grey,
            ),
            DropdownButtonFormField<String>(
              initialValue: language,
              items: ['English (US)', 'Arabic', 'Spanish']
                  .map(
                    (lang) => DropdownMenuItem(
                      value: lang,
                      child: Text(lang, style: TextStyle(color: Colors.black)),
                    ),
                  )
                  .toList(),
              onChanged: _onDropdownChanged,
              decoration: InputDecoration(
                labelText: 'Language',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SwitchListTile(
              title: Text(
                'Notifications',
                style: TextStyle(color: Colors.white),
              ),
              value: isNotificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  isNotificationsEnabled = value;
                });
              },
              activeThumbColor: Colors.green,
              inactiveThumbColor: Colors.grey,
            ),
            ListTile(
              title: Text(
                'Subscription Details',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                // Navigate to Subscription Details screen
              },
            ),
            SizedBox(height: 20),
            // Account Section
            Text(
              'Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Divider(color: Colors.grey),
            ListTile(
              title: Text(
                'Change Password',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                // Navigate to Change Password screen
              },
            ),
            ListTile(
              title: Text(
                'Privacy Policy Terms of Service',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                // Navigate to Privacy Policy screen
              },
            ),
            SizedBox(height: 40),
            // Log Out Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Log Out logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 10),
            // App Version Text
            Center(
              child: Text(
                'APP Version: 2.3.0',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
