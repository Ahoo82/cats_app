import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService extends ChangeNotifier {
  static final FavoritesService _instance = FavoritesService._();

  factory FavoritesService() => _instance;

  FavoritesService._();

  static const _key = 'favorite_breeds';

  final Set<String> _favorites = {};

  bool _loaded = false;

  Set<String> get favorites => Set.unmodifiable(_favorites);

  Future<void> load() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    _favorites.addAll(list);
    _loaded = true;
  }

  bool isFavorite(String name) => _favorites.contains(name);

  Future<void> toggle(String name) async {
    final prefs = await SharedPreferences.getInstance();
    if (_favorites.contains(name)) {
      _favorites.remove(name);
    } else {
      _favorites.add(name);
    }
    await prefs.setStringList(_key, _favorites.toList());
    notifyListeners();
  }
}
