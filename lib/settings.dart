import 'package:flutter/material.dart';
import 'package:flutter_application_5/sidemenu.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor:
            const Color.fromARGB(255, 170, 119, 218), // Matching theme
      ),
      drawer: const SideMenu(), // Add the SideMenu here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile section
            ListTile(
              leading: const Icon(Icons.person,
                  color: Color.fromARGB(255, 170, 119, 218)),
              title: const Text('Account Settings'),
              subtitle: const Text('Update your personal information'),
              onTap: () {
                // Navigate to account settings page
              },
            ),
            const Divider(),

            // Other settings option
            ListTile(
              leading: const Icon(Icons.lock,
                  color: Color.fromARGB(255, 170, 119, 218)),
              title: const Text('Privacy and Security'),
              subtitle: const Text('Manage your privacy settings'),
              onTap: () {
                // Navigate to privacy settings page
              },
            ),
            const Divider(),

            // Logout button
            ListTile(
              leading: const Icon(Icons.logout,
                  color: Color.fromARGB(255, 170, 119, 218)),
              title: const Text('Logout'),
              onTap: () {
                // Add logout functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}
