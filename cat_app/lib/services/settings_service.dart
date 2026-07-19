import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsService extends ChangeNotifier {
  static final SettingsService _instance = SettingsService._();

  factory SettingsService() => _instance;

  SettingsService._();

  static const _themeKey = 'theme_mode';
  static const _fontKey = 'font_size';

  ThemeMode _themeMode = ThemeMode.system;
  double _fontScale = 1.0;

  ThemeMode get themeMode => _themeMode;
  double get fontScale => _fontScale;

  String get fontLabel {
    if (_fontScale <= 0.9) return 'کوچک';
    if (_fontScale >= 1.15) return 'بزرگ';
    return 'متوسط';
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey) ?? 2;
    _themeMode = ThemeMode.values[themeIndex.clamp(0, 2)];
    _fontScale = (prefs.getDouble(_fontKey) ?? 1.0).clamp(0.85, 1.2);
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, mode.index);
    notifyListeners();
  }

  void cycleFontSize() {
    if (_fontScale <= 0.9) {
      _fontScale = 1.0;
    } else if (_fontScale >= 1.15) {
      _fontScale = 0.85;
    } else {
      _fontScale = 1.2;
    }
    _saveFontScale();
    notifyListeners();
  }

  Future<void> _saveFontScale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_fontKey, _fontScale);
  }
}
