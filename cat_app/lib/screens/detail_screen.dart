import 'package:flutter/material.dart';
import '../models/cat_breed.dart';

class DetailScreen extends StatelessWidget {
  final CatBreed breed;

  const DetailScreen({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Text(
                  _getBreedEmoji(breed.name),
                  style: const TextStyle(fontSize: 44),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              breed.name,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.public, size: 16, color: theme.colorScheme.primary),
                const SizedBox(width: 4),
                Text(
                  'Origin: ${breed.origin}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoCard(theme, Icons.favorite, 'Temperament', breed.temperament),
            const SizedBox(height: 12),
            _buildInfoCard(theme, Icons.description, 'Description', breed.description),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildInfoCard(theme, Icons.timeline, 'Life Span', breed.lifeSpan),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildInfoCard(theme, Icons.monitor_weight, 'Weight', breed.weight),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildInfoCard(theme, Icons.style, 'Coat Type', breed.coatType),
            const SizedBox(height: 12),
            Text(
              'Coat Colors',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: breed.colors.map((color) {
                return Chip(
                  label: Text(color),
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  side: BorderSide(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(ThemeData theme, IconData icon, String title, String content) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 18, color: theme.colorScheme.primary),
                const SizedBox(width: 6),
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(content, style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }

  String _getBreedEmoji(String name) {
    switch (name) {
      case 'Persian':
        return '👑';
      case 'Siamese':
        return '💎';
      case 'Maine Coon':
        return '🦁';
      case 'British Shorthair':
        return '🎩';
      case 'Bengal':
        return '🐆';
      case 'Scottish Fold':
        return '🦉';
      case 'Sphynx':
        return '👽';
      case 'Ragdoll':
        return '🧸';
      case 'Abyssinian':
        return '🏺';
      case 'Turkish Angora':
        return '✨';
      default:
        return '🐱';
    }
  }
}
