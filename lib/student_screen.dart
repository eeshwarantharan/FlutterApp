import 'package:flutter/material.dart';
import 'leave_request.dart';
import 'outing.dart';
import 'request_log.dart';

void main() {
  runApp(MaterialApp(
    home: StudentScreen(),
    routes: {
      '/leave_request': (context) => LeaveRequestPage(),
      '/outing': (context) => OutingPage(),
      '/request_log': (context) => Builder(
        builder: (BuildContext context) {
          // Get the log count from somewhere or initialize it to 0
          int logCount = 0;
          return RequestLogPage(logCount: logCount);
        },
      ),
      '/virtual_id': (context) => VirtualIdPage(),
    },
  ));
}


class StudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/student_bkg.png', // Spiral note background
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                Text(
                  'Welcome', // Welcome message
                  style: TextStyle(
                    fontSize: 56.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Tharan !",
                  //'$studentName !', // Student name
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20), // Add some spacing
                Container(
                  height: 420, // Grid container height
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: GridView.count(
                    crossAxisCount: 2, // 2 columns
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    children: [
                      _buildFunctionalityItem(
                          'Virtual ID', Icons.account_circle, Color.fromARGB(255, 255, 139, 174), () {
                        Navigator.pushNamed(context, '/virtual_id');
                      }),
                      _buildFunctionalityItem(
                          'Leave Request', Icons.file_copy, Color.fromARGB(255, 173, 135, 239), () {
                        Navigator.pushNamed(context, '/leave_request');
                      }),
                      _buildFunctionalityItem(
                          'Outing', Icons.directions_walk, Color.fromARGB(255, 173, 135, 239), () {
                        Navigator.pushNamed(context, '/outing');
                      }),
                      _buildFunctionalityItem(
                          'Request Log', Icons.history, Color.fromARGB(255, 255, 139, 174), () {
                        Navigator.pushNamed(context, '/request_log');
                      }),
                      // Add more functionality items as needed
                    ],
                  ),
                ),
                SizedBox(height: 20), // Add some spacing
                GestureDetector(
                  onTap: () {
                    // Implement functionality to view request log
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Submit leave requests 24hrs before you leave the campus...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Add some spacing
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFunctionalityItem(String text, IconData iconData, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: color, // Fill color
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.black, // Black icon color
              size: 60.0,
            ),
            SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VirtualIdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Virtual ID'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display student details
            Text('Virtual ID Page'),
          ],
        ),
      ),
    );
  }
}
