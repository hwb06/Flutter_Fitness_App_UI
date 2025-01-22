import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/screens/height_screen.dart';
import 'package:flutter_fitness_app/widgets/flow_nav_bar_widget.dart';
import 'package:flutter_fitness_app/widgets/text_widget.dart';

class WeightScreen extends StatefulWidget {
  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double selectedWeight = 58.0;
  final FixedExtentScrollController _scrollController = FixedExtentScrollController(initialItem: 28);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpToItem(28);
    });
  }

  Widget _buildTriangleIndicator() {
    return ClipPath(
      clipper: TriangleClipper(),
      child: Container(
        width: 16,
        height: 8,
        color: Colors.blue[700],
      ),
    );
  }

  Widget _buildWeightSelector() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTriangleIndicator(),
        Container(
          height: 100,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(32),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: ListWheelScrollView.useDelegate(
              controller: _scrollController,
              itemExtent: 55,
              perspective: 0.005,
              diameterRatio: 2.5,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedWeight = (index + 30).toDouble();
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 121,
                builder: (context, index) {
                  final weight = index + 30;
                  return GestureDetector(
                    onTap: () {
                      _scrollController.animateToItem(
                        index,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Container(
                        width: 55,
                        alignment: Alignment.center,
                        child: Text(
                          weight.toString(),
                          style: TextStyle(
                            fontSize: selectedWeight == weight ? 25 : 18,
                            color: selectedWeight == weight
                                ? Colors.black
                                : Colors.grey[400],
                            fontWeight: selectedWeight == weight
                                ? FontWeight.bold
                                : FontWeight.normal,
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              TextSection(
                titleText: 'WHAT IS YOUR WEIGHT?',
                detailText1: 'You can always change this later.',
                detailText2: '',
              ),
              const Spacer(),
              Center(child: _buildWeightSelector()),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: FlowNavBarWidget(
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                  onNextPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HeightScreen(), // Change this to your next screen
                      ),
                    );
                  },
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

// Custom triangle clipper for the indicator
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}