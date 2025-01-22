import 'package:flutter/material.dart';
import 'package:flutter_fitness_app/screens/profile_setting.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Image with Profile Section
              Stack(
                children: [
                  // Background Image
                  Container(
                    height: 207,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/hwb_cover.jpeg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.purple.withOpacity(0.3),
                          BlendMode.softLight,
                        ),
                      ),
                    ),
                  ),

                  // Settings Button
                  Positioned(
                    bottom: 30,
                    left: 20,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileSettings()),
                          );
                        },
                        child: Icon(Icons.settings, color: Colors.white)),
                  ),

                  // Added Container with Border Radius
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(55),
                          topRight: Radius.circular(55),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Profile Info Section (keeping all your existing content exactly as is)
              Transform.translate(
                offset: Offset(0, -48),
                child: Column(
                  children: [
                    // Profile Image
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/hussnain.jpg'),
                    ),

                    SizedBox(height: 10),

                    // Name
                    Text(
                      'Hussnain Waheed',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Software Engineer',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),

                    // Ratings
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                            (index) => Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: Colors.green[200],
                          size: 20,
                        ),
                      ),
                    ),

                    // Followers Info
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                '1862',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text('followers'),
                            ],
                          ),
                          SizedBox(width: 40),
                          Column(
                            children: [
                              Text(
                                '52',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text('following'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // About Section
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'About Me',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'I am a Flutter Developer with expertise in building cross-platform mobile apps for Android and iOS.'
                            'Proficient in Dart, UI design, state management, API integration, and app performance optimization.'
                            ' Focused on delivering scalable, user-friendly,'
                            ' and high quality solutions with clean, maintainable code.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),

                    // Stats Section
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStatItem('EXPERTISE', 'Mobile Devops.'),
                          _buildDivider(),
                          _buildStatItem('EXPERIENCE', '1 year'),
                          _buildDivider(),
                          _buildStatItem('PROJECTS', '10+'),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    // Portfolio Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Portfolio',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                size: 20,
                                color: Colors.grey[600],
                              ),
                            ],
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.only(top: 8),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              final List<String> imageNames = [
                                'activefitness.JPG',
                                'app2.jpg',
                                'app3.jpg',
                                'app4.jpg',
                                'app5.jpg',
                                'app6.jpg',
                              ];

                              final List<String> imageTexts = [
                                'Port. 01',
                                'Port. 2',
                                'Port. 3',
                                'Port. 4',
                                'Port. 5',
                                'Port. 6',
                              ];

                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey[300]!),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/${imageNames[index]}',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: double.infinity,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Container(
                                            color: Colors.grey[200],
                                            child: Center(
                                              child: Icon(
                                                Icons.image_not_supported,
                                                color: Colors.grey[400],
                                                size: 40,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Container(
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                      Center(
                                        child: Text(
                                          imageTexts[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.green.shade600,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.grey[300],
    );
  }
}