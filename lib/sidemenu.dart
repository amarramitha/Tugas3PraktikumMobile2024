import 'package:flutter/material.dart';
import 'package:flutter_application_5/about.dart';
import 'package:flutter_application_5/home_page.dart';
import 'package:flutter_application_5/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String? _username;

  @override
  void initState() {
    super.initState();
    _retrieveUsername();
  }

  void _retrieveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ??
          'Guest'; // Default to Guest if not found
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 170, 119, 218), // Matching purple tone
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white70, // Icon color
                ),
                const SizedBox(width: 16),
                Text(
                  _username ?? 'Guest',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.dashboard,
            text: 'Dashboard',
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.settings,
            text: 'Settings',
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
              // Add navigation to settings page here
            },
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.info,
            text: 'About',
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
              // Add navigation to about page here
            },
          ),
        ],
      ),
    );
  }

  // Helper method to build drawer items with consistent styling
  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        color: const Color.fromARGB(
            255, 243, 243, 243), // Light background for items
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: const Color.fromARGB(255, 170, 119, 218), // Icon color
          ),
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 110, 59, 147), // Matching text color
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
