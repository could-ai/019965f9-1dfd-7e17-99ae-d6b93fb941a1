import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/dashboard_screen.dart';
import 'package:couldai_user_app/screens/factories_screen.dart';
import 'package:couldai_user_app/screens/visits_screen.dart';
import 'package:couldai_user_app/screens/issues_screen.dart';
import 'package:couldai_user_app/screens/settings_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const FactoriesScreen(),
    const VisitsScreen(),
    const IssuesScreen(),
    const SettingsScreen(),
  ];

  final List<String> _screenTitles = [
    'Dashboard',
    'Factories',
    'Visits',
    'Issues',
    'Settings',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Close the drawer if it's open on a mobile device
    if (MediaQuery.of(context).size.width < 600) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 600;

    final navigationDrawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red[800],
            ),
            child: const Text(
              'End Fire',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildDrawerItem(Icons.dashboard, 'Dashboard', 0),
          _buildDrawerItem(Icons.business, 'Factories', 1),
          _buildDrawerItem(Icons.calendar_today, 'Visits', 2),
          _buildDrawerItem(Icons.warning, 'Issues', 3),
          const Divider(),
          _buildDrawerItem(Icons.settings, 'Settings', 4),
          _buildDrawerItem(Icons.logout, 'Logout', 5), // Placeholder
        ],
      ),
    );

    if (isDesktop) {
      // For desktop, show a permanent side navigation rail
      return Scaffold(
        body: Row(
          children: [
            SizedBox(
              width: 250,
              child: navigationDrawer,
            ),
            Expanded(
              child: Scaffold(
                appBar: AppBar(
                  title: Text(_screenTitles[_selectedIndex]),
                ),
                body: _screens[_selectedIndex],
              ),
            ),
          ],
        ),
      );
    } else {
      // For mobile, show a hamburger menu with a drawer
      return Scaffold(
        appBar: AppBar(
          title: Text(_screenTitles[_selectedIndex]),
        ),
        drawer: navigationDrawer,
        body: _screens[_selectedIndex],
      );
    }
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    // Special case for logout
    if (title == 'Logout') {
      return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: () {
          // Placeholder for logout functionality
          // You would typically call an auth service here
          print("Logout tapped");
        },
      );
    }
    
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: _selectedIndex == index,
      selectedTileColor: Colors.red.withOpacity(0.1),
      onTap: () => _onItemTapped(index),
    );
  }
}
