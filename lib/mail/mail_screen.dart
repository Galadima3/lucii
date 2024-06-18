import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class MailScreen extends ConsumerWidget {
  MailScreen({super.key});

  final mailController = TextEditingController();
  Future sendMail(String email) async {
    final Uri mail = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(mail)) {
      await launchUrl(mail);
    } else {
      throw 'Could not send email to $mail';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: mailController,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
            onFieldSubmitted: (value) => sendMail(value),
          ),
        ),
      ),
    );
  }
}
