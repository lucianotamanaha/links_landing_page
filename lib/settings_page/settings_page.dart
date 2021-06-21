import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:links_landing_page/settings_page/button_settings_section.dart';
import 'package:links_landing_page/settings_page/preview_section.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: TextButton.icon(
              icon: Icon(Icons.logout),
              label: Text('Sign out'),
              onPressed: () => FirebaseAuth.instance.signOut(),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          ButtonSettingsSection(),
          PreviewSection(),
        ],
      ),
    );
  }
}
