import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class WebScreen extends ConsumerWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(child: Text("Web Screen"),),
    );
  }
}