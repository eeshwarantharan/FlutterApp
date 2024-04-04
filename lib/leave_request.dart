import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';


class LeaveRequestPage extends StatefulWidget {
  @override
  _LeaveRequestPageState createState() => _LeaveRequestPageState();
}

class _LeaveRequestPageState extends State<LeaveRequestPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _purposeController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  DateTime _outDateTime = DateTime.now();
  DateTime _inDateTime = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _purposeController,
                decoration: InputDecoration(labelText: 'Purpose of Visit'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the purpose of visit';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _placeController,
                decoration: InputDecoration(labelText: 'Place of Visit'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the place of visit';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text('Out Date & Time'),
                      // ignore: unnecessary_null_comparison
                      subtitle: _outDateTime == null
                          ? Text('Select Date & Time')
                          : Text(_outDateTime.toString()),
                      onTap: () {
                        _showDateTimePicker(true);
                      },
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text('In Date & Time'),
                      // ignore: unnecessary_null_comparison
                      subtitle: _inDateTime == null
                          ? Text('Select Date & Time')
                          : Text(_inDateTime.toString()),
                      onTap: () {
                        _showDateTimePicker(false);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Submit the form data
                    _submitForm();
                  }
                },
                child: Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }

void _showDateTimePicker(bool isOutDateTime) {
    DatePicker.showDateTimePicker(
      context,
      showTitleActions: true,
      onChanged: (dateTime) {
        setState(() {
          if (isOutDateTime) {
            _outDateTime = dateTime;
          } else {
            _inDateTime = dateTime;
          }
        });
      },
      onConfirm: (dateTime) {
        setState(() {
          if (isOutDateTime) {
            _outDateTime = dateTime;
          } else {
            _inDateTime = dateTime;
          }
        });
      },
    );
  }

  void _submitForm() {
    // Process the form data (e.g., send it to the server)
    // Here you can handle the submission logic, such as sending the data to a server or saving it locally.
    // For now, let's just print the form data.
    print('Purpose of Visit: ${_purposeController.text}');
    print('Place of Visit: ${_placeController.text}');
    print('Out Date & Time: $_outDateTime');
    print('In Date & Time: $_inDateTime');
  }
}

