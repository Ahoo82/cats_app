import 'dart:ui';

import 'package:flutter/material.dart';

import '../utils/app_images.dart';
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
import '../models/article.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _categories = <Map<String, Object>>[
    {'icon': Icons.pets_rounded, 'title': 'نژادها', 'desc': 'آشنایی با انواع نژادهای گربه'},
    {'icon': Icons.restaurant_rounded, 'title': 'تغذیه', 'desc': 'رژیم غذایی و غذاهای مناسب'},
    {'icon': Icons.medical_services_rounded, 'title': 'سلامت', 'desc': 'بیماری\u200Cها، واکسن و مراقبت'},
    {'icon': Icons.school_rounded, 'title': 'آموزش', 'desc': 'رفتار و تربیت گربه'},
    {'icon': Icons.sports_esports_rounded, 'title': 'سرگرمی', 'desc': 'بازی و فعالیت\u200Cهای روزانه'},
    {'icon': Icons.vaccines_rounded, 'title': 'واکسن و پزشکی', 'desc': 'واکسیناسیون و مراقبت\u200Cهای پزشکی'},
  ];
  static const _popularBreeds = <Map<String, Object>>[
    {'name': 'Persian', 'origin': 'Iran (Persia)', 'image': AppImages.persian, 'temperament': 'آرام'},
    {'name': 'British Shorthair', 'origin': 'United Kingdom', 'image': AppImages.britishShorthair, 'temperament': 'خونسرد'},
    {'name': 'Maine Coon', 'origin': 'United States', 'image': AppImages.maineCoon, 'temperament': 'مهربان'},
    {'name': 'Scottish Fold', 'origin': 'Scotland', 'image': AppImages.scottishFold, 'temperament': 'شیرین'},
    {'name': 'Siamese', 'origin': 'Thailand', 'image': AppImages.siamese, 'temperament': 'باهوش'},
    {'name': 'Ragdoll', 'origin': 'United States', 'image': AppImages.ragdoll, 'temperament': 'مهربان'},
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
          subtitle: 'هر آنچه باید درباره غذای گربه بدانید؛ از تغذیه بچه\u200Cگربه تا رژیم غذایی گربه بالغ و غذاهای ممنوع.',
          featuredArticle: Article(
            title: 'راهنمای کامل تغذیه گربه',
            summary: 'با شناخت نیازهای غذایی گربه خود در هر سن، سلامت و طول عمر او را تضمین کنید.',
            readingTime: '۸ دقیقه',
            icon: 'restaurant',
            sections: [
              ArticleSection(heading: 'گربه\u200Cها چه می\u200Cخورند؟', body: 'گربه\u200Cها گوشت\u200Cخواران اجباری هستند، یعنی برای زنده ماندن به مواد مغذی موجود در بافت\u200Cهای حیوانی نیاز دارند. برخلاف سگ\u200Cها، گربه\u200Cها نمی\u200Cتوانند گیاه\u200Cخوار یا حتی همه\u200Cچیزخوار باشند.'),
              ArticleSection(heading: 'نیازهای غذایی اصلی', type: 'bullets', bullets: ['پروتئین حیوانی (حداقل ۳۰٪ از رژیم غذایی)', 'چربی\u200Cهای سالم (اسیدهای چرب امگا ۳ و ۶)', 'تائورین (آمینواسید حیاتی برای قلب و چشم)', 'ویتامین\u200Cهای A، D، E و گروه B', 'مواد معدنی (کلسیم، فسفر، منیزیم)']),
              ArticleSection(type: 'warning', heading: 'هشدار', body: 'هرگز به گربه خود شکلات، پیاز، سیر، انگور، کشمش، آووکادو، قهوه یا الکل ندهید. این مواد برای گربه سمی و حتی کشنده هستند.'),
              ArticleSection(heading: 'غذای خشک یا کنسروی؟', body: 'هر دو گزینه می\u200Cتوانند مناسب باشند. غذای خشک برای سلامت دندان مفید است و نگهداری آسان\u200Cتری دارد. غذای کنسروی رطوبت بیشتری دارد و برای گربه\u200Cهایی که آب کم می\u200Cنوشند مناسب\u200Cتر است. ترکیبی از هر دو ایده\u200Cآل است.'),
              ArticleSection(type: 'tip', heading: 'نکته طلایی', body: 'همیشه آب تازه و تمیز در کنار غذای گربه قرار دهید. بهترین کار استفاده از آبنمای مخصوص است — گربه\u200Cها آب جاری را به آب راکد ترجیح می\u200Cدهند.'),
              ArticleSection(heading: 'برنامه غذایی بر اساس سن', body: 'بچه\u200Cگربه\u200Cها (تا ۶ ماه): ۳-۴ وعده کوچک در روز با غذای مخصوص بچه\u200Cگربه. گربه\u200Cهای بالغ (۱-۷ سال): ۲ وعده در روز. گربه\u200Cهای مسن (۷+ سال): غذای کم\u200Cکالری با ۲ وعده.'),
              ArticleSection(type: 'relatedBreeds', heading: 'نژادهای مرتبط', bullets: ['Persian', 'British Shorthair', 'Maine Coon', 'Siamese']),
              ArticleSection(type: 'source', heading: 'منبع', body: 'انجمن دامپزشکی ایران — راهنمای تغذیه گربه\u200Cهای خانگی'),
            ],
          ),
          articles: [
            Article(title: 'بهترین غذاهای خشک برای گربه', summary: 'راهنمای انتخاب غذای خشک با کیفیت و مناسب', readingTime: '۸ دقیقه', icon: 'food', content: 'غذای خشک محبوب\u200Cترین گزینه برای تغذیه گربه است. پروتئین حیوانی باید حداقل ۳۰٪ باشد. از غذاهای حاوی غلات زیاد خودداری کنید. همیشه آب تازه در کنار غذا قرار دهید.'),
            Article(title: 'غذاهای خانگی مجاز برای گربه', summary: 'چه غذاهایی را می\u200Cتوانید در خانه تهیه کنید', readingTime: '۶ دقیقه', icon: 'food', content: 'مرغ آب\u200Cپز، ماهی تن، تخم\u200Cمرغ پخته و برنج ساده گزینه\u200Cهای مناسبی هستند. هرگز پیاز، سیر، شکلات، انگور و آووکادو ندهید. تغذیه خانگی نباید جایگزین کامل غذای مخصوص باشد.'),
            Article(title: 'چه غذاهایی برای گربه سمی است؟', summary: 'لیست غذاهای خطرناک و کشنده برای گربه', readingTime: '۵ دقیقه', icon: 'food', content: 'شکلات، پیاز، سیر، انگور، کشمش، آووکادو، قهوه و الکل برای گربه سمی هستند. علائم مسمومیت: استفراغ، اسهال، بی\u200Cحالی. در صورت مشاهده فوراً به دامپزشک مراجعه کنید.'),
            Article(title: 'برنامه غذایی بچه\u200Cگربه', summary: 'راهنمای تغذیه از شیرخوارگی تا یک سالگی', readingTime: '۷ دقیقه', icon: 'food', content: 'بچه\u200Cگربه\u200Cها از ۴ هفتگی می\u200Cتوانند غذای جامد بخورند. غذای مخصوص بچه\u200Cگربه پروتئین و کالری بیشتری دارد. تا ۶ ماهگی ۳-۴ وعده کوچک در روز و بعد از آن ۲-۳ وعده کافی است.'),
            Article(title: 'آب و اهمیت هیدراتاسیون', summary: 'چرا آب تازه برای گربه حیاتی است', readingTime: '۴ دقیقه', icon: 'food', content: 'گربه\u200Cها ذاتاً کم\u200Cآب می\u200Cنوشند. از آبنمای مخصوص استفاده کنید — گربه\u200Cها آب جاری را ترجیح می\u200Cدهند. غذای تر (کنسرو) به تأمین آب بدن کمک می\u200Cکند. کم\u200Cآبی می\u200Cتواند باعث مشکلات کلیوی شود.'),
          ],
        );
      case 2:
        page = const CategoryScreen(
          icon: Icons.medical_services_rounded,
          title: 'سلامت',
          subtitle: 'راهنمای جامع حفظ سلامت گربه؛ از معاینات دوره\u200Cای تا تشخیص علائم بیماری\u200Cهای شایع.',
          featuredArticle: Article(
            title: 'علائم هشداردهنده در گربه\u200Cها',
            summary: 'با شناخت این علائم می\u200Cتوانید بیماری را زود تشخیص دهید و از مشکلات جدی جلوگیری کنید.',
            readingTime: '۱۰ دقیقه',
            icon: 'health',
            sections: [
              ArticleSection(heading: 'چرا تشخیص زودهنگام مهم است؟', body: 'گربه\u200Cها در پنهان کردن بیماری استاد هستند. در طبیعت، نشان دادن ضعف یعنی شکار شدن. به همین دلیل گربه\u200Cها علائم بیماری را تا جایی که ممکن است پنهان می\u200Cکنند.'),
              ArticleSection(type: 'warning', heading: 'علائم نیازمند مراجعه فوری', body: 'اگر گربه شما استفراغ مکرر، اسهال شدید، تنگی نفس، تشنج، یا بی\u200Cحالی شدید دارد، فوراً به دامپزشک مراجعه کنید.'),
              ArticleSection(heading: 'علائمی که نباید نادیده بگیرید', type: 'bullets', bullets: ['تغییر ناگهانی در اشتها یا کاهش وزن', 'تغییر در عادات دستشویی', 'استفراغ یا اسهال', 'سرفه، عطسه یا ترشحات بینی', 'خارش یا ریزش موی غیرعادی', 'تغییر رفتار (پرخاشگری یا گوشه\u200Cگیری)']),
              ArticleSection(type: 'tip', heading: 'نکته مهم', body: 'وزن گربه خود را هر ماه یادداشت کنید. کاهش یا افزایش ناگهانی وزن یکی از اولین نشانه\u200Cهای بسیاری از بیماری\u200Cهاست.'),
              ArticleSection(type: 'image', heading: 'نمودار علائم حیاتی گربه'),
              ArticleSection(type: 'relatedBreeds', heading: 'نژادهای حساس', bullets: ['Persian', 'Scottish Fold', 'Sphynx']),
              ArticleSection(type: 'source', heading: 'منبع', body: 'راهنمای بالینی دامپزشکی — علائم و نشانه\u200Cهای بیماری در گربه\u200Cهای خانگی'),
            ],
          ),
          articles: [
            Article(title: 'واکسن\u200Cهای ضروری گربه', summary: 'برنامه کامل واکسیناسیون برای گربه', readingTime: '۶ دقیقه', icon: 'health', content: 'واکسن\u200Cهای سه\u200Cگانه و هاری از ضروری\u200Cترین واکسن\u200Cها هستند. بچه\u200Cگربه\u200Cها از ۶-۸ هفتگی واکسیناسیون را شروع می\u200Cکنند. گربه\u200Cهای بالغ نیاز به یادآور سالانه دارند.'),
            Article(title: 'بیماری\u200Cهای شایع در گربه\u200Cها', summary: 'آشنایی با شایع\u200Cترین بیماری\u200Cهای گربه', readingTime: '۱۰ دقیقه', icon: 'health', content: 'بیماری\u200Cهای کلیوی، دیابت، پرکاری تیروئید و مشکلات دندانی از شایع\u200Cترین بیماری\u200Cها هستند. معاینه سالانه و آزمایش خون منظم به تشخیص زودهنگام کمک می\u200Cکند.'),
            Article(title: 'اهمیت معاینه سالانه دامپزشکی', summary: 'چرا چکاپ سالانه حتی برای گربه سالم ضروری است', readingTime: '۵ دقیقه', icon: 'health', content: 'گربه\u200Cها در پنهان کردن بیماری مهارت دارند. معاینه سالانه شامل بررسی وزن، دندان\u200Cها، قلب و آزمایش خون می\u200Cشود. پیشگیری همیشه کم\u200Cهزینه\u200Cتر از درمان است.'),
            Article(title: 'انگل\u200Cها و راههای پیشگیری', summary: 'محافظت از گربه در برابر انگل\u200Cهای داخلی و خارجی', readingTime: '۷ دقیقه', icon: 'health', content: 'کک، کنه، کرم\u200Cهای روده\u200Cای و انگل\u200Cهای گوش از شایع\u200Cترین انگل\u200Cها هستند. درمان\u200Cهای موضعی ماهانه و قرص\u200Cهای ضد انگل توصیه می\u200Cشود. گربه\u200Cهای خانگی هم نیاز به پیشگیری دارند.'),
            Article(title: 'سلامت دهان و دندان گربه', summary: 'اهمیت بهداشت دهان و پیشگیری از بیماری\u200Cهای لثه', readingTime: '۵ دقیقه', icon: 'health', content: 'بیماری\u200Cهای لثه در گربه\u200Cهای بالای ۳ سال بسیار شایع است. مسواک مخصوص گربه و خمیر دندان مخصوص تهیه کنید. جرم\u200Cگیری سالانه توسط دامپزشک توصیه می\u200Cشود.'),
          ],
        );
      case 3:
        page = const CategoryScreen(
          icon: Icons.school_rounded,
          title: 'آموزش',
          subtitle: 'همه\u200Cچیز درباره تربیت گربه؛ از آموزش دستشویی تا اصلاح رفتارهای ناخواسته و ترفندهای جذاب.',
          featuredArticle: Article(
            title: 'چگونه گربه خود را تربیت کنیم',
            summary: 'برخلاف تصور عمومی، گربه\u200Cها کاملاً آموزش\u200Cپذیر هستند. با این روش\u200Cها شروع کنید.',
            readingTime: '۸ دقیقه',
            icon: 'training',
            sections: [
              ArticleSection(heading: 'آیا گربه\u200Cها آموزش\u200Cپذیر هستند؟', body: 'بله! برخلاف باور عمومی، گربه\u200Cها با روش\u200Cهای صحیح و مبتنی بر تشویق به خوبی آموزش می\u200Cبینند. کلید موفقیت، صبر، تکرار و استفاده از پاداش\u200Cهای غذایی است.'),
              ArticleSection(heading: 'اصول طلایی آموزش گربه', type: 'bullets', bullets: ['جلسات کوتاه ۵-۱۰ دقیقه\u200Cای', 'همیشه با تشویقی مثبت پایان دهید', 'هرگز از تنبیه استفاده نکنید', 'در محیط آرام و بدون حواس\u200Cپرتی تمرین کنید', 'یک فرمان را تا تسلط کامل تکرار کنید']),
              ArticleSection(type: 'tip', heading: 'تکنیک کلیکر', body: 'کلیکر یک ابزار کوچک است که صدای "کلیک" تولید می\u200Cکند. هر بار که گربه رفتار درست را انجام داد، کلیک کنید و بلافاصله تشویقی بدهید. گربه یاد می\u200Cگیرد که کلیک یعنی "آفرین، جایزه داری!"'),
              ArticleSection(type: 'warning', heading: 'هشدار', body: 'هرگز از تنبیه بدنی یا فریاد زدن استفاده نکنید. این کار باعث ترس و اضطراب گربه می\u200Cشود و اعتماد او به شما را از بین می\u200Cبرد.'),
              ArticleSection(heading: 'چه چیزهایی می\u200Cتوان آموزش داد؟', body: 'می\u200Cتوانید فرمان\u200Cهای ساده مانند نشستن، آمدن، غلت زدن و حتی های\u200Cفایو را آموزش دهید. همچنین می\u200Cتوانید رفتارهای نامطلوب مانند چنگ زدن به مبل یا گاز گرفتن را اصلاح کنید.'),
              ArticleSection(type: 'image', heading: 'اینفوگرافیک آموزش گربه'),
              ArticleSection(type: 'relatedBreeds', heading: 'نژادهای آموزش\u200Cپذیر', bullets: ['Siamese', 'Maine Coon', 'Abyssinian']),
              ArticleSection(type: 'source', heading: 'منبع', body: 'موسسه رفتارشناسی حیوانات — راهنمای آموزش گربه\u200Cهای خانگی'),
            ],
          ),
          articles: [
            Article(title: 'آموزش دستشویی به بچه\u200Cگربه', summary: 'راهنمای گام به گام آموزش دستشویی', readingTime: '۶ دقیقه', icon: 'training', content: 'بچه\u200Cگربه\u200Cها معمولاً از مادر خود استفاده از ظرف خاک را یاد می\u200Cگیرند. ظرف را در جای آرام و دور از غذا قرار دهید. بعد از هر وعده غذایی بچه\u200Cگربه را در ظرف بگذارید. هرگز به خاطر اشتباهات تنبیه نکنید.'),
            Article(title: 'چگونه گربه را از چنگ زدن به مبل بازداریم', summary: 'راهکارهای عملی برای محافظت از مبلمان', readingTime: '۵ دقیقه', icon: 'training', content: 'تهیه اسکرچر مناسب اولین قدم است. اسکرچر را کنار مبلی که گربه چنگ می\u200Cزند قرار دهید. می\u200Cتوانید از اسپری\u200Cهای دفع\u200Cکننده یا چسب دوطرفه روی مبل استفاده کنید. تشویق گربه هنگام استفاده از اسکرچر بسیار مؤثر است.'),
            Article(title: 'ترفندهای جذاب برای آموزش گربه', summary: 'آموزش فرمان\u200Cهای ساده و سرگرم\u200Cکننده', readingTime: '۸ دقیقه', icon: 'training', content: 'گربه\u200Cها با کلیکر و تشویقی به خوبی آموزش می\u200Cبینند. می\u200Cتوانید نشستن، آمدن، غلت زدن و حتی های\u200Cفایو را آموزش دهید. جلسات آموزشی را کوتاه (۵-۱۰ دقیقه) و مثبت نگه دارید.'),
            Article(title: 'رفع رفتار گاز گرفتن در گربه', summary: 'علت\u200Cیابی و اصلاح رفتار گاز گرفتن', readingTime: '۵ دقیقه', icon: 'training', content: 'گاز گرفتن گربه معمولاً ناشی از ترس، بازی خشن یا درد است. هرگز با دست با گربه بازی نکنید — از اسباب\u200Cبازی استفاده کنید. هنگام گاز گرفتن، دست خود را بی\u200Cحرکت نگه دارید و توجه را قطع کنید.'),
            Article(title: 'آموزش فرمان\u200Cهای ساده به گربه', summary: 'آموزش نشستن، آمدن و دیگر فرمان\u200Cهای پایه', readingTime: '۷ دقیقه', icon: 'training', content: 'با کلیکر و تشویقی می\u200Cتوانید فرمان\u200Cهای ساده را آموزش دهید. از "بنشین" شروع کنید — تشویقی را بالای سر گربه نگه دارید و همزمان بگویید "بنشین". بعد از نشستن، کلیک کنید و تشویقی بدهید.'),
          ],
        );
      case 4:
        page = const CategoryScreen(
          icon: Icons.sports_esports_rounded,
          title: 'سرگرمی',
          subtitle: 'ایده\u200Cهای خلاقانه برای سرگرم کردن گربه؛ از اسباب\u200Cبازی\u200Cهای دست\u200Cساز تا بازی\u200Cهای تعاملی.',
          featuredArticle: Article(
            title: 'بهترین اسباب\u200Cبازی\u200Cهای گربه',
            summary: 'با انتخاب اسباب\u200Cبازی مناسب، گربه خود را سرگرم و فعال نگه دارید و از چاقی جلوگیری کنید.',
            readingTime: '۶ دقیقه',
            icon: 'games',
            sections: [
              ArticleSection(heading: 'چرا بازی برای گربه ضروری است؟', body: 'بازی فقط سرگرمی نیست — برای سلامت جسمی و روحی گربه حیاتی است. گربه\u200Cها شکارچیان طبیعی هستند و بازی، غریزه شکار آنها را ارضا می\u200Cکند.'),
              ArticleSection(heading: 'انواع اسباب\u200Cبازی\u200Cهای گربه', type: 'bullets', bullets: ['ماهی\u200Cگیری اسباب\u200Cبازی (تعامل با صاحب)', 'توپ\u200Cهای صدادار و متحرک', 'اسباب\u200Cبازی\u200Cهای پازلی (غذا درون آن)', 'لیزر پوینتر (با احتیاط)', 'تونل\u200Cها و جعبه\u200Cهای مخفی\u200Cگاه']),
              ArticleSection(type: 'tip', heading: 'چرخش اسباب\u200Cبازی\u200Cها', body: 'همه اسباب\u200Cبازی\u200Cها را یکجا در دسترس نگذارید. هر هفته چند اسباب\u200Cبازی را تعویض کنید تا گربه از آنها خسته نشود.'),
              ArticleSection(type: 'warning', heading: 'احتیاط', body: 'هنگام استفاده از لیزر پوینتر، هرگز نور را مستقیم به چشم گربه نتابانید. بازی با لیزر را همیشه با یک خوراکی فیزیکی پایان دهید تا گربه دچار ناکامی نشود.'),
              ArticleSection(type: 'image', heading: 'نمونه اسباب\u200Cبازی\u200Cهای پیشنهادی'),
              ArticleSection(type: 'relatedBreeds', heading: 'نژادهای بازیگوش', bullets: ['Bengal', 'Siamese', 'Abyssinian']),
              ArticleSection(type: 'source', heading: 'منبع', body: 'انجمن بین\u200Cالمللی رفتارشناسی گربه\u200Cسانان'),
            ],
          ),
          articles: [
            Article(title: 'اسباب\u200Cبازی\u200Cهای دست\u200Cساز برای گربه', summary: 'با وسایل ساده برای گربه خود اسباب\u200Cبازی بسازید', readingTime: '۶ دقیقه', icon: 'games', content: 'با وسایل دورریختنی می\u200Cتوانید اسباب\u200Cبازی\u200Cهای عالی بسازید. یک جعبه مقوایی ساده، توپ فویل، یا نخ کاموا می\u200Cتواند ساعت\u200Cها گربه را سرگرم کند. همیشه مراقب قطعات کوچک بلعیدنی باشید.'),
            Article(title: 'بازی\u200Cهای تعاملی با گربه', summary: 'بهترین بازی\u200Cها برای تقویت رابطه با گربه', readingTime: '۵ دقیقه', icon: 'games', content: 'بازی با گربه فقط سرگرمی نیست — برای سلامت جسمی و روحی گربه ضروری است. روزانه حداقل ۱۵-۲۰ دقیقه بازی کنید. از اسباب\u200Cبازی\u200Cهای ماهی\u200Cگیری، لیزر و توپ\u200Cهای متحرک استفاده کنید.'),
            Article(title: 'چگونه یک درخت گربه خانگی بسازیم', summary: 'آموزش ساخت اسکرچر و درخت گربه در خانه', readingTime: '۱۰ دقیقه', icon: 'games', content: 'با چند تکه چوب، طناب کنفی و یک پایه محکم می\u200Cتوانید یک درخت گربه عالی بسازید. ارتفاع حداقل ۱۲۰ سانتی\u200Cمتر و دارای سکوهای متعدد برای نشستن باشد. گربه\u200Cها عاشق ارتفاع هستند!'),
            Article(title: 'اسباب\u200Cبازی\u200Cهای پازلی و هوشی', summary: 'تقویت هوش گربه با اسباب\u200Cبازی\u200Cهای چالشی', readingTime: '۷ دقیقه', icon: 'games', content: 'اسباب\u200Cبازی\u200Cهای پازلی که با غذا پر می\u200Cشوند، ذهن گربه را به چالش می\u200Cکشند. گربه باید با پنجه یا فکر کردن غذا را بیرون بیاورد. این کار از بی\u200Cحوصلگی و چاقی جلوگیری می\u200Cکند.'),
            Article(title: 'بهترین اپلیکیشن\u200Cهای سرگرمی گربه', summary: 'معرفی اپلیکیشن\u200Cهای جذاب برای بازی با گربه', readingTime: '۴ دقیقه', icon: 'games', content: 'اپلیکیشن\u200Cهای مخصوص گربه شامل بازی\u200Cهای شکار ماهی، حشرات متحرک و لیزرپوینتر مجازی هستند. مراقب باشید گربه به صفحه نمایش آسیب نزند. این بازی\u200Cها مکمل بازی فیزیکی هستند، نه جایگزین آن.'),
          ],
        );
      default:
        page = const CategoryScreen(
          icon: Icons.vaccines_rounded,
          title: 'واکسن و پزشکی',
          subtitle: 'برنامه کامل واکسیناسیون گربه و راهنمای مراقبت\u200Cهای پزشکی پیشگیرانه برای حفظ سلامت.',
          featuredArticle: Article(
            title: 'برنامه واکسیناسیون گربه',
            summary: 'با رعایت برنامه منظم واکسیناسیون، از گربه خود در برابر بیماری\u200Cهای خطرناک محافظت کنید.',
            readingTime: '۷ دقیقه',
            icon: 'vaccine',
            sections: [
              ArticleSection(heading: 'چرا واکسیناسیون ضروری است؟', body: 'واکسیناسیون از گربه شما در برابر بیماری\u200Cهای خطرناک و اغلب کشنده محافظت می\u200Cکند. حتی گربه\u200Cهای کاملاً خانگی هم نیاز به واکسن دارند.'),
              ArticleSection(heading: 'واکسن\u200Cهای اصلی', type: 'bullets', bullets: ['سه\u200Cگانه (پنلوکوپنی + کلسی ویروس + هرپس ویروس)', 'هاری (اجباری در بسیاری از کشورها)', 'لوسمی گربه (FeLV) — برای گربه\u200Cهای با دسترسی به فضای باز']),
              ArticleSection(heading: 'برنامه واکسیناسیون بچه\u200Cگربه', body: 'واکسیناسیون از ۶-۸ هفتگی شروع می\u200Cشود. دوز دوم در ۱۰-۱۲ هفتگی، دوز سوم در ۱۴-۱۶ هفتگی. واکسن هاری در ۱۲-۱۶ هفتگی تزریق می\u200Cشود.'),
              ArticleSection(type: 'tip', heading: 'یادآوری سالانه', body: 'گربه\u200Cهای بالغ نیاز به تزریق یادآور سالانه دارند. تاریخ واکسن بعدی را در تقویم خود علامت بزنید.'),
              ArticleSection(type: 'warning', heading: 'علائم پس از واکسن', body: 'بی\u200Cحالی خفیف و کاهش اشتها تا ۲۴ ساعت طبیعی است. در صورت استفراغ، اسهال، یا تورم شدید محل تزریق، به دامپزشک مراجعه کنید.'),
              ArticleSection(type: 'image', heading: 'کارت واکسیناسیون نمونه'),
              ArticleSection(type: 'relatedBreeds', heading: 'نژادهای مرتبط', bullets: ['Persian', 'Siamese', 'British Shorthair']),
              ArticleSection(type: 'source', heading: 'منبع', body: 'سازمان جهانی بهداشت دام — دستورالعمل واکسیناسیون حیوانات خانگی'),
            ],
          ),
          articles: [
            Article(title: 'واکسن\u200Cهای سه\u200Cگانه و چهارگانه', summary: 'تفاوت واکسن\u200Cها و برنامه تزریق', readingTime: '۷ دقیقه', icon: 'medical', content: 'واکسن سه\u200Cگانه شامل پنلوکوپنی، کلسی ویروس و هرپس ویروس است. واکسن چهارگانه شامل کلامیدیا نیز می\u200Cشود. بچه\u200Cگربه\u200Cها ۲-۳ دوز با فاصله ۳-۴ هفته نیاز دارند.'),
            Article(title: 'برنامه واکسیناسیون بچه\u200Cگربه', summary: 'برنامه کامل از تولد تا یک سالگی', readingTime: '۶ دقیقه', icon: 'medical', content: 'واکسیناسیون از ۶-۸ هفتگی با واکسن سه\u200Cگانه شروع می\u200Cشود. دوز دوم در ۱۰-۱۲ هفتگی و دوز سوم در ۱۴-۱۶ هفتگی. واکسن هاری در ۱۲-۱۶ هفتگی تزریق می\u200Cشود.'),
            Article(title: 'عوارض جانبی واکسن در گربه', summary: 'علائم طبیعی و موارد نگران\u200Cکننده پس از واکسن', readingTime: '۵ دقیقه', icon: 'medical', content: 'عوارض خفیف مانند بی\u200Cحالی و کاهش اشتها تا ۲۴ ساعت طبیعی است. تورم یا درد در محل تزریق شایع است. در صورت استفراغ، اسهال یا تنگی نفس فوراً به دامپزشک مراجعه کنید.'),
            Article(title: 'ضدعفونی و انگل\u200Cزدایی', summary: 'برنامه کامل پیشگیری از انگل\u200Cها', readingTime: '۶ دقیقه', icon: 'medical', content: 'گربه\u200Cها حتی اگر کاملاً خانگی باشند نیاز به انگل\u200Cزدایی منظم دارند. قرص\u200Cهای ضد انگل هر ۳ ماه یکبار و درمان\u200Cهای موضعی ماهانه توصیه می\u200Cشود. آزمایش مدفوع سالانه برای تشخیص انگل\u200Cهای داخلی ضروری است.'),
            Article(title: 'مراقبت\u200Cهای بعد از جراحی عقیم\u200Cسازی', summary: 'راهنمای مراقبت پس از عمل عقیم\u200Cسازی', readingTime: '۸ دقیقه', icon: 'medical', content: 'پس از عقیم\u200Cسازی، گربه را در محیط آرام و گرم نگه دارید. ۱۰-۱۴ روز از دویدن و پریدن جلوگیری کنید. محل بخیه را روزانه بررسی کنید. از لیسیدن بخیه با استفاده از قلاده الیزابت جلوگیری کنید.'),
          ],
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
                    hoverColor: theme.colorScheme.onSurface.withValues(alpha: 0.03),
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
          style: _heroStyle.copyWith(
            color: theme.colorScheme.primary,
          ),
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
                          color: theme.colorScheme.primary.withValues(alpha: 0.1),
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
    return Container(
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
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
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
        final crossAxisCount = constraints.maxWidth >= 500
            ? 3
            : 2;

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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        hoverColor: theme.colorScheme.primary.withValues(alpha: 0.05),
        splashColor: theme.colorScheme.primary.withValues(alpha: 0.1),
        highlightColor: theme.colorScheme.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [theme.colorScheme.surface, theme.colorScheme.surfaceContainerHighest],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 26,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                        height: 1.3,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.chevron_left_rounded,
                size: 20,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.35),
              ),
            ],
          ),
        ),
      ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 175,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 140,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.image,
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
                    errorBuilder: (_, _, _) => const BreedPlaceholder(),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () => _service.toggle(widget.name),
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface.withValues(alpha: 0.85),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.06),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                          size: 18,
                          color: _isFavorite ? theme.colorScheme.error : theme.colorScheme.primary,
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
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          widget.origin,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
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
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
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
      'summary': 'اگر در آپارتمان زندگی می\u200Cکنید، این نژادها مناسب\u200Cترین گزینه برای شما هستند.',
      'time': '۵ دقیقه',
      'icon': Icons.apartment_rounded,
    },
    {
      'title': 'راهنمای کامل تغذیه گربه',
      'summary': 'هر آنچه باید درباره غذای خشک، کنسروی و تغذیه خانگی بدانید.',
      'time': '۸ دقیقه',
      'icon': Icons.restaurant_menu_rounded,
    },
    {
      'title': 'علائم بیماری در گربه\u200Cها',
      'summary': 'با شناخت این علائم هشداردهنده، سلامت گربه خود را تضمین کنید.',
      'time': '۶ دقیقه',
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
                    article: Article(
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
        child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [theme.colorScheme.surface, theme.colorScheme.surfaceContainerHighest],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.45),
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
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
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
                          color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (index) {
              final isSelected = _selectedIndex == index;
              return _NavItem(
                key: ValueKey(index),
                icon: _items[index]['icon'] as IconData,
                label: _items[index]['label'] as String,
                isSelected: isSelected,
                theme: theme,
                onTap: () {
                  setState(() => _selectedIndex = index);
                  if (index == 1 || index == 3) {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, _, _) => const BreedsScreen(),
                        transitionsBuilder: (_, animation, _, child) {
                          return FadeTransition(opacity: animation, child: child);
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
                          return FadeTransition(opacity: animation, child: child);
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

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
