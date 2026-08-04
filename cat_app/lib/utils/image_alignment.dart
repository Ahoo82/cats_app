import 'package:flutter/material.dart';

class ImageAlignment {
  ImageAlignment._();

  static const Map<String, Alignment> _alignments = {
    'Persian': Alignment(0, -1.0),
    'Siamese': Alignment(0, -0.30),
    'Maine Coon': Alignment(0, -0.96),
    'British Shorthair': Alignment(0, -0.65),
    'Bengal': Alignment(0, -0.76),
    'Scottish Fold': Alignment(0, -0.50),
    'Sphynx': Alignment(0, -0.69),
    'Domestic Shorthair': Alignment(0, -0.55),
    'Persian Chinchilla': Alignment(0, -0.82),
    'Turkish Angora': Alignment(0, -0.65),
    'Himalayan': Alignment(0, -0.65),
    'Exotic Shorthair': Alignment(0, -0.35),
  };

  static Alignment forBreed(String breedName) =>
      _alignments[breedName] ?? Alignment.center;
}
