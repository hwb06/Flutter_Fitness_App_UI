import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  final List<Map<String, dynamic>> daysInJanuary = [];

  @override
  void initState() {
    super.initState();
    // Initialize January 2025 dates
    final DateTime firstDay = DateTime(2025, 1, 1);
    for (int i = 1; i <= 31; i++) {
      final currentDate = DateTime(2025, 1, i);
      daysInJanuary.add({
        'day': _getDayName(currentDate.weekday),
        'date': i,
        'isSelected': i == 1, // First date is selected by default
      });
    }
  }

  String _getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'M';
      case 2:
        return 'T';
      case 3:
        return 'W';
      case 4:
        return 'T';
      case 5:
        return 'F';
      case 6:
        return 'S';
      case 7:
        return 'S';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final padding = screenSize.width * 0.05;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar Row
              Text('Jan 2025',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  )
              ),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    daysInJanuary.length,
                        (index) => Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            for (var day in daysInJanuary) {
                              day['isSelected'] = false;
                            }
                            daysInJanuary[index]['isSelected'] = true;
                          });
                        },
                        child: _buildDateButton(
                          '${daysInJanuary[index]['day']}\n${daysInJanuary[index]['date']}',
                          isSelected: daysInJanuary[index]['isSelected'],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenSize.height * 0.03),

              Text('Today Report',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  )
              ),

              SizedBox(height: screenSize.height * 0.02),

              // Grid layout for cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    _buildCaloriesCard(),
                    _buildCyclingCard(),
                    _buildHeartRateCard(),
                    Column(
                      children: [
                        Expanded(child: _buildStepsCard()),
                        SizedBox(height: 8),
                        _buildKeepItUpCard(),
                      ],
                    ),
                    _buildSleepCard(),
                    _buildWaterCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildDateButton(String text, {bool isSelected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Color(0xFF9CE37D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: text.split('\n').map((part) => Text(
          part,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontSize: 12,
            height: 1.2,
          ),
        )).toList(),
      ),
    );
  }

  // Rest of your existing widget methods remain exactly the same
  Widget _buildCaloriesCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Active calories',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              )
          ),
          SizedBox(height: 8),
          Text('655 Cal',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )
          ),
          Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 45,
                width: 45,
                child: CircularProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.purple.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                  strokeWidth: 5,
                ),
              ),
              Text('70%',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCyclingCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.directions_bike,
                  color: Colors.white,
                  size: 20
              ),
              SizedBox(width: 8),
              Text('Cycling',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  )
              ),
            ],
          ),
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: CyclingPathPainter(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeartRateCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFE4E1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.favorite,
                  color: Colors.red,
                  size: 20
              ),
              SizedBox(width: 8),
              Text('Heart Rate',
                  style: TextStyle(fontSize: 14)
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              15,
                  (index) => Container(
                width: 3,
                height: 20 * (0.5 + (index % 3) * 0.25),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text('82 Bpm',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
              )
          ),
        ],
      ),
    );
  }

  Widget _buildStepsCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.directions_walk, size: 20),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Steps',
                  style: TextStyle(fontSize: 14)
              ),
              Text('1199/2000',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKeepItUpCard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFFFE4E1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Keep it Up!',
              style: TextStyle(fontSize: 14)
          ),
          SizedBox(width: 4),
          Text('💪',
              style: TextStyle(fontSize: 14)
          ),
        ],
      ),
    );
  }

  Widget _buildSleepCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF3E5F5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.nightlight_round, size: 20),
              SizedBox(width: 8),
              Text('Sleep',
                  style: TextStyle(fontSize: 14)
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              8,
                  (index) => Container(
                width: 4,
                height: 25 * (0.5 + (index % 3) * 0.25),
                color: Colors.purple[300],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaterCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.water_drop,
                  color: Colors.blue,
                  size: 20
              ),
              SizedBox(width: 8),
              Text('Water',
                  style: TextStyle(fontSize: 14)
              ),
            ],
          ),
          Spacer(),
          Text('5/8 Cups',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
              )
          ),
        ],
      ),
    );
  }
}

class CyclingPathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF9CE37D)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height * 0.6)
      ..lineTo(size.width * 0.3, size.height * 0.6)
      ..lineTo(size.width * 0.3, size.height * 0.3)
      ..lineTo(size.width * 0.7, size.height * 0.3)
      ..lineTo(size.width * 0.7, size.height * 0.7)
      ..lineTo(size.width, size.height * 0.7);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}