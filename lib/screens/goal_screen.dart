import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/screens/activity_level.dart';
import 'package:flutter_fitness_app/screens/height_screen.dart';
import 'package:flutter_fitness_app/widgets/flow_nav_bar_widget.dart';
import 'package:flutter_fitness_app/widgets/text_widget.dart';

class GoalScreen extends StatefulWidget {
  @override
  State createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  final List<String> goals = [
    'Gain Weight',
    'Lose weight',
    'Get fitter',
    'Gain more flexible',
    'Learn the basic',
  ];

  int selectedGoal = 1; // Default to 'Get fitter'

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
                    titleText: 'WHAT IS YOUR GOAL?',
                    detailText1: 'This helps us create your personalized plan.',
                    detailText2: '',
                  ),
                ),

                SizedBox(height: 30,),
                Center(
                  child: Expanded(
                    child: Center(
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
                              selectedGoal = index;
                            });
                          },
                          children: List.generate(
                            goals.length,
                                (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedGoal = index;
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
                                      goals[index],
                                      style: TextStyle(
                                        fontSize: 23,
                                        color: selectedGoal == index
                                            ? Colors.black
                                            : Colors.grey[350],
                                        fontWeight: selectedGoal == index
                                            ? FontWeight.w500
                                            : FontWeight.normal,
                                      ),
                                    ),
                                    // Top green line
                                    if (selectedGoal == index)
                                      Positioned(
                                        top: 0,
                                        left: 20,
                                        right: 20,
                                        child: Container(
                                          height: 1,
                                          color: Color(0xFF4CD964), // iOS green color
                                        ),
                                      ),
                                    // Bottom green line
                                    if (selectedGoal == index)
                                      Positioned(
                                        bottom: 0,
                                        left: 20,
                                        right: 20,
                                        child: Container(
                                          height: 1,
                                          color: Color(0xFF4CD964), // iOS green color
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
                        builder: (context) => ActivityLevel(),
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