import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Welcome, User Name!', // Replace "User Name" with actual user name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Edit Profile Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to Open Profile Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OpenProfilePage()),
                );
              },
              child: Text('Open Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Basic Info:', // Display basic info here
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Account Details:', // Display account details here
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class OpenProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Basic Info:', // Display basic info here
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Account Details:', // Display account details here
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
