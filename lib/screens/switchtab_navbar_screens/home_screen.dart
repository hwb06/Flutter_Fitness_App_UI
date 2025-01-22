import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/screens/hand_workout_details.dart';
import 'package:flutter_fitness_app/screens/profile_setting.dart';
import 'package:flutter_fitness_app/screens/workout_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildWorkoutCard(
      String title, String duration, String calories, String imageUrl) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [ Colors.transparent, Colors.black54],
              ),
            ),
          ),

          // Center Play Button
          Stack(
            children: [
              // Your main content here
              Positioned(
                bottom: 15, // Distance from the bottom
                right: 15,  // Distance from the right
                child: GestureDetector(
                  onTap: () {
                    // Modified navigation logic
                    if (title == 'Lower Body Training') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutDetailScreen(
                            workoutType: 'lower_body',
                            title: title,
                            duration: duration,
                            calories: calories,
                            imageUrl: imageUrl,
                          ),
                        ),
                      );
                    } else if (title == 'Hand Training') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HandWorkoutDetails(
                            workoutType: 'hand',
                            title: title,
                            duration: duration,
                            calories: calories,
                            imageUrl: imageUrl,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white, // White color for the circle
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ),
              ),

            ],
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.timer, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      duration,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.local_fire_department,
                        color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      calories,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildExerciseItem(String title, String subtitle, double progress,
      String level, String imageUrl) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.asset(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        level,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF00E676),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hello, Hussnain',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.notifications_outlined, size: 35,),
              ],
            ),

            SizedBox(height: 20),

            // Popular Workouts Text
            Text(
              'Popular Workouts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 16),

            // Workout Cards Horizontal List
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildWorkoutCard(
                    'Lower Body Training',
                    '30 Min',
                    '300 Kcal',
                    'assets/images/lower_body.jpg',
                  ),
                  SizedBox(width: 16),
                  _buildWorkoutCard(
                    'Hand Training',
                    '45 Min',
                    '400 Kcal',
                    'assets/images/hand.jpg',
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Today's Plan Text
            Text(
              'Today Plan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 16),

            // Exercise List
            Expanded(
              child: ListView(
                children: [
                  _buildExerciseItem(
                    'Knee Push Up',
                    '20 Sit up a day',
                    0.45,
                    'beginner',
                    'assets/images/knee_pushup.jpg',
                  ),
                  SizedBox(height: 12),
                  _buildExerciseItem(
                    'Push Up',
                    '100 Push up a day',
                    0.25,
                    'intermediate',
                    'assets/images/pushups.jpeg',
                  ),
                  SizedBox(height: 12),
                  _buildExerciseItem(
                    'Sit Up',
                    '20 Sit up a day',
                    0.20,
                    'beginner',
                    'assets/images/situp.jpg',
                  ),
                  SizedBox(height: 12),
                  _buildExerciseItem(
                    'Man Plank',
                    "Strength starts here.",
                    0.75,
                    'expert',
                    'assets/images/plank.jpeg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
