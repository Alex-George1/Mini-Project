import 'package:flutter/material.dart';
import 'editprofile.dart';
import '../styles/styles.dart'; // Import mixin

class ProfilePage extends StatelessWidget with Styles {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.darkPurple, // Set background color
      body: SingleChildScrollView( // Allows scrolling if content overflows
        child: Column(
          children: [
            // Title Section
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Stack(
                children: [
                  // Title (Centered)
                  Align(
                    alignment: Alignment.center,
                    child: Text("Profile", style: Styles.titleStyle),
                  ),
                ],
              ),
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  // Profile Section Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: Styles.boxDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Profile Picture
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Styles.white,
                              ),
                              child: Icon(Icons.person, size: 40, color: Colors.grey),
                            ),
                            const SizedBox(width: 16),

                            // Name
                            const Text("Test User", style: Styles.nameStyle),
                          ],
                        ),

                        // Edit Button
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EditProfilePage()),
                            );
                          },
                          child: Row(
                            children: const [
                              Text("Edit", style: Styles.buttonTextStyle),
                              Icon(Icons.arrow_forward_ios, size: 16, color: Styles.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20), // Space between boxes

                  // Settings Section Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: Styles.boxDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Section Title
                        const Text("Settings", style: Styles.settingsTitleStyle),
                        const SizedBox(height: 10),

                        // Buttons List
                        Column(
                          children: [
                            settingsButton("Notification Preferences"),
                            const SizedBox(height: 10),
                            settingsButton("Privacy & Security"),
                            const SizedBox(height: 10),
                            settingsButton("Account Settings"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to Create Buttons
Widget settingsButton(String text) {
  return TextButton(
    onPressed: () {},
    style: Styles.settingsButtonStyle,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Styles.buttonTextStyle),
        const Icon(Icons.arrow_forward_ios, size: 16, color: Styles.white),
      ],
    ),
  );
}
