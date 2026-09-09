import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_images.dart';
import '../utils/image_alignment.dart';
import '../models/cat_breed.dart';
import 'breeds_screen.dart';
import 'breed_detail_screen.dart';
import 'article_detail_screen.dart';
import 'favorites_screen.dart';
import 'settings_screen.dart';
import '../services/favorites_service.dart';
import '../widgets/breed_placeholder.dart';
import '../config/brand_config.dart';
import 'category_screen.dart';
import 'search_screen.dart';
import 'placeholder_screen.dart';
import '../models/article.dart';
import '../data/article_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _categories = <Map<String, Object>>[
    {
      'icon': Icons.pets_rounded,
      'title': 'نژادها',
      'desc': 'آشنایی با انواع نژادهای گربه',
    },
    {
      'icon': Icons.restaurant_rounded,
      'title': 'تغذیه',
      'desc': 'رژیم غذایی و غذاهای مناسب',
    },
    {
      'icon': Icons.medical_services_rounded,
      'title': 'سلامت',
      'desc': 'بیماری\u200Cها، واکسن و مراقبت',
    },
    {
      'icon': Icons.school_rounded,
      'title': 'آموزش',
      'desc': 'رفتار و تربیت گربه',
    },
    {
      'icon': Icons.sports_esports_rounded,
      'title': 'سرگرمی',
      'desc': 'بازی و فعالیت\u200Cهای روزانه',
    },
    {
      'icon': Icons.vaccines_rounded,
      'title': 'واکسن و پزشکی',
      'desc': 'واکسیناسیون و مراقبت\u200Cهای پزشکی',
    },
  ];
  static const _popularBreeds = <Map<String, Object>>[
    {
      'name': 'Persian',
      'origin': 'Iran (Persia)',
      'image': AppImages.persian,
      'temperament': 'آرام',
    },
    {
      'name': 'British Shorthair',
      'origin': 'United Kingdom',
      'image': AppImages.britishShorthair,
      'temperament': 'خونسرد',
    },
    {
      'name': 'Maine Coon',
      'origin': 'United States',
      'image': AppImages.maineCoon,
      'temperament': 'مهربان',
    },
    {
      'name': 'Scottish Fold',
      'origin': 'Scotland',
      'image': AppImages.scottishFold,
      'temperament': 'شیرین',
    },
    {
      'name': 'Siamese',
      'origin': 'Thailand',
      'image': AppImages.siamese,
      'temperament': 'باهوش',
    },
    {
      'name': 'Ragdoll',
      'origin': 'United States',
      'image': AppImages.ragdoll,
      'temperament': 'مهربان',
    },
  ];

  static void _navigateToCategory(BuildContext context, int index) {
    Widget page;

    switch (index) {
      case 0:
        page = const BreedsScreen();
      case 1:
        page = const CategoryScreen(
          icon: Icons.restaurant_rounded,
          title: 'تغذیه',
          subtitle:
              'هر آنچه باید درباره غذای گربه بدانید؛ از تغذیه بچه\u200Cگربه تا رژیم غذایی گربه بالغ و غذاهای ممنوع.',
          featuredArticle: ArticleRepository.nutritionFeatured,
          articles: ArticleRepository.nutritionArticles,
        );
      case 2:
        page = const CategoryScreen(
          icon: Icons.medical_services_rounded,
          title: 'سلامت',
          subtitle:
              'راهنمای جامع حفظ سلامت گربه؛ از معاینات دوره\u200Cای تا تشخیص علائم بیماری\u200Cهای شایع.',
          featuredArticle: ArticleRepository.healthFeatured,
          articles: ArticleRepository.healthArticles,
        );
      case 3:
        page = const CategoryScreen(
          icon: Icons.school_rounded,
          title: 'آموزش',
          subtitle:
              'همه\u200Cچیز درباره تربیت گربه؛ از آموزش دستشویی تا اصلاح رفتارهای ناخواسته و ترفندهای جذاب.',
          featuredArticle: ArticleRepository.trainingFeatured,
          articles: ArticleRepository.trainingArticles,
        );
      case 4:
        page = const CategoryScreen(
          icon: Icons.sports_esports_rounded,
          title: 'سرگرمی',
          subtitle:
              'ایده\u200Cهای خلاقانه برای سرگرم کردن گربه؛ از اسباب\u200Cبازی\u200Cهای دست\u200Cساز تا بازی\u200Cهای تعاملی.',
          featuredArticle: ArticleRepository.entertainmentFeatured,
          articles: ArticleRepository.entertainmentArticles,
        );
      default:
        page = const CategoryScreen(
          icon: Icons.vaccines_rounded,
          title: 'واکسن و پزشکی',
          subtitle:
              'برنامه کامل واکسیناسیون گربه و راهنمای مراقبت\u200Cهای پزشکی پیشگیرانه برای حفظ سلامت.',
          featuredArticle: ArticleRepository.vaccinationFeatured,
          articles: ArticleRepository.vaccinationArticles,
        );
    }

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, _, _) => page,
        transitionsBuilder: (_, animation, _, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 250),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 28),
                  _WelcomeSection(theme: theme),
                  const SizedBox(height: 24),
                  _SearchBar(theme: theme),
                  const SizedBox(height: 32),
                  Text(
                    'دسته\u200Cبندی\u200Cها',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 18),
                  _CategoryGrid(categories: _categories),
                  const SizedBox(height: 36),
                  _TipOfTheDay(theme: theme),
                  const SizedBox(height: 36),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, _, _) => const BreedsScreen(),
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
                    hoverColor: theme.colorScheme.onSurface.withValues(
                      alpha: 0.03,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Text(
                            'نژادهای محبوب',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _PopularBreedsList(theme: theme, breeds: _popularBreeds),
                  const SizedBox(height: 36),
                  Text(
                    'مطالب جدید',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _LatestArticles(theme: theme),
                  const SizedBox(height: 36),
                  _DidYouKnow(theme: theme),
                  const SizedBox(height: 110),
                ],
              ),
            ),
            Positioned(
              left: 22,
              right: 22,
              bottom: 12,
              child: _FloatingNavBar(theme: theme),
            ),
          ],
        ),
      ),
    );
  }
}

