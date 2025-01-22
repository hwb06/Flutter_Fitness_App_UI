import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/screens/switchtab_navbar_screens/home_screen.dart';
import 'package:flutter_fitness_app/screens/switchtab_navbar_screens/profile_screen.dart';
import 'package:flutter_fitness_app/screens/switchtab_navbar_screens/progress_screen.dart';
import 'package:flutter_fitness_app/screens/switchtab_navbar_screens/stats_screen.dart';

class FitnessDashboard extends StatefulWidget {
  @override
  State<FitnessDashboard> createState() => _FitnessDashboardState();
}

class _FitnessDashboardState extends State<FitnessDashboard> {
  int _selectedIndex = 0;

  // Add screens for each tab
  final List<Widget> _screens = [
    HomeScreen(),
    StatsScreen(),
    ProgressScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItemWithLabel(Icons.home, 'Home', 0),
            _buildNavItemWithLabel(Icons.rocket_launch, 'Stats', 1),
            _buildNavItemWithLabel(Icons.bar_chart, 'Progress', 2),
            _buildNavItemWithLabel(Icons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItemWithLabel(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: Color(0xFF9FE870),
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.white,
              size: 20,
            ),
            if (isSelected) ...[
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
