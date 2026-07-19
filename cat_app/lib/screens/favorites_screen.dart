import 'package:flutter/material.dart';

import '../models/cat_breed.dart';
import '../services/favorites_service.dart';
import '../widgets/breed_placeholder.dart';
import '../utils/app_images.dart';
import 'breed_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final _service = FavoritesService();

  static const _persianNames = <String, String>{
    'Persian': 'پرشین',
    'Siamese': 'سیامی',
    'Maine Coon': 'مین کون',
    'British Shorthair': 'بریتیش شورت\u200Cهیر',
    'Bengal': 'بنگال',
    'Scottish Fold': 'اسکاتیش فولد',
    'Sphynx': 'اسفینکس',
    'Ragdoll': 'رگدال',
    'Abyssinian': 'حبشی',
    'Turkish Angora': 'آنگورای ترکی',
  };

  static const _breedImages = <String, String>{
    'Persian': AppImages.persian,
    'Siamese': AppImages.siamese,
    'Maine Coon': AppImages.maineCoon,
    'British Shorthair': AppImages.britishShorthair,
    'Scottish Fold': AppImages.scottishFold,
    'Ragdoll': AppImages.ragdoll,
  };

  @override
  void initState() {
    super.initState();
    _service.addListener(_onChanged);
  }

  @override
  void dispose() {
    _service.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() => setState(() {});

  List<CatBreed> get _favoriteBreeds {
    final favorites = _service.favorites;
    return catBreeds.where((b) => favorites.contains(b.name)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final breeds = _favoriteBreeds;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                'علاقه\u200Cمندی\u200Cها',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: breeds.isEmpty
                  ? Expanded(
                      key: const ValueKey('empty'),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Icon(
                                Icons.favorite_border_rounded,
                                size: 36,
                                color: theme.colorScheme.primary.withValues(alpha: 0.5),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'هنوز علاقه\u200Cمندی نداری',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'با زدن دکمه قلب، نژادهای مورد علاقه\u200Cات رو ذخیره کن',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Expanded(
                      key: const ValueKey('grid'),
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 14,
                          crossAxisSpacing: 14,
                          childAspectRatio: 0.58,
                        ),
                        itemCount: breeds.length,
                        itemBuilder: (context, index) {
                          final breed = breeds[index];
                          return _FavoriteBreedCard(
                            breed: breed,
                            persianName: _persianNames[breed.name] ?? breed.name,
                            imagePath: _breedImages[breed.name],
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
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteBreedCard extends StatelessWidget {
  final CatBreed breed;
  final String persianName;
  final String? imagePath;
  final VoidCallback onTap;

  const _FavoriteBreedCard({
    required this.breed,
    required this.persianName,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
        onTap: onTap,
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
                child: imagePath != null
                    ? Hero(
                        tag: 'fav-breed-${breed.name}',
                        child: Image.asset(
                          imagePath!,
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
                    : const BreedPlaceholder(iconSize: 40),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
                child: Text(
                  persianName,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
