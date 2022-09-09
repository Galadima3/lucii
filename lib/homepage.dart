// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String _url = 'https://youtube.com';
  final String _mobileNumber = '+2348108130598';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
        body: Center(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              
              onPressed: () async {
                if (await canLaunchUrlString(_url)) {
                  await launchUrlString(_url);
                }
              },
              color: Colors.blueAccent,
              child: Text(
                'URL',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                final _call = 'tel:$_mobileNumber';
                if (await canLaunch(_call)) {
                  await launch(_call);
                }
              },
              color: Colors.blueAccent,
              child: Text(
                'Call',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                final _text = 'sms:$_mobileNumber';
                if (await canLaunch(_text)) {
                  await launch(_text);
                }
              },
              color: Colors.blueAccent,
              child: Text(
                'Text',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
