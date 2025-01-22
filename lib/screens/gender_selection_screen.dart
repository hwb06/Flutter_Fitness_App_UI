import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/screens/age_screen.dart';
import 'package:flutter_fitness_app/widgets/flow_nav_bar_widget.dart';
import 'package:flutter_fitness_app/widgets/text_widget.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({Key? key}) : super(key: key);

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  String? selectedGender;

  // Function to show a dialog when Next button is clicked without selecting gender
  void _showGenderAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('Please select your gender to proceed.'),
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Text Title & Detail Widget
              const SizedBox(height: 30),
              TextSection(
                titleText: 'TELL US ABOUT YOURSELF!',
                detailText1: 'To give you a better experience we need',
                detailText2: 'to know your gender',
              ),

              //Show Gender Texts
              SizedBox(height: 100),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildGenderCard(
                      gender: 'Male',
                      isSelected: selectedGender == 'Male',
                      iconColor: Colors.teal,
                    ),
                    const SizedBox(height: 20),
                    _buildGenderCard(
                      gender: 'Female',
                      isSelected: selectedGender == 'Female',
                      iconColor: Colors.purple,
                    ),
                  ],
                ),
              ),

              //Flow Navbar Widget
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: FlowNavBarWidget(
                  onBackPressed: () {
                    Navigator.pop(context);
                  },
                  onNextPressed: selectedGender != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AgeScreen(),
                            ),
                          );
                        }
                      : _showGenderAlert,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Genders Circles Containers
  Widget _buildGenderCard({
    required String gender,
    required bool isSelected,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF97FF82) : Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              gender == 'Male' ? Icons.male : Icons.female,
              size: 40,
              color: isSelected ? Colors.black : iconColor,
            ),
            const SizedBox(height: 8),
            Text(
              gender,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.black : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
