import 'package:flutter/material.dart';
import 'package:flutter_application_5/sidemenu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor:
            const Color.fromARGB(255, 170, 119, 218), // Matching theme
      ),
      drawer: const SideMenu(), // Adding the sidebar here
      body: Padding(
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
    );
  }
}