class _WelcomeSection extends StatelessWidget {
  final ThemeData theme;

  const _WelcomeSection({required this.theme});

  static const _heroStyle = TextStyle(
    fontSize: 46,
    fontWeight: FontWeight.w800,
    height: 1.1,
    letterSpacing: -1.2,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          BrandConfig.appName,
          style: _heroStyle.copyWith(color: theme.colorScheme.primary),
        ),
        const SizedBox(height: 10),
        Text(
          BrandConfig.subtitle,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.primaryContainer,
                theme.colorScheme.secondaryContainer,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Stack(
            children: [
              Positioned(
                top: -30,
                right: -20,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.06),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                bottom: -20,
                left: 40,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withValues(alpha: 0.08),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withValues(
                            alpha: 0.1,
                          ),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.pets_rounded,
                      size: 36,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: Text(
                      BrandConfig.heroTagline,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onPrimaryContainer,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  final ThemeData theme;

  const _SearchBar({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'جستجو',
      hint: 'جستجوی نژاد، بیماری، غذا',
      child: Container(
        height: 52,
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
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, _, _) => const SearchScreen(),
                  transitionsBuilder: (_, animation, _, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 250),
                ),
              );
            },
            hoverColor: theme.colorScheme.onSurface.withValues(alpha: 0.03),
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Icon(
                    Icons.search_rounded,
                    size: 22,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'جستجوی نژاد، بیماری، غذا...',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.35,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Icon(
                    Icons.mic_none_rounded,
                    size: 22,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  final List<Map<String, Object>> categories;

  const _CategoryGrid({required this.categories});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth >= 500 ? 3 : 2;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.56,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) => _CategoryCard(
            icon: categories[index]['icon'] as IconData,
            title: categories[index]['title'] as String,
            description: categories[index]['desc'] as String,
            onTap: () => HomeScreen._navigateToCategory(context, index),
          ),
        );
      },
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onTap;

  const _CategoryCard({
    required this.icon,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        hoverColor: theme.colorScheme.primary.withValues(alpha: 0.05),
        splashColor: theme.colorScheme.primary.withValues(alpha: 0.1),
        highlightColor: theme.colorScheme.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.surface,
                theme.colorScheme.surfaceContainerHighest,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withValues(
                      alpha: 0.55,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 24,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _CategoryTitle(title: title, theme: theme),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Category-card title with a defensive fit: multi-word titles (e.g.
/// "واکسن و پزشکی") wrap naturally at the whitespace boundary as normal.
/// A single unbreakable word that is still slightly too wide for the card
/// is shrunk to fit via [FittedBox] instead of being split
/// character-by-character — this only engages when actually needed, it is
/// not the normal rendering path.
class _CategoryTitle extends StatelessWidget {
  final String title;
  final ThemeData theme;

  const _CategoryTitle({required this.title, required this.theme});

  @override
  Widget build(BuildContext context) {
    final style = theme.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.w700,
      height: 1.2,
    );

    if (title.contains(' ')) {
      return Text(
        title,
        style: style,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );
    }

    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(title, style: style, maxLines: 1, softWrap: false),
    );
  }
}

class _PopularBreedsList extends StatelessWidget {
  final ThemeData theme;
  final List<Map<String, Object>> breeds;

  const _PopularBreedsList({required this.theme, required this.breeds});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 268,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: breeds.length,
        separatorBuilder: (_, _) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final breed = breeds[index];
          final name = breed['name'] as String;
          final catBreed = catBreeds.firstWhere((b) => b.name == name);
          return _BreedCard(
            name: name,
            origin: breed['origin'] as String,
            image: breed['image'] as String,
            temperament: breed['temperament'] as String,
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, _, _) => BreedDetailScreen(breed: catBreed),
                  transitionsBuilder: (_, animation, _, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 250),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _BreedCard extends StatefulWidget {
  final String name;
  final String origin;
  final String image;
  final String temperament;
  final VoidCallback? onTap;

  const _BreedCard({
    required this.name,
    required this.origin,
    required this.image,
    required this.temperament,
    this.onTap,
  });

  @override
  State<_BreedCard> createState() => _BreedCardState();
}

class _BreedCardState extends State<_BreedCard> {
  final _service = FavoritesService();
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = _service.isFavorite(widget.name);
    _service.addListener(_onChanged);
  }

  @override
  void dispose() {
    _service.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    setState(() => _isFavorite = _service.isFavorite(widget.name));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.07),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: 175,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(
                aspectRatio: 3 / 2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                        alignment: ImageAlignment.forBreed(widget.name),
                        frameBuilder:
                            (context, child, frame, wasSynchronouslyLoaded) {
                              if (wasSynchronouslyLoaded) return child;
                              return AnimatedOpacity(
                                opacity: frame == null ? 0 : 1,
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.easeOut,
                                child: child,
                              );
                            },
                        errorBuilder: (_, _, _) => const BreedPlaceholder(),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface.withValues(
                            alpha: 0.85,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Semantics(
                          button: true,
                          selected: _isFavorite,
                          label: _isFavorite
                              ? 'حذف از علاقه\u200Cمندی'
                              : 'افزودن به علاقه\u200Cمندی',
                          child: Material(
                            color: Colors.transparent,
                            shape: const CircleBorder(),
                            clipBehavior: Clip.antiAlias,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              onTap: () => _service.toggle(widget.name),
                              child: Center(
                                child: Icon(
                                  _isFavorite
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_border_rounded,
                                  size: 18,
                                  color: _isFavorite
                                      ? theme.colorScheme.error
                                      : theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 14,
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.4,
                          ),
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            widget.origin,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.5,
                              ),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        widget.temperament,
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSecondaryContainer,
                        ),
                      ),
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

class _TipOfTheDay extends StatelessWidget {
  final ThemeData theme;

  const _TipOfTheDay({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.05),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.12),
            width: 1,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.primaryContainer.withValues(alpha: 0.35),
              theme.colorScheme.surface,
            ],
          ),
        ),
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.lightbulb_outline_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'نکته امروز',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'برای حفظ سلامت گربه، حداقل سالی یک\u200Cبار او را برای چکاپ کامل نزد دامپزشک ببرید.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: 0.65,
                      ),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LatestArticles extends StatelessWidget {
  final ThemeData theme;

  const _LatestArticles({required this.theme});

  static const _articles = [
    {
      'title': 'بهترین نژادهای گربه برای آپارتمان',
      'summary':
          'اگر در آپارتمان زندگی می\u200Cکنید، این نژادها مناسب\u200Cترین گزینه برای شما هستند.',
      'time': '۵ دقیقه',
      'icon': Icons.apartment_rounded,
    },
    {
      'title': 'راهنمای کامل تغذیه گربه',
      'summary':
          'با شناخت نیازهای غذایی گربه خود در هر سن، سلامت و طول عمر او را تضمین کنید.',
      'time': '۸ دقیقه',
      'icon': Icons.restaurant_menu_rounded,
    },
    {
      'title': 'علائم هشداردهنده در گربه‌ها',
      'summary':
          'با شناخت این علائم می‌توانید بیماری را زود تشخیص دهید و از مشکلات جدی جلوگیری کنید.',
      'time': '۱۰ دقیقه',
      'icon': Icons.medical_services_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = this.theme;

    return Column(
      children: _articles.map((article) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: _ArticleCard(
            icon: article['icon'] as IconData,
            title: article['title'] as String,
            summary: article['summary'] as String,
            time: article['time'] as String,
            theme: theme,
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, _, _) => ArticleDetailScreen(
                    article: article['icon'] == Icons.medical_services_rounded
                        ? ArticleRepository.healthFeatured
                        : article['icon'] == Icons.restaurant_menu_rounded
                        ? ArticleRepository.nutritionFeatured
                        : Article(
                            title: article['title'] as String,
                            summary: article['summary'] as String,
                            readingTime: article['time'] as String,
                          ),
                  ),
                  transitionsBuilder: (_, animation, _, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  transitionDuration: const Duration(milliseconds: 250),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}

class _ArticleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String summary;
  final String time;
  final ThemeData theme;
  final VoidCallback? onTap;

  const _ArticleCard({
    required this.icon,
    required this.title,
    required this.summary,
    required this.time,
    required this.theme,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.06),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                theme.colorScheme.surface,
                theme.colorScheme.surfaceContainerHighest,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withValues(
                      alpha: 0.45,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 28,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        summary,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.5,
                          ),
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              size: 12,
                              color: theme.colorScheme.onSurface.withValues(
                                alpha: 0.45,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              time,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.45,
                                ),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.chevron_left_rounded,
                  size: 20,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DidYouKnow extends StatelessWidget {
  final ThemeData theme;

  const _DidYouKnow({required this.theme});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.05),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.secondaryContainer.withValues(alpha: 0.5),
              theme.colorScheme.surface,
            ],
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.emoji_objects_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'آیا می\u200Cدانستید؟',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              'گربه\u200Cها می\u200Cتوانند بیش از ۱۰۰ صدای مختلف تولید کنند، در حالی که سگ\u200Cها تنها قادر به تولید حدود ۱۰ صدای مختلف هستند. گربه\u200Cها میو میو کردن را منحصراً برای ارتباط با انسان\u200Cها استفاده می\u200Cکنند.',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FloatingNavBar extends StatefulWidget {
  final ThemeData theme;

  const _FloatingNavBar({required this.theme});

  @override
  State<_FloatingNavBar> createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<_FloatingNavBar> {
  int _selectedIndex = 0;

  static const _items = <Map<String, Object>>[
    {'icon': Icons.home_rounded, 'label': 'خانه'},
    {'icon': Icons.pets_rounded, 'label': 'نژادها'},
    {'icon': Icons.search_rounded, 'label': 'جستجو'},
    {'icon': Icons.lightbulb_rounded, 'label': 'دانستنی\u200Cها'},
    {'icon': Icons.favorite_rounded, 'label': 'علاقه\u200Cمندی'},
    {'icon': Icons.person_rounded, 'label': 'پروفایل'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withValues(alpha: 0.75),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Row(
            children: List.generate(_items.length, (index) {
              final isSelected = _selectedIndex == index;
              return Expanded(
                child: _NavItem(
                  key: ValueKey(index),
                  icon: _items[index]['icon'] as IconData,
                  label: _items[index]['label'] as String,
                  isSelected: isSelected,
                  theme: theme,
                  onTap: () {
                    setState(() => _selectedIndex = index);
                    if (index == 1) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, _, _) => const BreedsScreen(),
                          transitionsBuilder: (_, animation, _, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 250),
                        ),
                      );
                    } else if (index == 3) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, _, _) => const PlaceholderScreen(
                            icon: Icons.lightbulb_rounded,
                            title: 'دانستنی\u200Cها',
                            description:
                                'حقایق جالب، نکات آموزشی و اطلاعات مفید درباره گربه\u200Cها به زودی در این بخش قرار می\u200Cگیرد.',
                          ),
                          transitionsBuilder: (_, animation, _, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 250),
                        ),
                      );
                    } else if (index == 2) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, _, _) => const SearchScreen(),
                          transitionsBuilder: (_, animation, _, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 250),
                        ),
                      );
                    } else if (index == 4) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, _, _) => const FavoritesScreen(),
                          transitionsBuilder: (_, animation, _, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 250),
                        ),
                      );
                    } else if (index == 5) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, _, _) => const SettingsScreen(),
                          transitionsBuilder: (_, animation, _, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 250),
                        ),
                      );
                    }
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final ThemeData theme;
  final VoidCallback onTap;

  const _NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.theme,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurface.withValues(alpha: 0.4);

    return Semantics(
      button: true,
      selected: isSelected,
      label: label,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? theme.colorScheme.primaryContainer.withValues(alpha: 0.5)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 22, color: color),
                const SizedBox(height: 4),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    label,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: isSelected
                          ? FontWeight.w700
                          : FontWeight.w500,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
