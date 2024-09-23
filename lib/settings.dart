import 'package:flutter/material.dart';
import 'package:flutter_application_5/sidemenu.dart';
import 'dart:math';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Function to create stars similar to the HomePage
  Widget _buildStar(Offset position, double size, Color color) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Transform.rotate(
        angle: pi / 5,
        child: ClipPath(
          clipper: StarClipper(),
          child: Container(
            width: size,
            height: size,
            color: color.withOpacity(0.4),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor:
            const Color.fromARGB(255, 170, 119, 218), // Matching theme
      ),
      drawer: const SideMenu(), // Add the SideMenu here
      body: Stack(
        children: [
          // Background stars
          _buildStar(const Offset(-50, 100), 150, Colors.pinkAccent),
          _buildStar(const Offset(250, 300), 100, Colors.blueAccent),
          _buildStar(const Offset(100, 600), 120, Colors.purpleAccent),
          _buildStar(const Offset(50, 200), 80, Colors.blue),
          _buildStar(const Offset(200, 0), 120,
              const Color.fromARGB(255, 153, 201, 240)),
          _buildStar(const Offset(450, 250), 120,
              const Color.fromARGB(255, 227, 172, 237)),
          _buildStar(const Offset(400, 500), 180,
              const Color.fromARGB(255, 247, 127, 167)),

          // Main content
          Padding(
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

                // Privacy settings option
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
        ],
      ),
    );
  }
}

// StarClipper to create star shapes
class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final numberOfPoints = 5;
    final radius = size.width / 2;

    final double angle = (2 * pi) / numberOfPoints;
    final double halfAngle = angle / 2;

    for (int i = 0; i < numberOfPoints; i++) {
      double x = radius + radius * cos(i * angle);
      double y = radius + radius * sin(i * angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      // Inner point
      double innerX = radius + (radius / 2.5) * cos(i * angle + halfAngle);
      double innerY = radius + (radius / 2.5) * sin(i * angle + halfAngle);
      path.lineTo(innerX, innerY);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
