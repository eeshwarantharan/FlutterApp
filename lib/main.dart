import 'package:flutter/material.dart';

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
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/green_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 250.0),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/logo.png',
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'InOut',
                      style: TextStyle(fontSize: 45.0, fontStyle: FontStyle.normal),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Text(
                  'An initiative by NIT-PY',
                  style: TextStyle(fontSize: 15.0, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 250.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AccountCreationPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor, // Dark green button color
                  ),
                  child: Text(
                    'Getting Started',
                    style: TextStyle(color: Colors.white),
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

class AccountCreationPage extends StatefulWidget {
  @override
  _AccountCreationPageState createState() => _AccountCreationPageState();
}

class _AccountCreationPageState extends State<AccountCreationPage> {
  
  String _accountType = 'Student';

  List<String> _roles = [
    'Faculty Advisor',
    'Chief Warden',
    'CareTaker',
    'Security Personnel',
  ];

  TextEditingController _studentNameController = TextEditingController();
  TextEditingController _adminNameController = TextEditingController();
  TextEditingController _courseController = TextEditingController();
  TextEditingController _departmentController = TextEditingController();
  TextEditingController _rollNumberController = TextEditingController();
  TextEditingController _roomNumberController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _studentMobileController = TextEditingController();
  TextEditingController _adminMobileController = TextEditingController();
  String? _mobileErrorText; // Variable to store error text for mobile number
  String? _studentNameErrorText;
  String? _adminNameErrorText;
  String? _departmentErrorText;
  String? _rollNumberErrorText;
  String? _roomNumberErrorText;
  String? _yearErrorText;
  String _selectedHostel = ''; 
  String _selectedRole = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(148, 123, 239, 108),
      ),
      body:
        DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/green_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              Center(
              child: Row(
                // height: 50.0,
                // width: double.maxFinite,
                mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                children: [ 
                  ToggleButtons(
                  isSelected: [_accountType == 'Student', _accountType == 'Admin'],
                  onPressed: (int newIndex) {
                    setState(() {
                      _accountType = newIndex == 0 ? 'Student' : 'Admin';
                    });
                  },
                  color: Colors.black,
                  selectedColor: Colors.white,
                  fillColor: Theme.of(context).primaryColor, // Dark green color for selected button
                  borderRadius: BorderRadius.circular(20.0),
                  children: [
                    Text('    Student   '),
                    Text('     Admin     '),
                  ],
                ),
                ],
              ),
              ),
              SizedBox(height: 20.0),
              if (_accountType == 'Student')
                TextField(
                  controller: _studentNameController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _studentNameErrorText = null; // Clear error text when value is valid
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    errorText: _studentNameErrorText,
                  ),
                ),
              if (_accountType == 'Admin')
                TextField(
                  controller: _adminNameController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _adminNameErrorText = null; // Clear error text when value is valid
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    errorText: _adminNameErrorText,
                  ),
                ),
              if (_accountType == 'Student') SizedBox(height: 10.0),
              if (_accountType == 'Student') Text("Course"),
              if (_accountType == 'Student')
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ToggleButtons(                   
                    isSelected: [
                      _courseController.text == 'B.Tech',
                      _courseController.text == 'M.Tech',
                      _courseController.text == 'PhD',
                    ],
                    onPressed: (int index) {
                      setState(() {
                        if (index == 0) {
                          _courseController.text = 'B.Tech';
                        } else if (index == 1) {
                          _courseController.text = 'M.Tech';
                        } else if (index == 2) {
                          _courseController.text = 'PhD';
                        }
                      });
                    },
                    color: Colors.black,
                    selectedColor: Colors.white,
                    fillColor: Color.fromARGB(174, 39, 105, 48), // Dark green color for selected button
                    borderRadius: BorderRadius.circular(20.0),
                    children: [
                      Expanded(child: Text('    B.Tech    ')),
                      Expanded(child: Text('    M.Tech    ')),
                      Expanded(child: Text('      PhD      ')),
                    ],
                  ),
                ),
              ),
              if (_accountType == 'Student')
                TextField(
                  controller: _rollNumberController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _rollNumberErrorText = null; // Clear error text when value is valid
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Roll Number',
                    errorText: _rollNumberErrorText,
                  ),
                ),
              if (_accountType == 'Student')
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.0),
                    Text(
                      'Hostel:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    RadioListTile(
                      title: Text('Moyar'),
                      value: 'Moyar',
                      groupValue: _selectedHostel,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedHostel = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('Bharani'),
                      value: 'Bharani',
                      groupValue: _selectedHostel,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedHostel = value!;
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text('Bhavani'),
                      value: 'Bhavani',
                      groupValue: _selectedHostel,
                      onChanged: (String? value) {
                        setState(() {
                          _selectedHostel = value!;
                        });
                      },
                    ),
                  ],
                ),

              if (_accountType == 'Student')
                TextField(
                  controller: _roomNumberController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _roomNumberErrorText = null; // Clear error text when value is valid
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Room Number',
                    errorText: _roomNumberErrorText,
                  ),
                ),
              if (_accountType == 'Student')
                TextField(
                  controller: _yearController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _yearErrorText = null; // Clear error text when value is valid
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Year of Study',
                    errorText: _yearErrorText,
                  ),
                ),
              if (_accountType == 'Admin')
                TextField(
                  controller: _departmentController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        _departmentErrorText = null; // Clear error text when value is valid
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Department',
                    errorText: _departmentErrorText,
                  ),
                ),
              if (_accountType == 'Student')
                TextField(
                  controller: _studentMobileController,
                  onChanged: (value) {
                    if (value.isNotEmpty && value.length == 10) {
                      setState(() {
                        _mobileErrorText = null; // Clear error text when value is valid
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                    errorText: _mobileErrorText,
                  ),
                ),
              if (_accountType == 'Admin')
                TextField(
                  controller: _adminMobileController,
                  onChanged: (value) {
                    if (value.isNotEmpty && value.length == 10) {
                      setState(() {
                        _mobileErrorText = null; // Clear error text when value is valid
                      });
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                    errorText: _mobileErrorText,
                  ),
                ),
              SizedBox(height: 10.0),
              if (_accountType == 'Admin') SizedBox(child: new Text("Role of Admin"),height: 20.0,width: double.infinity),
              if (_accountType == 'Admin')
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _roles.map((String role) {
                  return RadioListTile(
                    title: Text(role),
                    value: role,
                    groupValue: _selectedRole,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedRole = value!;
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 150.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    bool studentDetailsFilled = _accountType == 'Student' &&
                        _studentNameController.text.isNotEmpty &&
                        _rollNumberController.text.isNotEmpty &&
                        _roomNumberController.text.isNotEmpty &&
                        _yearController.text.isNotEmpty &&
                        _courseController.text.isNotEmpty &&
                        _selectedHostel.isNotEmpty &&
                        _studentMobileController.text.isNotEmpty &&
                        _studentMobileController.text.length == 10;
                    bool adminDetailsFilled = _accountType == 'Admin' &&
                        _adminNameController.text.isNotEmpty &&
                        _adminMobileController.text.isNotEmpty &&
                        _adminMobileController.text.length == 10 &&
                        _selectedRole.isNotEmpty;
                    // Ensure admin role is assigned
                    if (_accountType == 'Student') {
                      if (_studentMobileController.text.isEmpty || _studentMobileController.text.length != 10) {
                        _mobileErrorText = "Enter a 10 digit mobile number";
                      } else {
                        _mobileErrorText = null;
                      }
                      if(_studentNameController.text.isEmpty){
                        _studentNameErrorText = "Enter Student Name";
                      } else {
                        _studentNameErrorText = null;
                      }
                      if(_rollNumberController.text.isEmpty){
                        _rollNumberErrorText = "Enter Roll Number (eg: CS22B1056)";
                      } else {
                        _rollNumberErrorText = null;
                      }
                      if(_roomNumberController.text.isEmpty){
                        _roomNumberErrorText = "Enter Room Number (eg: R18, T35 )";
                      } else {
                        _roomNumberErrorText = null;
                      }
                      if(_yearController.text.isEmpty){
                        _yearErrorText = "Enter (I, II , III etc...)";
                      } else {
                        _yearErrorText = null;
                      }
                    }
                    if (_accountType == 'Admin') {
                      if (_adminMobileController.text.isEmpty || _adminMobileController.text.length != 10) {
                        _mobileErrorText = "Enter a 10 digit mobile number";
                      } else {
                        _mobileErrorText = null;
                      }
                      if (_adminNameController.text.isEmpty){
                        _adminNameErrorText = "Please enter your name...";
                      } else {
                        _adminNameErrorText = null;
                      }
                      if(_departmentController.text.isEmpty){
                        _departmentErrorText = "Enter Department";
                      } else {
                        _departmentErrorText = null;
                      }
                    }
                    if (studentDetailsFilled || adminDetailsFilled) {
                      // Navigate to welcome page
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500), // Adjust the duration as needed
                          pageBuilder: (context, animation, secondaryAnimation) => SuccessPage(animation: animation),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: Offset(0.0, 1.0), // Adjust the begin offset as needed
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            );
                          },
                        ),
                      );
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor, // Dark green button color
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}

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
                image: AssetImage('assets/green_background.png'),
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
                    color: Colors.green,
                    size: 100.0,
                  ),
                ),
                SizedBox(height: 20.0),
                FadeTransition(
                  opacity: animation,
                  child: Text(
                    'Account Successfully Created',
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
                      // Navigate to login page
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/green_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Account Successfully Created',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to login page
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
              ],
            ),
          ),
        ],
      ),
    );
  }



class WelcomePage extends StatelessWidget {
  final String name;
  final String accountType;

  WelcomePage({required this.name, required this.accountType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child : Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Text(
                  ' Welcome,',
                  style: TextStyle(fontSize: 50.0),
                ),
                Text(
                  '$name!',
                  style: TextStyle(fontSize: 25.0),
                ),
              ],
            ),
            )
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              padding: EdgeInsets.all(20.0),
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              children: [
                _buildMenuItem(context, 'Pending Requests', Icons.pending_actions),
                _buildMenuItem(context, 'Approved Requests', Icons.check_circle_outline),
                _buildMenuItem(context, 'In-Out Data', Icons.data_usage),
                _buildMenuItem(context, 'Scan QR', Icons.qr_code),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Should be Implementing the functionality for each menu item here.........
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(234, 213, 124, 15),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: Colors.white,
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

