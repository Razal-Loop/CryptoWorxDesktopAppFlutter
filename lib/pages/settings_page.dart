import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  bool _twoFactorAuth = false;
  bool _emailNotifications = false;
  bool _pushNotifications = false;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KryptoworX Settings'),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: Implement save changes functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Changes saved')),
              );
            },
            child: const Text('Save Changes', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('App Preferences',
                          style: Theme.of(context).textTheme.titleLarge),
                      SwitchListTile(
                        title: const Text('Dark Mode'),
                        value: _isDarkMode,
                        onChanged: (value) {
                          setState(() {
                            _isDarkMode = value;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      Text('Security Settings',
                          style: Theme.of(context).textTheme.titleLarge),
                      SwitchListTile(
                        title: const Text('Two-Factor Authentication'),
                        value: _twoFactorAuth,
                        onChanged: (value) {
                          setState(() {
                            _twoFactorAuth = value;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      Text('Notifications',
                          style: Theme.of(context).textTheme.titleLarge),
                      SwitchListTile(
                        title: const Text('Email Notifications'),
                        value: _emailNotifications,
                        onChanged: (value) {
                          setState(() {
                            _emailNotifications = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: const Text('Push Notifications'),
                        value: _pushNotifications,
                        onChanged: (value) {
                          setState(() {
                            _pushNotifications = value;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      Text('Personal Information',
                          style: Theme.of(context).textTheme.titleLarge),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(labelText: 'Username'),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                      ),
                      const Spacer(),
                      Center(
                        child: Text(
                          '© 2024 CryptoworX, All Rights Reserved.',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
