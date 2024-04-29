import 'package:flutter/material.dart';
import 'package:project/AboutUsScreen.dart';
import 'package:project/ContactUsPage.dart';
import 'package:project/UserProfile.dart'; // Ensure correct import statement
import 'HomePage.dart';
import 'MyEarningsPage.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _bottomNavIndex = 0;
  int _sideDrawerIndex = 0;

  final List<Widget> _bottomNavPages = [
    HomePage(),
    MyEarningsPage(),
    UserProfile(), // Corrected usage
  ];

  final List<Widget> _sideDrawerPages = [
    HomePage(),
    MyEarningsPage(),
    UserProfile(), // Corrected usage
    AboutUsScreen(),
    ContactUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                _navigateToSideDrawerPage(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money_rounded),
              title: Text('Money'),
              onTap: () {
                _navigateToSideDrawerPage(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                _navigateToSideDrawerPage(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_page_outlined),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUsPage()),
                );
              },
            ),

          ],
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Earnings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white),
        currentIndex: _bottomNavIndex,
        onTap: (index) {
          _navigateToBottomNavBarPage(index);
        },
      ),
    );
  }

  Widget _buildBody() {
    if (_bottomNavIndex >= 0 && _bottomNavIndex < _bottomNavPages.length) {
      return _bottomNavPages[_bottomNavIndex];
    } else {
      return Center(
        child: Text('Invalid Page Index $_bottomNavIndex'),
      );
    }
  }

  void _navigateToBottomNavBarPage(int index) {
    setState(() {
      if (index >= 0 && index < _bottomNavPages.length) {
        _bottomNavIndex = index;
      }
    });
  }

  void _navigateToSideDrawerPage(int index) {
    setState(() {
      if (index >= 0 && index < _sideDrawerPages.length) {
        _sideDrawerIndex = index;
      }
    });
    Navigator.of(context).pop(); // Close the drawer
  }
}
