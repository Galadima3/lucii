import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucii/app.dart';
import 'package:lucii/src/theming/custom_theme.dart';
import 'package:lucii/src/theming/theme_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  
  
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifierProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.lightThemeData(context),
        darkTheme: CustomTheme.darkThemeData(context),
        themeMode: theme ? ThemeMode.light : ThemeMode.dark,
        home: App());
  }
}
