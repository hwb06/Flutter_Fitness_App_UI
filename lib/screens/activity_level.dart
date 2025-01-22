import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/screens/fitness_dashboard.dart';
import 'package:flutter_fitness_app/widgets/flow_nav_bar_widget.dart';
import 'package:flutter_fitness_app/widgets/text_widget.dart';

class ActivityLevel extends StatefulWidget {
  @override
  State createState() => _ActivityLevelState();
}

class _ActivityLevelState extends State<ActivityLevel> {
  final List<String> activity = [
    'Rookie',
    'Beginner',
    'Intermediate',
    'Advance',
    'True Beast',
  ];

  int selectedActivity = 1; // Default to 'Intermediate'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextSection(
                    titleText: 'YOUR ACTIVITY LEVEL?',
                    detailText1: 'This helps us create your personalized plan.',
                    detailText2: '',
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.4,
                    ),
                    child: ListWheelScrollView(
                      itemExtent: 60, // Increased for border lines
                      diameterRatio: 4.0,
                      physics: const FixedExtentScrollPhysics(),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          selectedActivity = index;
                        });
                      },
                      children: List.generate(
                        activity.length,
                            (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedActivity = index;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Text
                                Text(
                                  activity[index], // Use activity instead of goals
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: selectedActivity == index
                                        ? Colors.black
                                        : Colors.grey[350],
                                    fontWeight: selectedActivity == index
                                        ? FontWeight.w500
                                        : FontWeight.normal,
                                  ),
                                ),
                                // Top green line
                                if (selectedActivity == index)
                                  Positioned(
                                    top: 0,
                                    left: 20,
                                    right: 20,
                                    child: Container(
                                      height: 1,
                                      color: const Color(0xFF4CD964), // iOS green color
                                    ),
                                  ),
                                // Bottom green line
                                if (selectedActivity == index)
                                  Positioned(
                                    bottom: 0,
                                    left: 20,
                                    right: 20,
                                    child: Container(
                                      height: 1,
                                      color: const Color(0xFF4CD964), // iOS green color
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40, left: 24, right: 24),
                child: FlowNavBarWidget(
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                  onNextPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FitnessDashboard(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
