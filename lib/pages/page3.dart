import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  List<List<String>> seatStatus = [
    ['x', '0', '0', '0', 'x', '0', '0', '0', 'x'],
    ['0', '1', '0', '0', 'x', '0', '2', '0', '2'],
    ['0', '0', '0', '0', 'x', '0', '0', '0', '0'],
    ['0', '0', '0', '0', 'x', '0', '0', '0', '0'],
    ['0', '0', '0', '0', 'x', '0', '1', '0', '0'],
    ['0', '0', '0', '0', 'x', '0', '0', '0', '0'],
    ['0', '2', '0', '0', 'x', '0', '0', '0', '0'],
    ['x', '0', '0', '0', 'x', '0', '0', '0', 'x'],
  ];

  void toggleSeatStatus(int row, int col) {
    if (seatStatus[row][col] == '0' || seatStatus[row][col] == '1') {
      setState(() {
        seatStatus[row][col] = seatStatus[row][col] == '0' ? '1' : '0';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/profile.avif'),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Samantha',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.search, size: 32),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.arrow_back, size: 24),
                    SizedBox(width: 10),
                    Text(
                      'Choose Seats',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: seatStatus[0].length,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: seatStatus.length * seatStatus[0].length,
              itemBuilder: (context, index) {
                int row = index ~/ seatStatus[0].length;
                int col = index % seatStatus[0].length;
                String seat = seatStatus[row][col];
                if (seat == 'x') return SizedBox.shrink();
                return GestureDetector(
                  onTap: () => toggleSeatStatus(row, col),
                  child: Container(
                    decoration: BoxDecoration(
                      color: seat == '0'
                          ? Color(0xffd0ccc0)
                          : seat == '1'
                          ? Color(0xffac92f5)
                          : Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusLabel(Color(0xffac92f5), 'Selected'),
                _buildStatusLabel(Colors.black, 'Reserved'),
                _buildStatusLabel(Color(0xffd0ccc0), 'Available'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Cinema Max',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildDetailColumn('08.04', 'Date'),
                    _buildDetailColumn('21:55', 'Hour', isHighlighted: true),
                    _buildDetailColumn('2, 3', 'Seats'),
                    _buildDetailColumn('2, 5', 'Row'),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '\$35.50',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffac94f6),
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Buy',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
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

  Widget _buildStatusLabel(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailColumn(String value, String label, {bool isHighlighted = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isHighlighted)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  label,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            ],
          ),
      ],
    );
  }
}