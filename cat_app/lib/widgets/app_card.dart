import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final double elevation;
  final Color? shadowColor;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding,
    this.elevation = 0,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveShadow = shadowColor ?? Colors.black.withValues(alpha: 0.04);

    return Card(
      elevation: elevation,
      shadowColor: effectiveShadow,
      surfaceTintColor: Colors.transparent,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        hoverColor: onTap != null
            ? theme.colorScheme.primary.withValues(alpha: 0.04)
            : null,
        splashColor: onTap != null
            ? theme.colorScheme.primary.withValues(alpha: 0.08)
            : null,
        highlightColor: onTap != null
            ? theme.colorScheme.primary.withValues(alpha: 0.05)
            : null,
        borderRadius: BorderRadius.circular(20),
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
          padding: padding ?? const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}
