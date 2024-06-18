import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucii/src/shared/fancy_button.dart';
import 'package:url_launcher/url_launcher.dart';

final phoneDigitsProvider = StateProvider<String>((ref) => "+2348108130590");

class PhoneScreen extends ConsumerWidget {
  const PhoneScreen({super.key});

  Future makePhoneCall(String phoneNumber) async {
    final Uri call = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(call)){
      await launchUrl(call);  
    } else {
      throw 'Could not launch $call';
    }
  }

  Future sendSMS(String phoneNumber) async {
    final Uri sms = Uri(scheme: 'sms', path: phoneNumber);
     if (await canLaunchUrl(sms)){
      await launchUrl(sms);  
    } else {
      throw 'Could not send SMS to $sms';
    }
  
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneNumber = ref.watch(phoneDigitsProvider);
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FancyButton(
              text: "Call",
              function: () => makePhoneCall(phoneNumber),
            ),
            FancyButton(
              text: "Text",
              function: () => sendSMS(phoneNumber),
            ),
          ],
        ),
      ),
    );
  }
}

