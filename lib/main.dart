import 'package:flutter/material.dart';
import 'home.dart';
import 'login_page.dart';
import 'student_screen.dart';
import 'leave_request.dart';
import 'outing.dart';
import 'request_log.dart';

void main() {
  runApp(InOutApp());
}

class InOutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InOut - An NIT-PY initiative',
      theme: ThemeData(
        primaryColor: Colors.green[800], // Dark green color for buttons // Light leaf green background color
      ),
      home: HomePage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/student': (context) => StudentScreen(),
        //'/admin': (context) => AdminScreen(),
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
    );
  }
}
