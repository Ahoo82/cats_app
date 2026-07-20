import '../utils/app_images.dart';

class AppData {
  AppData._();

  static const persianNames = <String, String>{
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

  static const breedImages = <String, String>{
    'Persian': AppImages.persian,
    'Siamese': AppImages.siamese,
    'Maine Coon': AppImages.maineCoon,
    'British Shorthair': AppImages.britishShorthair,
    'Scottish Fold': AppImages.scottishFold,
    'Ragdoll': AppImages.ragdoll,
  };
}
