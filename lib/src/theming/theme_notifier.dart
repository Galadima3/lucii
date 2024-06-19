import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucii/src/theming/theme_service.dart';

class ThemeNotifier extends StateNotifier<bool> {
  final ThemeService _themeService;

  ThemeNotifier(this._themeService) : super(false) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    state = await _themeService.getThemeMode();
  }

  Future<void> toggleTheme() async {
    state = !state;
    await _themeService.saveThemeMode(state);
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, bool>(
  (ref) {
    final themeService = ref.read(themeServiceProvider);
    return ThemeNotifier(themeService);
  },
);
