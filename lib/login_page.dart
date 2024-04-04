import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/pale_red_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 40),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    // Implement login logic here
                    // For demonstration, assume login is successful
                    // Check the credentials and navigate to the appropriate screen
                    String mobileNumber = ''; // Get the mobile number from the TextField
                    String password = ''; // Get the password from the TextField
                    if (mobileNumber == '9171907755' && password == 'student') {
                      // Navigate to student screen
                      Navigator.pushReplacementNamed(context, '/student');
                    } else if (mobileNumber == '9944270204' && password == 'admin') {
                      // Navigate to admin screen
                      Navigator.pushReplacementNamed(context, '/admin');
                    } else {
                      // Show an error message for invalid credentials
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text('Invalid credentials'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), backgroundColor: Color.fromARGB(237, 117, 91, 214),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Navigate to admin login page
                    Navigator.pushReplacementNamed(context, '/student');
                  },
                  child: Text(
                    'Login as Student',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Navigate to admin login page
                    //Navigator.pushReplacementNamed(context, '/admin');
                  },
                  child: Text(
                    'Login as Admin',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
