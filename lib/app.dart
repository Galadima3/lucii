import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucii/src/features/mail/mail_screen.dart';
import 'package:lucii/src/features/phone/phone_screen.dart';
import 'package:lucii/src/features/web/web_screen.dart';
import 'package:lucii/src/theming/theme_notifier.dart';

final bottomNavbarIndexProvider = StateProvider<int>((ref) => 0);

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
   bool _isLoading = true;

  final List<Widget> screens = [
    const PhoneScreen(),
    MailScreen(),
    WebScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
   final bottomNavBarIndex = ref.watch(bottomNavbarIndexProvider);
    final themeMode = ref.watch(themeNotifierProvider);

    if (_isLoading) {
      return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(themeNotifierProvider.notifier).toggleTheme(),
            icon: themeMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
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



