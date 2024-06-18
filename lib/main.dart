import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucii/app.dart';
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

