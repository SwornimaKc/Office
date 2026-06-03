import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 30),

            const CircleAvatar(
              radius: 60,
              child: Icon(
                Icons.person,
                size: 60,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Officer Name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "Section Officer",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            profileTile(
              Icons.badge,
              "Employee ID",
              "EMP001",
            ),

            profileTile(
              Icons.email,
              "Email",
              "officer@gov.in",
            ),

            profileTile(
              Icons.phone,
              "Phone",
              "+91 9876543210",
            ),

            profileTile(
              Icons.location_on,
              "Office Room",
              "Room 102",
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                // logout logic
              },
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }

  static Widget profileTile(
    IconData icon,
    String title,
    String value,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),

      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}