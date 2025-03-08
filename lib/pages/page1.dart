import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webingo_assignment/bloc/page1_bloc.dart';
import 'package:webingo_assignment/bloc/page1_event.dart';
import 'package:webingo_assignment/bloc/page1_state.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex = 3;
  int _iconSelectedIndex = 0;
  String _selectedDate = "2025-11-13";
  final ScrollController _scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    context.read<UserPlanBloc>().add(FetchUserPlans(_selectedDate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf6f6f6),
      body: BlocBuilder<UserPlanBloc, UserPlanState>(
        builder: (context, state) {
          if (state is UserPlanLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserPlanLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeaderSection(_selectedDate),
                  _buildDailyChallengeCard(context),
                  _buildDateSelector(),
                  _buildYourPlanSection(context, state.userPlans),
                ],
              ),
            );
          } else if (state is UserPlanError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
  final Map<String, dynamic> _staticFallbackPlan = {
    'plans': [
      {
        'level': 'Medium',
        'title': 'Plan Yoga',
        'date': '2023-11-01',
        'time': '07:00 AM',
        'room': 'Room 101',
        'trainer': 'John Doe',
      },
      {
        'level': 'Light',
        'title': 'Balance',
        'date': '2023-11-01',
        'time': '06:00 PM',
        'room': 'Room 102',
        'trainer': 'Jane Smith',
      },
    ],
  };
  Widget _buildHeaderSection(selectedDate) {
    final todayDate = DateTime.parse(selectedDate);
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
    final List<String> weekdays = [
      "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
    ];
    final List<int> dates = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28];

    return Container(
      height: 80, // Fixed height for date selector
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          bool isSelected = index == _selectedIndex;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
                _selectedDate = "2025-11-${dates[index]}";
              });
              _scrollController.animateTo(
                index * 50.0, // Adjust scroll position
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );

              context.read<UserPlanBloc>().add(FetchUserPlans(_selectedDate));
            },
            child: Container(
              width: 50,
              height: 70,
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: isSelected
                    ? null
                    : Border.all(color: Colors.grey[300]!, width: 1),
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
        },
      ),
    );
  }
  Widget _buildYourPlanSection(BuildContext context, Map<String, dynamic> userPlans) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    double yogaCardHeight = screenHeight * 0.32;
    double balanceCardHeight = screenHeight * 0.23;
    double socialCardHeight = screenHeight * 0.09;
    double totalRightHeight = balanceCardHeight + socialCardHeight + 12;

    List<dynamic> plans = (userPlans == null || userPlans['plans'] == null || userPlans['plans'].isEmpty)
        ? _staticFallbackPlan['plans']
        : userPlans['plans'];

    return Stack(
      children: [
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
                        child: plans.isNotEmpty
                            ? _buildYogaActivityCard(
                          color: Color(0xFFffbe58),
                          badge: plans[0]['level'],
                          title: plans[0]['title'],
                          date: plans[0]['date'],
                          time: plans[0]['time'],
                          location: plans[0]['room'],
                          trainerName: plans[0]['trainer'],
                          trainerImage: AssetImage('assets/profile.png'),
                        )
                            : Center(
                          child: Text(
                            "No yoga plan available.",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: balanceCardHeight,
                            child: plans.length > 1
                                ? _buildBalanceActivityCard(
                              color: Color(0xffa8ccfe),
                              badge: plans[1]['level'],
                              title: plans[1]['title'],
                              date: plans[1]['date'],
                              time: plans[1]['time'],
                              location: plans[1]['room'],
                              trainerName: plans[1]['trainer'],
                              trainerImage: AssetImage('assets/profile.png'),
                              imageRightOffset: -screenWidth * 0.13,
                              imageTopOffset: -screenWidth * 0.12,
                            )
                                : Center(
                              child: Text(
                                "No balance plan available.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
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
                SizedBox(height: 70),
              ],
            ),
          ),
        ),

        // Bottom navigation bar
        Positioned(
          bottom: 0,
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

  Widget _buildYogaActivityCard({
    required Color color,
    required String badge,
    required String title,
    required String date,
    required String time,
    required String location,
    required String trainerName,
    required AssetImage trainerImage,
  }) {
    return  Container(
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: badge == "Medium"
                            ? Color(0xffffce8c)
                            : Color(0xffc1d9ff),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        badge,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "$date\n$time",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800]),
                    ),
                    SizedBox(height: 8),
                    Text(
                      location,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800]),
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
          _iconSelectedIndex = 0;
        });
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: _iconSelectedIndex == index ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: _iconSelectedIndex == index ? Colors.black : Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
