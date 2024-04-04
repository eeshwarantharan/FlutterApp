import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'request_log.dart';

class OutingPage extends StatefulWidget {
  @override
  _OutingPageState createState() => _OutingPageState();
}

class _OutingPageState extends State<OutingPage> {
  String _placeOfVisit = '';
  String _selectedGate = '';
  late String _qrData;
  int _logCount = 0;

  @override
  void initState() {
    super.initState();
    _qrData = generateQRData(_placeOfVisit, _selectedGate);
  }

  String generateQRData(String placeOfVisit, String selectedGate) {
    return '$placeOfVisit,$selectedGate';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Outing Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Place of Visit:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                setState(() {
                  _placeOfVisit = value;
                  _qrData = generateQRData(_placeOfVisit, _selectedGate);
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter place of visit',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select Gate:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            RadioListTile<String>(
              title: Text('Main Gate'),
              value: 'Main Gate',
              groupValue: _selectedGate,
              onChanged: (value) {
                setState(() {
                  _selectedGate = value!;
                  _qrData = generateQRData(_placeOfVisit, _selectedGate);
                });
              },
            ),
            RadioListTile<String>(
              title: Text('Poovam Gate'),
              value: 'Poovam Gate',
              groupValue: _selectedGate,
              onChanged: (value) {
                setState(() {
                  _selectedGate = value!;
                  _qrData = generateQRData(_placeOfVisit, _selectedGate);
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('QR Code'),
                      content: SizedBox(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: QrImageView(
                            data: _qrData,
                            version: QrVersions.auto,
                            size: 200,
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              _logCount++;
                            });
                          },
                          child: Text('Save to Request Log'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Generate QR Code'),
            ),
          ],
        ),
      ),
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: OutingPage(),
    routes: {
      '/request_log': (context) => RequestLogPage(logCount: 0),
    },
  ));
}
