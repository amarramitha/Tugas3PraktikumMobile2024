import 'package:flutter/material.dart';
import 'package:flutter_application_5/sidemenu.dart';
import 'dart:math';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
        title: const Text('About Us'),
        backgroundColor:
            const Color.fromARGB(255, 170, 119, 218), // Matching theme
      ),
      drawer: const SideMenu(), // Adding the sidebar here
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'About Our Application',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 110, 59, 147),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Our application is designed to enhance productivity and streamline processes. '
                  'Built with a user-friendly interface and modern design, we aim to deliver the best experience for our users.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 110, 59, 147),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Features:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 170, 119, 218),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '- Easy navigation with a sleek user interface\n'
                  '- Dark mode for comfortable viewing\n'
                  '- Personalization options for a custom experience\n'
                  '- Reliable performance and fast loading',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 110, 59, 147),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Our Mission:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 170, 119, 218),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'We strive to create tools that empower users, offering high-quality applications that solve real-world problems efficiently and effectively.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 110, 59, 147),
                  ),
                ),
                const Spacer(),
                const Center(
                  child: Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 110, 59, 147),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
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
