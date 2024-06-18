import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lucii/mail/mail_screen.dart';
import 'package:lucii/phone/phone_screen.dart';
import 'package:lucii/web/web_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),

      //TODO
      //1. Add BottomNavBar for each function
      //2. change background color
      //3. ensure it works
    );
  }
}

final bottomNavbarIndexProvider = StateProvider<int>((ref) => 0);

class App extends ConsumerWidget {
  App({super.key});

  final List<Widget> screens = [
    const PhoneScreen(),
    MailScreen(),
    WebScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarIndex = ref.watch(bottomNavbarIndexProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavBarIndex,
        onTap: (value) => ref
            .read(bottomNavbarIndexProvider.notifier)
            .update((state) => value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Phone'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Mail'),
          BottomNavigationBarItem(icon: Icon(Icons.web), label: 'Web'),
        ],
      ),
      body: screens[bottomNavBarIndex],
    );
  }
}
