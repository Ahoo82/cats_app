import 'package:flutter/material.dart';

import '../models/cat_breed.dart';
import '../data/breed_repository.dart';
import '../services/favorites_service.dart';
import '../widgets/breed_placeholder.dart';
import 'breed_detail_screen.dart';

class BreedsScreen extends StatefulWidget {
  const BreedsScreen({super.key});

  @override
  State<BreedsScreen> createState() => _BreedsScreenState();
}

class _BreedsScreenState extends State<BreedsScreen> {
  final _selectedFilters = <String>{};
  final _searchController = TextEditingController();
  String _searchQuery = '';

  static const _filters = [
    {'label': 'مو\u200Cبلند', 'key': 'longhair'},
    {'label': 'مو\u200Cکوتاه', 'key': 'shorthair'},
    {'label': 'جثه بزرگ', 'key': 'large'},
    {'label': 'جثه کوچک', 'key': 'small'},
    {'label': 'مناسب خانواده', 'key': 'family'},
  ];

  List<CatBreed> get _filteredBreeds {
    var breeds = catBreeds.toList();

    if (_selectedFilters.isNotEmpty) {
      final sets = <Set<String>>[];
      if (_selectedFilters.contains('longhair')) sets.add(BreedRepository.longhair);
      if (_selectedFilters.contains('shorthair')) sets.add(BreedRepository.shorthair);
      if (_selectedFilters.contains('large')) sets.add(BreedRepository.large);
      if (_selectedFilters.contains('small')) sets.add(BreedRepository.small);
      if (_selectedFilters.contains('family')) sets.add(BreedRepository.family);

      final allowed = sets.reduce((a, b) => a.union(b));
      breeds = breeds.where((b) => allowed.contains(b.name)).toList();
    }

    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      breeds = breeds.where((b) {
        final persian = BreedRepository.persianNames[b.name] ?? '';
        return b.name.toLowerCase().contains(query) ||
            persian.contains(query) ||
            b.origin.toLowerCase().contains(query);
      }).toList();
    }

