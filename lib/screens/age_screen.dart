import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/screens/weight_screen.dart';
import 'package:flutter_fitness_app/widgets/flow_nav_bar_widget.dart';
import 'package:flutter_fitness_app/widgets/text_widget.dart';

class AgeScreen extends StatefulWidget {
  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int? selectedAge;
  final FixedExtentScrollController _scrollController = FixedExtentScrollController();

  @override
  void initState() {
    super.initState();
    // Set default age to 20
    selectedAge = 20;
    // Calculate the initial item index (20 - 18 = 2 since our list starts from 18)
    final initialIndex = 2;
    // Set the scroll controller's initial position
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpToItem(initialIndex);
    });
  }

  void _showAgeAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('Please select your age to proceed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              TextSection(
                titleText: 'HOW OLD ARE YOU?',
                detailText1: 'This helps create your personalized plan.',
                detailText2: '',
              ),

              const SizedBox(height: 40),

              // Age Selector
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListWheelScrollView.useDelegate(
                  controller: _scrollController,
                  itemExtent: 50,
                  physics: FixedExtentScrollPhysics(),
                  diameterRatio: 4,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedAge = index + 18;
                    });
                  },
                  childDelegate: ListWheelChildBuilderDelegate(
                    childCount: 23,
                    builder: (context, index) {
                      final age = index + 18;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAge = age;
                            _scrollController.animateToItem(
                              index,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                        child: Container(
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: selectedAge == age ? Colors.black : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            age.toString(),
                            style: TextStyle(
                              fontSize: 20,
                              color: selectedAge == age
                                  ? Color(0xFF8FFF00)
                                  : Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: FlowNavBarWidget(
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                  onNextPressed: selectedAge != null
                      ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WeightScreen(),
                      ),
                    );
                  }
                      : _showAgeAlert,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}