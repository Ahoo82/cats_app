import 'package:flutter/material.dart';

class BreedPlaceholder extends StatefulWidget {
  final double iconSize;

  const BreedPlaceholder({super.key, this.iconSize = 48});

  @override
  State<BreedPlaceholder> createState() => _BreedPlaceholderState();
}

class _BreedPlaceholderState extends State<BreedPlaceholder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
    )..repeat(reverse: true);

    _pulse = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primaryContainer.withValues(alpha: 0.7),
            theme.colorScheme.secondaryContainer.withValues(alpha: 0.5),
          ],
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            top: -20,
            right: -10,
            child: _DecoCircle(size: 80),
          ),
          const Positioned(
            bottom: 10,
            left: -15,
            child: _DecoCircle(size: 60),
          ),
          Center(
            child: AnimatedBuilder(
              animation: _pulse,
              builder: (context, child) => Transform.scale(
                scale: _pulse.value,
                child: child,
              ),
              child: Container(
                width: widget.iconSize + 16,
                height: widget.iconSize + 16,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.08),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.pets_rounded,
                  size: widget.iconSize,
                  color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.35),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DecoCircle extends StatelessWidget {
  final double size;

  const _DecoCircle({required this.size});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: size > 70
            ? theme.colorScheme.primary.withValues(alpha: 0.08)
            : theme.colorScheme.secondary.withValues(alpha: 0.08),
        shape: BoxShape.circle,
      ),
    );
  }
}
