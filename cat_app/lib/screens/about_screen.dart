import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 22,
                        color: theme.colorScheme.onSurface,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    'درباره',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.pets_rounded,
                  size: 52,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'گربه\u200Cها',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: 34,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'مرجع جامع شناخت، نگهداری و سلامت گربه\u200Cها',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.auto_awesome_rounded,
                      size: 28,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 14),
                Text(
                  'ما به شما کمک می\u200Cکنیم تا بهترین همراه برای زندگی خود را انتخاب کنید و از او به بهترین شکل مراقبت کنید.',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                        height: 1.7,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              _buildSection(theme, 'اعتباردهی', [
                _buildCreditRow(theme, 'طراحی و توسعه', 'آهو'),
                _buildCreditRow(theme, 'محتوای آموزشی', 'تیم گربه\u200Cها'),
                _buildCreditRow(theme, 'راهنما', 'دامپزشکان متخصص'),
              ]),
              const SizedBox(height: 10),
              _buildInfoRow(theme, 'نسخه', '1.0.0'),
              const SizedBox(height: 10),
              _buildInfoRow(theme, 'پلتفرم', 'Android • iOS • Web'),
              const SizedBox(height: 40),
              Text(
                'ساخته شده با عشق به گربه\u200Cها ❤️',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(ThemeData theme, String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 0,
          shadowColor: Colors.black.withValues(alpha: 0.04),
          surfaceTintColor: Colors.transparent,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.antiAlias,
          child: Container(
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
            child: Column(children: children),
          ),
        ),
      ],
    );
  }

  Widget _buildCreditRow(ThemeData theme, String role, String name) {
    return ListTile(
      title: Text(name, style: theme.textTheme.bodyLarge),
      subtitle: Text(
        role,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
      ),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: theme.colorScheme.primaryContainer.withValues(alpha: 0.4),
        child: Icon(
          Icons.person_rounded,
          size: 18,
          color: theme.colorScheme.onPrimaryContainer,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildInfoRow(ThemeData theme, String label, String value) {
    return Card(
      elevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.04),
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Container(
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
        child: ListTile(
          title: Text(label, style: theme.textTheme.bodyLarge),
          trailing: Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
