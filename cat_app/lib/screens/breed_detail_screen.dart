import 'package:flutter/material.dart';

import '../models/cat_breed.dart';
import '../utils/app_images.dart';
import '../services/favorites_service.dart';

class BreedDetailScreen extends StatefulWidget {
  final CatBreed breed;

  const BreedDetailScreen({super.key, required this.breed});

  @override
  State<BreedDetailScreen> createState() => _BreedDetailScreenState();
}

class _BreedDetailScreenState extends State<BreedDetailScreen> {
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

  static const _extraInfo = <String, Map<String, String>>{
    'Persian': {
      'suitableForChildren': 'بله، بسیار آرام و مهربان',
      'activityLevel': 'کم',
      'healthIssues': 'مشکلات تنفسی، بیماری\u200Cهای چشمی، کلیه پلی\u200Cکیستیک',
      'nutrition': 'غذای خشک با کیفیت بالا، ۲ وعده در روز',
      'care': 'شانه زدن روزانه، تمیز کردن چشم\u200Cها، حمام ماهانه',
      'funFacts':
          'پرشین\u200Cها یکی از قدیمی\u200Cترین نژادهای گربه هستند و قدمت آنها به ایران باستان باز می\u200Cگردد.',
    },
    'Siamese': {
      'suitableForChildren': 'بله، اجتماعی و بازیگوش',
      'activityLevel': 'متوسط',
      'healthIssues': 'مشکلات تنفسی، بیماری\u200Cهای دندانی',
      'nutrition': 'غذای پرپروتئین، ۲ تا ۳ وعده کوچک در روز',
      'care': 'برس زدن هفتگی، تمیز کردن دندان\u200Cها',
      'funFacts':
          'سیامی\u200Cها به "گربه\u200Cهای سخنگو" معروف هستند و صدای بلند و خاصی دارند.',
    },
    'Maine Coon': {
      'suitableForChildren': 'بله، عالی برای خانواده',
      'activityLevel': 'متوسط',
      'healthIssues': 'دیسپلازی مفصل ران، کاردیومیوپاتی',
      'nutrition': 'غذای مخصوص نژادهای بزرگ، ۲ وعده در روز',
      'care': 'برس زدن ۲-۳ بار در هفته، کوتاه کردن ناخن\u200Cها',
      'funFacts':
          'مین کون بزرگترین نژاد گربه خانگی است و برخی از آنها به ۱۰ کیلوگرم هم می\u200Cرسند.',
    },
    'British Shorthair': {
      'suitableForChildren': 'بله، آرام و صبور',
      'activityLevel': 'کم',
      'healthIssues': 'چاقی، بیماری\u200Cهای قلبی',
      'nutrition': 'کنترل کالری، ۲ وعده در روز',
      'care': 'برس زدن هفتگی، کنترل وزن',
      'funFacts':
          'این نژاد الهام\u200Cبخش شخصیت گربه چشایر در داستان آلیس در سرزمین عجایب است.',
    },
    'Bengal': {
      'suitableForChildren': 'بله، پرانرژی و بازیگوش',
      'activityLevel': 'زیاد',
      'healthIssues': 'بیماری\u200Cهای کلیوی، مشکلات مفصلی',
      'nutrition': 'غذای پرپروتئین، ۲-۳ وعده در روز',
      'care': 'برس زدن هفتگی، بازی و فعالیت روزانه ضروری',
      'funFacts':
          'بنگال\u200Cها عاشق آب هستند و ممکن است با شما دوش بگیرند!',
    },
    'Scottish Fold': {
      'suitableForChildren': 'بله، آرام و سازگار',
      'activityLevel': 'کم تا متوسط',
      'healthIssues': 'آرتروز، مشکلات غضروفی',
      'nutrition': 'غذای تقویت\u200Cکننده مفاصل، ۲ وعده در روز',
      'care': 'برس زدن هفتگی، تمیز کردن گوش\u200Cها',
      'funFacts':
          'اسکاتیش فولدها به خاطر گوش\u200Cهای تا شده\u200Cشان معروف هستند و اغلب در حالت "بودا" می\u200Cنشینند.',
    },
    'Sphynx': {
      'suitableForChildren': 'بله، مهربان و اجتماعی',
      'activityLevel': 'زیاد',
      'healthIssues': 'مشکلات پوستی، حساسیت به دما',
      'nutrition': 'غذای پرکالری، ۳ وعده در روز',
      'care': 'حمام هفتگی، تمیز کردن پوست، محافظت از سرما',
      'funFacts':
          'اسفینکس\u200Cها با وجود نداشتن مو، دمای بدن بالاتری دارند و مانند یک بطری آب گرم هستند!',
    },
    'Ragdoll': {
      'suitableForChildren': 'بله، فوق\u200Cالعاده مهربان',
      'activityLevel': 'کم',
      'healthIssues': 'کاردیومیوپاتی، مشکلات ادراری',
      'nutrition': 'غذای با کیفیت، ۲ وعده در روز',
      'care': 'برس زدن ۲ بار در هفته، مراقبت از دندان\u200Cها',
      'funFacts':
          'رگدال\u200Cها وقتی بغل می\u200Cشوند کاملاً شل می\u200Cشوند، مثل یک عروسک پارچه\u200Cای!',
    },
    'Abyssinian': {
      'suitableForChildren': 'بله، ولی نیاز به توجه دارد',
      'activityLevel': 'زیاد',
      'healthIssues': 'بیماری\u200Cهای کلیوی، کم\u200Cخونی',
      'nutrition': 'غذای پرپروتئین، ۲ وعده در روز',
      'care': 'برس زدن هفتگی، بازی و فعالیت روزانه ضروری',
      'funFacts':
          'حبشی\u200Cها یکی از قدیمی\u200Cترین نژادهای جهان هستند و شبیه گربه\u200Cهای مصر باستان می\u200Cباشند.',
    },
    'Turkish Angora': {
      'suitableForChildren': 'بله، مهربان و بازیگوش',
      'activityLevel': 'متوسط',
      'healthIssues': 'ناشنوایی در گربه\u200Cهای سفید، بیماری\u200Cهای قلبی',
      'nutrition': 'غذای با کیفیت متعادل، ۲ وعده در روز',
      'care': 'برس زدن ۲ بار در هفته، مراقبت از چشم\u200Cها',
      'funFacts':
          'بسیاری از آنگوراهای ترکی چشمانی با دو رنگ متفاوت دارند که بسیار زیباست.',
    },
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final breed = widget.breed;
    final persianName = _persianNames[breed.name] ?? breed.name;
    final imagePath = _breedImages[breed.name];
    final extra = _extraInfo[breed.name] ?? {};

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          _buildHeader(theme, breed, persianName, imagePath),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 24, 22, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStatsRow(theme, breed),
                  const SizedBox(height: 28),
                  _buildSectionTitle(theme, 'شخصیت'),
                  const SizedBox(height: 12),
                  _buildPersonalityChips(theme, breed),
                  const SizedBox(height: 28),
                  _buildSectionTitle(theme, 'مشخصات'),
                  const SizedBox(height: 14),
                  _buildIndicators(theme, extra),
                  const SizedBox(height: 28),
                  _buildSectionTitle(theme, 'سلامت و تغذیه'),
                  const SizedBox(height: 14),
                  _buildInfoCard(
                    theme,
                    Icons.healing_rounded,
                    'مشکلات سلامتی',
                    extra['healthIssues'] ?? 'اطلاعات موجود نیست',
                  ),
                  const SizedBox(height: 12),
                  _buildInfoCard(
                    theme,
                    Icons.restaurant_rounded,
                    'تغذیه',
                    extra['nutrition'] ?? 'اطلاعات موجود نیست',
                  ),
                  const SizedBox(height: 12),
                  _buildInfoCard(
                    theme,
                    Icons.brush_rounded,
                    'نگهداری',
                    extra['care'] ?? 'اطلاعات موجود نیست',
                  ),
                  const SizedBox(height: 28),
                  if (extra['funFacts'] != null) ...[
                    _buildSectionTitle(theme, 'دانستنی\u200Cها'),
                    const SizedBox(height: 12),
                    _buildFunFactCard(theme, extra['funFacts']!),
                    const SizedBox(height: 28),
                  ],
                  _buildDescriptionCard(theme, breed.description, Icons.info_outline_rounded),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, CatBreed breed, String persianName, String? imagePath) {
    return SliverAppBar(
      expandedHeight: 280,
      pinned: true,
      backgroundColor: theme.colorScheme.surface,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.85),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
            ),
          ],
        ),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: theme.colorScheme.onSurface,
            size: 22,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.85),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              Icons.ios_share_rounded,
              color: theme.colorScheme.onSurface,
              size: 20,
            ),
            onPressed: () {},
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.85),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: _isFavorite ? Colors.red : theme.colorScheme.onSurface,
              size: 20,
            ),
            onPressed: () => _service.toggle(widget.breed.name),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (imagePath != null)
              Hero(
                tag: 'breed-image-${breed.name}',
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) return child;
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  },
                  errorBuilder: (_, _, _) => _buildHeaderPlaceholder(theme),
                ),
              )
            else
              _buildHeaderPlaceholder(theme),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 120,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      theme.colorScheme.surface.withValues(alpha: 0.95),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 22,
              right: 22,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    persianName,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    breed.name,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
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

  Widget _buildHeaderPlaceholder(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primaryContainer,
            theme.colorScheme.secondaryContainer,
          ],
        ),
      ),
      child: Center(
        child: Icon(
          Icons.pets_rounded,
          size: 80,
          color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.4),
        ),
      ),
    );
  }

  Widget _buildStatsRow(ThemeData theme, CatBreed breed) {
    return Row(
      children: [
        _buildStatChip(theme, Icons.location_on_outlined, breed.origin),
        const SizedBox(width: 10),
        _buildStatChip(theme, Icons.monitor_weight_outlined, breed.weight),
        const SizedBox(width: 10),
        _buildStatChip(theme, Icons.timeline_outlined, breed.lifeSpan),
      ],
    );
  }

  Widget _buildStatChip(ThemeData theme, IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: theme.colorScheme.primary),
            const SizedBox(height: 6),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 22,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 19,
          ),
        ),
      ],
    );
  }

  Widget _buildPersonalityChips(ThemeData theme, CatBreed breed) {
    final traits = breed.temperament.split(', ');

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: traits.map((trait) {
        return Chip(
          label: Text(
            trait,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          backgroundColor: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        );
      }).toList(),
    );
  }

  Widget _buildIndicators(ThemeData theme, Map<String, String> extra) {
    return Row(
      children: [
        Expanded(
          child: _buildIndicatorCard(
            theme,
            Icons.directions_run_rounded,
            'سطح انرژی',
            _energyLevel(extra['activityLevel']),
            theme.colorScheme.tertiary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildIndicatorCard(
            theme,
            Icons.child_care_rounded,
            'مناسب خانواده',
            _familyLevel(extra['suitableForChildren']),
            theme.colorScheme.secondary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildIndicatorCard(
            theme,
            Icons.brush_rounded,
            'نگهداری',
            _careLevel(extra['activityLevel']),
            theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  String _energyLevel(String? activity) {
    switch (activity) {
      case 'زیاد':
        return 'بالا';
      case 'متوسط':
        return 'متوسط';
      case 'کم':
        return 'پایین';
      default:
        return '--';
    }
  }

  String _familyLevel(String? suitable) {
    if (suitable == null) return '--';
    if (suitable.contains('عالی') || suitable.contains('فوق')) return 'عالی';
    if (suitable.contains('بله')) return 'خوب';
    return 'متوسط';
  }

  String _careLevel(String? activity) {
    switch (activity) {
      case 'زیاد':
        return 'متوسط';
      case 'متوسط':
        return 'کم';
      case 'کم':
        return 'آسان';
      default:
        return '--';
    }
  }

  Widget _buildIndicatorCard(
    ThemeData theme,
    IconData icon,
    String label,
    String value,
    Color accent,
  ) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.04),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              accent.withValues(alpha: 0.06),
              Colors.white,
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        child: Column(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, size: 22, color: accent),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: accent,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionCard(ThemeData theme, String text, IconData icon) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.04),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [theme.colorScheme.surface, theme.colorScheme.surfaceContainerHighest],
          ),
        ),
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, size: 22, color: theme.colorScheme.onPrimaryContainer),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                text,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  height: 1.7,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(ThemeData theme, IconData icon, String title, String content) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.04),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [theme.colorScheme.surface, theme.colorScheme.surfaceContainerHighest],
          ),
        ),
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, size: 20, color: theme.colorScheme.primary),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                height: 1.7,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFunFactCard(ThemeData theme, String fact) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.04),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.secondaryContainer.withValues(alpha: 0.5),
              Colors.white,
            ],
          ),
        ),
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                fact,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

