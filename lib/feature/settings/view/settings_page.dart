import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header Section
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_pic.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Siffat',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '+92 3470967396',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Edit personal details >',
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            // Options Section
            buildListTile(title: 'Change Number', onTap: () {}),
            buildListTile(title: 'Change Email', onTap: () {}),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Text(
            //     'VERIFICATION',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold, color: Colors.black),
            //   ),
            // ),
            // buildVerificationTile(title: 'Verify ID', status: false, onTap: () {}),
            // buildVerificationTile(
            //     title: 'License Confirmation', status: false, onTap: () {}),
            const Divider(),
            // buildListTile(title: 'Payments', onTap: () {}),
            // buildListTile(title: 'Vehicle Information', onTap: () {}),
            buildListTile(title: 'Help', onTap: () {}),
            buildListTile(title: 'Terms and condition', onTap: () {}),
            buildListTile(title: 'Logout', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget buildListTile({required String title, required VoidCallback onTap}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget buildVerificationTile({
    required String title,
    required bool status,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        status ? Icons.check : Icons.close,
        color: status ? Colors.green : Colors.red,
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
