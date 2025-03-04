import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(),
            _buildDailyChallengeCard(context),
            _buildDateSelector(),
            _buildYourPlanSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    final todayDate = DateTime.now();
    final formattedDate = "${todayDate.day} ${_getMonthName(todayDate.month)}.";
    return Container(
      padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile.avif'),
            radius: 25,
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello, Sandra",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Today $formattedDate",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            child: IconButton(
              icon: Icon(
                Icons.search_rounded,
                size: 25,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "";
    }
  }

  Widget _buildDailyChallengeCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFb2a1ff), Color(0xFFb2a1ff)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Daily\n",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Kontora',
                      ),
                    ),
                    TextSpan(
                      text: "challenge",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Kontora',
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Do your plan before 09:00 AM",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                  fontFamily: 'URWGeometric',
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.png'),
                        radius: 15,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.png'),
                        radius: 15,
                      ),
                    ),
                    Positioned(
                      left: 40,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile.png'),
                        radius: 15,
                      ),
                    ),
                    Positioned(
                      left: 60,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(0xff5b499f),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "+4",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: -MediaQuery.of(context).size.width * 0.1,
            top: -MediaQuery.of(context).size.width * 0.13,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/3d-view.png',
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.53,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    final List<String> weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    final List<int> dates = [22, 23, 24, 25, 26, 27, 28];
    final int selectedIndex = 3;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(weekdays.length, (index) {
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {},
              child: Container(
                width: 45,
                height: 70,
                margin: EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: isSelected ? null : Border.all(color: Colors.grey[300]!, width: 1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      weekdays[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.grey[500],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      dates[index].toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildYourPlanSection(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double yogaCardHeight = screenHeight * 0.32;
    double balanceCardHeight = screenHeight * 0.23;
    double socialCardHeight = screenHeight * 0.09;
    double totalRightHeight = balanceCardHeight + socialCardHeight + 12;

    return Stack(
      children: [
        // Main content
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.04),
                Text(
                  "Your Plan",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: totalRightHeight,
                        child: _buildYogaActivityCard(
                          color: Color(0xFFffbe58),
                          badge: "Medium",
                          title: "Yoga Group",
                          date: "25 Nov.",
                          time: "14:00 - 15:00",
                          location: "A5 Room",
                          trainerName: "Tiffany Way",
                          trainerImage: AssetImage('assets/profile.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: balanceCardHeight,
                            child: _buildBalanceActivityCard(
                              color: Color(0xffa8ccfe),
                              badge: "Light",
                              title: "Balance",
                              date: "28 Nov.",
                              time: "18:00 - 19:30",
                              location: "A2 room",
                              trainerName: "John Doe",
                              trainerImage: AssetImage('assets/profile.png'),
                              imageRightOffset: -screenWidth * 0.13,
                              imageTopOffset: -screenWidth * 0.12,
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            height: socialCardHeight,
                            decoration: BoxDecoration(
                              color: Color(0xFFfea0ff),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildSocialIconOne(FontAwesomeIcons.instagram),
                                _buildSocialIconOne(FontAwesomeIcons.youtube),
                                _buildSocialIconOne(FontAwesomeIcons.twitter),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
                // Add extra space at the bottom to avoid overlap with the bottom bar
                SizedBox(height: 70), // Adjust this value as needed
              ],
            ),
          ),
        ),

        // Bottom navigation bar
        Positioned(
          bottom: 0, // Position at the very bottom of the screen
          left: (screenWidth * 0.05),
          right: (screenWidth * 0.05),
          child: Container(
            width: screenWidth * 0.9,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.9),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomBarItem(Icons.home_outlined, 0),
                _buildBottomBarItem(Icons.category, 1),
                _buildBottomBarItem(Icons.analytics, 2),
                _buildBottomBarItem(Icons.account_circle, 3),
              ],
            ),
          ),
        ),
      ],
    );
  }  Widget _buildYogaActivityCard({
    required Color color,
    required String badge,
    required String title,
    required String date,
    required String time,
    required String location,
    required String trainerName,
    required AssetImage trainerImage,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: badge == "Medium" ? Color(0xffffce8c) : Color(0xffc1d9ff),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              badge,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: badge == "Medium" ? Colors.black : Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "$date\n$time",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 8),
          Text(
            location,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: trainerImage,
                radius: 20,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trainer",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    trainerName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceActivityCard({
    required Color color,
    required String badge,
    required String title,
    required String date,
    required String time,
    required String location,
    required String trainerName,
    required AssetImage trainerImage,
    required double imageRightOffset,
    required double imageTopOffset,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final imageWidth = constraints.maxWidth * 0.4;
        final imageHeight = imageWidth;

        return SizedBox(
          width: double.infinity,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: badge == "Medium" ? Color(0xffffce8c) : Color(0xffc1d9ff),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        badge,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      title,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "$date\n$time",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[800]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      location,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[800]),
                    ),
                  ],
                ),
                Positioned(
                  right: imageRightOffset,
                  bottom: -imageHeight * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/3d-view.png',
                      width: imageWidth * 2.0,
                      height: imageHeight * 1.9,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSocialIconOne(IconData iconData) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFdb88de),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(iconData, color: Color(0xFFfea0ff), size: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: _selectedIndex == index ? Colors.black : Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}