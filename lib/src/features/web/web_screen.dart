import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class WebScreen extends ConsumerWidget {
  WebScreen({super.key});

  final urlController = TextEditingController();
  Future<void> openURL(String site) async {
    final Uri url = Uri(scheme: 'https', host: site);
    if (await canLaunchUrl(url)) {
      await launchUrl(url,
          mode: LaunchMode.inAppWebView,
          browserConfiguration: const BrowserConfiguration(showTitle: true));
    } else {
      throw 'Could not open $url';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: urlController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.web),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onFieldSubmitted: (value) => openURL(value),
          ),
        ),
      ),
    );
  }
}
