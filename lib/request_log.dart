import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RequestLogPage extends StatefulWidget {
  final int logCount;

  RequestLogPage({required this.logCount});

  @override
  _RequestLogPageState createState() => _RequestLogPageState();
}

class _RequestLogPageState extends State<RequestLogPage> {
  int _logCount = 0;

  @override
  void initState() {
    super.initState();
    _logCount = widget.logCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Log'),
      ),
      body: ListView.builder(
        itemCount: _logCount,
        itemBuilder: (context, index) {
          // Number the list of logs
          int logNumber = index + 1;

          return ListTile(
            title: Text('QR Code $logNumber'),
            subtitle: QrImageView(
              data: 'QR Data $logNumber',
              version: QrVersions.auto,
              size: 100,
            ),
            onTap: () {
              // Implement functionality to handle tap on the QR code
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SizedBox(
                      width: 300,
                      height: 300,
                      child: QrImageView(
                        data: 'QR Data $logNumber',
                        version: QrVersions.auto,
                        size: 300,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