    return breeds;
  }

  List<Map<String, String>> get _matchingArticles {
    if (_searchQuery.isEmpty) return [];

    final query = _searchQuery.toLowerCase();
    return BreedRepository.articleSearchEntries.where((a) {
      return a['title']!.toLowerCase().contains(query) ||
          a['summary']!.toLowerCase().contains(query);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() => _searchQuery = _searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final breeds = _filteredBreeds;
    final articles = _matchingArticles;
    final isSearching = _searchQuery.isNotEmpty;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildHeader(theme, breeds.length),
            const SizedBox(height: 16),
            _buildSearchBar(theme),
            const SizedBox(height: 14),
            _buildFilters(theme),
            const SizedBox(height: 16),
            Expanded(
              child: breeds.isEmpty && isSearching
                  ? SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  theme.colorScheme.surface,
                                  theme.colorScheme.surfaceContainerHighest,
                                ],
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(Icons.search_off_rounded, size: 40, color: theme.colorScheme.onSurface.withValues(alpha: 0.3)),
                                const SizedBox(height: 12),
                                Text('نژادی با این مشخصات یافت نشد',
                                  style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.5)),
                                  textAlign: TextAlign.center,
                                ),
                                if (articles.isNotEmpty) ...[
                                  const SizedBox(height: 8),
                                  Text('اما ${articles.length} مقاله مرتبط پیدا شد:',
                                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 12),
                                  ...articles.take(5).map((a) => Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Card(
                                      elevation: 0, shadowColor: Colors.black.withValues(alpha: 0.04), surfaceTintColor: Colors.transparent, color: Colors.transparent,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                      child: Container(
                                        padding: const EdgeInsets.all(14),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [theme.colorScheme.surface, theme.colorScheme.surfaceContainerHighest]),
                                        ),
                                        child: Row(children: [
                                          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                            Text(a['title']!, style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                                            const SizedBox(height: 2),
                                            Text(a['summary']!, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.5)), maxLines: 1, overflow: TextOverflow.ellipsis),
                                          ])),
                                          const SizedBox(width: 8),
                                          Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: theme.colorScheme.primaryContainer, borderRadius: BorderRadius.circular(6)), child: Text(a['category']!, style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onPrimaryContainer, fontWeight: FontWeight.w600))),
                                        ]),
                                      ),
                                    ),
                                  )),
                                ],
                                const SizedBox(height: 12),
                                Text('فیلترها را تغییر دهید یا عبارت دیگری جستجو کنید',
                                  style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.35)), textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : breeds.isEmpty
                      ? Center(
                          child: Text('نژادی یافت نشد',
                            style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.4)),
                          ),
                        )
                      : LayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount = constraints.maxWidth >= 500 ? 3 : 2;

                        return GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 14,
                            childAspectRatio: 0.58,
                          ),
                          itemCount: breeds.length,
                          itemBuilder: (context, index) {
                            final breed = breeds[index];
                            return _BreedGridCard(
                          breed: breed,
                          persianName: BreedRepository.persianNames[breed.name] ?? breed.name,
                          imagePath: BreedRepository.breedImages[breed.name],
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, _, _) => BreedDetailScreen(breed: breed),
                                transitionsBuilder: (_, animation, _, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                                transitionDuration: const Duration(milliseconds: 250),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        children: [
          Text(
            'نژادهای گربه',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          Text(
            '$count نژاد',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            hintText: 'جستجوی نژاد...',
            hintStyle: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 20,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          ),
          style: theme.textTheme.bodyLarge,
        ),
      ),
    );
  }

  Widget _buildFilters(ThemeData theme) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 22),
        itemCount: _filters.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final filter = _filters[index];
          final key = filter['key']!;
          final selected = _selectedFilters.contains(key);

          return FilterChip(
            selected: selected,
            showCheckmark: false,
            label: Text(filter['label']!),
            labelStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: selected
                  ? theme.colorScheme.onPrimaryContainer
                  : theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            selectedColor: theme.colorScheme.primaryContainer,
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            onSelected: (value) {
              setState(() {
                if (value) {
                  _selectedFilters.add(key);
                } else {
                  _selectedFilters.remove(key);
                }
              });
            },
          );
        },
      ),
    );
  }
}

class _BreedGridCard extends StatefulWidget {
  final CatBreed breed;
  final String persianName;
  final String? imagePath;
  final VoidCallback onTap;

  const _BreedGridCard({
    required this.breed,
    required this.persianName,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<_BreedGridCard> createState() => _BreedGridCardState();
}

class _BreedGridCardState extends State<_BreedGridCard> {
  final _service = FavoritesService();
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = _service.isFavorite(widget.breed.name);
    _service.addListener(_onChanged);
  }

  @override
  void dispose() {
    _service.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    setState(() => _isFavorite = _service.isFavorite(widget.breed.name));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final breed = widget.breed;

    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: theme.colorScheme.primary.withValues(alpha: 0.04),
        splashColor: theme.colorScheme.primary.withValues(alpha: 0.08),
        highlightColor: theme.colorScheme.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(20),
        child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [theme.colorScheme.surface, theme.colorScheme.surfaceContainerHighest],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 110,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (widget.imagePath != null)
                    Hero(
                      tag: 'breed-image-${breed.name}',
                      child: Image.asset(
                        widget.imagePath!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                          if (wasSynchronouslyLoaded) return child;
                          return AnimatedOpacity(
                            opacity: frame == null ? 0 : 1,
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.easeOut,
                            child: child,
                          );
                        },
                        errorBuilder: (_, _, _) => const BreedPlaceholder(iconSize: 40),
                      ),
                    )
                  else
                    const BreedPlaceholder(iconSize: 40),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => _service.toggle(breed.name),
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface.withValues(alpha: 0.85),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          size: 16,
                          color: _isFavorite ? theme.colorScheme.error : theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.persianName,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 1),
                  Text(
                    breed.name,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 12,
                        color: theme.colorScheme.primary.withValues(alpha: 0.6),
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          breed.origin,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                            fontSize: 11,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      breed.temperament.split(', ').first,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSecondaryContainer,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    breed.description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                      height: 1.35,
                      fontSize: 11,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
