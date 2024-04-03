import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final Animation<double> animation;

  SuccessPage({required this.animation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pale_red_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, -1.0), // Adjust the begin offset as needed
                    end: Offset.zero,
                  ).animate(animation),
                  child: Icon(
                    Icons.check_circle,
                    color: Color.fromARGB(255, 19, 117, 45),
                    size: 100.0,
                  ),
                ),
                SizedBox(height: 20.0),
                FadeTransition(
                  opacity: animation,
                  child: Text(
                    'Account Successfully Created !',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                FadeTransition(
                  opacity: animation,
                  child: ElevatedButton(
                    onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor, // Dark green button color
                    ),
                    child: Text(
                      'Go to Login Page',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
