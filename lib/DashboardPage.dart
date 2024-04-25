// DashboardPage.dart
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ShopPage.dart'; // Placeholder for ShopPage
import 'ProfilePage.dart'; // Placeholder for ProfilePage
// import 'SettingsPage.dart'; // Placeholder for SettingsPage

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    ShopPage(), // Placeholder for ShopPage
    ProfilePage(), // Placeholder for ProfilePage
    // SettingsPage(), // Placeholder for SettingsPage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Handle sidebar navigation
              },
            ),
            SizedBox(width: 10),
            Image.asset('assets/images/Logo.png', height: 60),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money_rounded), label: 'Money'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          // BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
