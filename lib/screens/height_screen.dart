import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/screens/goal_screen.dart';
import 'package:flutter_fitness_app/widgets/flow_nav_bar_widget.dart';
import 'package:flutter_fitness_app/widgets/text_widget.dart';

class HeightScreen extends StatefulWidget {
  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  int selectedHeight = 167;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: TextSection(
                titleText: 'WHAT IS YOUR HEIGHT?',
                detailText1: 'This help us create your personalized plan.',
                detailText2: '',
              ),
            ),
            SizedBox(height: 110),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 120, // Reduced width for the scroll area
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: 70,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    itemBuilder: (context, index) {
                      final height = 140 + index;
                      final isSelected = height == selectedHeight;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedHeight = height;
                          });
                        },
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.black : Colors.transparent,
                            borderRadius: BorderRadius.circular(4), // Reduced border radius
                          ),
                          child: Center(
                            child: Text(
                              isSelected ? '$height CM' : '$height',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                color: isSelected ? Color(0xFF7EFF73) : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            SizedBox(height: 110),
            Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 24, right: 24),
              child: FlowNavBarWidget(
                onBackPressed: () {
                  Navigator.pop(context);
                },
                onNextPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoalScreen(), // Change this to your next screen
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final initialScrollOffset = (selectedHeight - 140) * 48.0;
      _scrollController.jumpTo(initialScrollOffset);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}