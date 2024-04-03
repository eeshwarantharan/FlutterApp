import 'package:flutter/material.dart';
import 'success_page.dart';

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

  TextEditingController _studentPasswordController = TextEditingController();
  TextEditingController _adminPasswordController = TextEditingController();
  String? _studentPasswordErrorText;
  String? _adminPasswordErrorText;


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
            // Password input for Student account
            if (_accountType == 'Student')
              TextField(
                controller: _studentPasswordController,
                obscureText: true,
                onChanged: (value) {
                  // Check password constraints
                  setState(() {
                    if (value.length < 8) {
                      _studentPasswordErrorText = 'Password must be at least 8 characters';
                    } else {
                      _studentPasswordErrorText = null;
                    }
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _studentPasswordErrorText,
                ),
              ),
            // Password input for Admin account
            if (_accountType == 'Admin')
              TextField(
                controller: _adminPasswordController,
                obscureText: true,
                onChanged: (value) {
                  // Check password constraints
                  setState(() {
                    if (value.length < 8) {
                      _adminPasswordErrorText = 'Password must be at least 8 characters';
                    } else {
                      _adminPasswordErrorText = null;
                    }
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _adminPasswordErrorText,
                ),
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
                        _studentMobileController.text.length == 10 &&
                        _studentPasswordController.text.isNotEmpty &&
                        _studentPasswordController.text.length >= 8;
                    bool adminDetailsFilled = _accountType == 'Admin' &&
                        _adminNameController.text.isNotEmpty &&
                        _adminMobileController.text.isNotEmpty &&
                        _adminMobileController.text.length == 10 &&
                        _selectedRole.isNotEmpty &&
                        _adminPasswordController.text.isNotEmpty &&
                        _adminPasswordController.text.length >= 8;
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
