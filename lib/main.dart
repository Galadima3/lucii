import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:lucii/src/features/mail/mail_screen.dart';
import 'package:lucii/src/features/phone/phone_screen.dart';
import 'package:lucii/src/features/web/web_screen.dart';
import 'package:lucii/src/theming/custom_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightThemeData(context),
      darkTheme: CustomTheme.darkThemeData(context),
      themeMode: theme ? ThemeMode.light : ThemeMode.dark,
      home: App(),
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
    final themeMode = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => ref
                  .read(themeModeProvider.notifier)
                  .update((state) => !state),
              icon: themeMode
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode))
        ],
      ),
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
