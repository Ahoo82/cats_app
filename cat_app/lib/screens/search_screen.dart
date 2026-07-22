import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/breed_repository.dart';
import '../models/cat_breed.dart';
import 'breed_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String _query = '';
  List<String> _recent = [];

  static const _recentKey = 'recent_searches';

  @override
  void initState() {
    super.initState();
    _loadRecent();
    _focusNode.requestFocus();
    _controller.addListener(() => setState(() => _query = _controller.text));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _loadRecent() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => _recent = prefs.getStringList(_recentKey) ?? []);
  }

  Future<void> _saveRecent(String query) async {
    if (query.trim().isEmpty) return;
    _recent.remove(query);
    _recent.insert(0, query);
    if (_recent.length > 5) _recent = _recent.sublist(0, 5);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_recentKey, _recent);
    setState(() {});
  }

  List<CatBreed> get _matchingBreeds {
    if (_query.isEmpty) return [];
    final q = _query.toLowerCase();
    return catBreeds.where((b) {
      final persian = BreedRepository.persianNames[b.name] ?? '';
      return b.name.toLowerCase().contains(q) ||
          persian.contains(q) ||
          b.origin.toLowerCase().contains(q);
    }).toList();
  }

  List<Map<String, String>> get _matchingArticles {
    if (_query.isEmpty) return [];
    final q = _query.toLowerCase();
    return BreedRepository.articleSearchEntries.where((a) {
      return a['title']!.toLowerCase().contains(q) ||
          a['summary']!.toLowerCase().contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final breeds = _matchingBreeds;
    final articles = _matchingArticles;
    final hasResults = _query.isNotEmpty;
    final isEmpty = hasResults && breeds.isEmpty && articles.isEmpty;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            _buildSearchField(theme),
            const SizedBox(height: 16),
            Expanded(
              child: !hasResults
                  ? _buildRecentSearches(theme)
                  : isEmpty
                      ? _buildEmptyState(theme)
                      : SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (breeds.isNotEmpty) ...[
                                _buildSectionTitle(theme, 'نژادها (${breeds.length})'),
                                const SizedBox(height: 10),
                                ...breeds.take(5).map((b) => _buildBreedResult(theme, b)),
                                const SizedBox(height: 20),
                              ],
                              if (articles.isNotEmpty) ...[
                                _buildSectionTitle(theme, 'مقالات (${articles.length})'),
                                const SizedBox(height: 10),
                                ...articles.take(5).map((a) => _buildArticleResult(theme, a)),
                              ],
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_rounded, size: 22, color: theme.colorScheme.onSurface),
              padding: EdgeInsets.zero,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 3))],
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                textDirection: TextDirection.rtl,
                onSubmitted: (_) => _saveRecent(_query),
                decoration: InputDecoration(
                  hintText: 'جستجوی نژاد، بیماری، غذا...',
                  hintStyle: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.35)),
                  prefixIcon: Icon(Icons.search_rounded, size: 20, color: theme.colorScheme.onSurface.withValues(alpha: 0.35)),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.close_rounded, size: 20, color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
                          onPressed: () => _controller.clear(),
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                ),
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearches(ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_recent.isNotEmpty) ...[
            Row(
              children: [
                Text('جستجوهای اخیر', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600, color: theme.colorScheme.onSurface.withValues(alpha: 0.45), fontSize: 13)),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.remove(_recentKey);
                    setState(() => _recent = []);
                  },
                  child: Text('پاک کردن', style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _recent.map((r) => ActionChip(
                label: Text(r, style: const TextStyle(fontSize: 13)),
                onPressed: () {
                  _controller.text = r;
                  _saveRecent(r);
                },
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              )).toList(),
            ),
            const SizedBox(height: 28),
          ],
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Icon(Icons.search_rounded, size: 48, color: theme.colorScheme.onSurface.withValues(alpha: 0.15)),
                  const SizedBox(height: 14),
                  Text('جستجو در نژادها و مقالات', style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.35))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off_rounded, size: 56, color: theme.colorScheme.onSurface.withValues(alpha: 0.2)),
            const SizedBox(height: 16),
            Text('نتیجه\u200Cای یافت نشد', style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.4))),
            const SizedBox(height: 8),
            Text('عبارت دیگری را جستجو کنید', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.3))),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(title, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600, color: theme.colorScheme.onSurface.withValues(alpha: 0.45), fontSize: 13));
  }

  Widget _buildBreedResult(ThemeData theme, CatBreed breed) {
    final persianName = BreedRepository.persianNames[breed.name] ?? breed.name;
    final imagePath = BreedRepository.breedImages[breed.name];

    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.04),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          _saveRecent(_query);
          Navigator.push(context, PageRouteBuilder(
            pageBuilder: (_, _, _) => BreedDetailScreen(breed: breed),
            transitionsBuilder: (_, animation, _, child) => FadeTransition(opacity: animation, child: child),
            transitionDuration: const Duration(milliseconds: 250),
          ));
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [theme.colorScheme.surface, theme.colorScheme.surfaceContainerHighest]),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 48, height: 48,
                  child: imagePath != null
                      ? Image.asset(imagePath, fit: BoxFit.cover, errorBuilder: (_, _, _) => _buildBreedIcon(theme))
                      : _buildBreedIcon(theme),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(persianName, style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 2),
                  Row(children: [
                    Icon(Icons.location_on_outlined, size: 12, color: theme.colorScheme.primary.withValues(alpha: 0.6)),
                    const SizedBox(width: 2),
                    Text(breed.name, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.5))),
                  ]),
                ]),
              ),
              Icon(Icons.chevron_left_rounded, size: 20, color: theme.colorScheme.onSurface.withValues(alpha: 0.25)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreedIcon(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [theme.colorScheme.primaryContainer, theme.colorScheme.secondaryContainer])),
      child: Icon(Icons.pets_rounded, size: 24, color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.4)),
    );
  }

  Widget _buildArticleResult(ThemeData theme, Map<String, String> article) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.04),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _saveRecent(_query),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [theme.colorScheme.surface, theme.colorScheme.surfaceContainerHighest]),
          ),
          child: Row(children: [
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(article['title']!, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(article['summary']!, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.5)), maxLines: 2, overflow: TextOverflow.ellipsis),
              ]),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(color: theme.colorScheme.primaryContainer, borderRadius: BorderRadius.circular(6)),
              child: Text(article['category']!, style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onPrimaryContainer, fontWeight: FontWeight.w600)),
            ),
          ]),
        ),
      ),
    );
  }
}
