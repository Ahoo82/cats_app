class CatBreed {
  final String name;
  final String origin;
  final String temperament;
  final String description;
  final String descriptionEn;
  final String lifeSpan;
  final String weight;
  final String coatType;
  final List<String> colors;

  const CatBreed({
    required this.name,
    required this.origin,
    required this.temperament,
    required this.description,
    required this.descriptionEn,
    required this.lifeSpan,
    required this.weight,
    required this.coatType,
    required this.colors,
  });
}

const List<CatBreed> catBreeds = [
  CatBreed(
    name: 'Persian',
    origin: 'Iran (Persia)',
    temperament: 'Calm, Gentle, Quiet',
    description:
        'پرشین یکی از قدیمی\u200Cترین و محبوب\u200Cترین نژادهای گربه در جهان است. '
        'این گربه\u200Cها با موهای بلند و ابریشمی، صورت گرد و چشمان درشت خود '
        'شناخته می\u200Cشوند. شخصیتی آرام، مهربان و ساکت دارند و عاشق '
        'محیط\u200Cهای آرام و بدون تنش هستند. پرشین\u200Cها بهترین انتخاب '
        'برای افرادی هستند که به دنبال یک همراه آرام و باوقار می\u200Cگردند.',
    descriptionEn:
        'The Persian cat is one of the oldest and most popular cat breeds. '
        'Known for their long, luxurious coat and sweet, gentle personality, '
        'Persians are the ultimate lap cats. They have a round face with big, '
        'expressive eyes and a short muzzle. Persians prefer a calm, stable '
        'environment and are perfect for quiet households.',
    lifeSpan: '12-17 years',
    weight: '3.5-5.5 kg',
    coatType: 'Long-haired',
    colors: ['White', 'Black', 'Cream', 'Blue', 'Red', 'Silver'],
  ),
  CatBreed(
    name: 'Siamese',
    origin: 'Thailand (Siam)',
    temperament: 'Vocal, Intelligent, Social',
    description:
        'سیامی یکی از خاص\u200Cترین نژادهای گربه با چشمان آبی بادامی و '
        'الگوی رنگی نقطه\u200Cای است. آنها بسیار پرحرف و اجتماعی هستند و '
        'دائماً با صاحب خود "صحبت" می\u200Cکنند. باهوش، بازیگوش و '
        'فو\u200Cق\u200Cالعاده وفادارند و پیوند عمیقی با خانواده خود برقرار '
        'می\u200Cکنند. اگر به دنبال گربه\u200Cای ساکت و کم\u200Cتوقع هستید، '
        'سیامی انتخاب مناسبی نیست!',
    descriptionEn:
        'Siamese cats are one of the most recognizable breeds with their '
        'striking blue almond-shaped eyes and color-point coat pattern. '
        'They are extremely vocal and will "talk" to their owners throughout '
        'the day. Highly intelligent and social, Siamese cats demand attention '
        'and form strong bonds with their human companions.',
    lifeSpan: '15-20 years',
    weight: '2.5-4.5 kg',
    coatType: 'Short-haired',
    colors: ['Seal Point', 'Blue Point', 'Chocolate Point', 'Lilac Point'],
  ),
  CatBreed(
    name: 'Maine Coon',
    origin: 'United States',
    temperament: 'Friendly, Playful, Gentle Giant',
    description:
        'مین کون بزرگ\u200Cترین نژاد گربه خانگی است که به "غول مهربان" '
        'شهرت دارد. با وجود جثه بزرگ، شخصیتی فوق\u200Cالعاده مهربان و '
        'بازیگوش دارد. موهای ضخیم و ضدآب آنها برای آب\u200Cوهوای سرد '
        'مناسب است. گوش\u200Cهای پُرپشت و دم بلند و پشمالو از ویژگی\u200Cهای '
        'ظاهری آنهاست. باهوش، آموزش\u200Cپذیر و عاشق بازی با کودکان هستند.',
    descriptionEn:
        'The Maine Coon is the largest domestic cat breed, often called the '
        '"gentle giant" of the cat world. Despite their impressive size, they '
        'are known for their sweet, friendly disposition. They have a thick, '
        'water-resistant coat perfect for cold climates, tufted ears, and a '
        'long, bushy tail. Maine Coons are highly intelligent and can be '
        'trained to fetch and walk on a leash.',
    lifeSpan: '12-15 years',
    weight: '5-9 kg',
    coatType: 'Long-haired',
    colors: ['Brown Tabby', 'Black', 'White', 'Red', 'Cream', 'Tortoiseshell'],
  ),
  CatBreed(
    name: 'British Shorthair',
    origin: 'United Kingdom',
    temperament: 'Easygoing, Loyal, Calm',
    description:
        'بریتیش شورت\u200Cهیر با پوشش مخملی و صورت گرد و گونه\u200Cهای '
        'پُر، یکی از جذاب\u200Cترین نژادهاست. شخصیتی آرام، خونسرد و '
        'وفادار دارد و برای خانواده\u200Cها عالی است. برخلاف بسیاری از '
        'نژادها، این گربه\u200Cها زیاد بغل شدن را دوست ندارند و ترجیح '
        'می\u200Cدهند کنار شما بنشینند. الهام\u200Cبخش شخصیت گربه چشایر '
        'در داستان آلیس در سرزمین عجایب هستند.',
    descriptionEn:
        'The British Shorthair is known for its dense, plush coat and round '
        'face with chubby cheeks. They are calm, easygoing cats that are '
        'perfect for families. Unlike many breeds, British Shorthairs are not '
        'lap cats but prefer to sit beside you. They are the inspiration '
        'behind the Cheshire Cat from Alice in Wonderland.',
    lifeSpan: '14-20 years',
    weight: '4-8 kg',
    coatType: 'Short-haired',
    colors: ['Blue (Gray)', 'Black', 'White', 'Cream', 'Red', 'Cinnamon'],
  ),
  CatBreed(
    name: 'Bengal',
    origin: 'United States',
    temperament: 'Active, Curious, Energetic',
    description:
        'بنگال با پوشش خال\u200Cدار یا مرمری شبیه پلنگ، ظاهری وحشی اما '
        'شخصیتی کاملاً اهلی دارد. بسیار فعال، کنجکاو و پرانرژی است و به '
        'بازی و تحرک فراوان نیاز دارد. عاشق آب است و ممکن است با شما '
        'دوش بگیرد! پوشش آنها در نور آفتاب جلوه\u200Cای درخشان و '
        'طلایی دارد. مناسب صاحبان فعال و پرانرژی است.',
    descriptionEn:
        'Bengal cats have a wild appearance with their leopard-like spotted '
        'or marbled coat, but they are fully domestic. They are extremely '
        'active and require lots of play and stimulation. Bengals love water '
        'and may join you in the shower. Their coat has a unique glittering '
        'effect in sunlight due to the structure of the hair.',
    lifeSpan: '12-16 years',
    weight: '3.5-7 kg',
    coatType: 'Short-haired',
    colors: ['Brown Spotted', 'Snow', 'Silver', 'Charcoal', 'Blue'],
  ),
  CatBreed(
    name: 'Scottish Fold',
    origin: 'Scotland',
    temperament: 'Sweet, Quiet, Adaptable',
    description:
        'اسکاتیش فولد با گوش\u200Cهای تا شده منحصر\u200Cبه\u200Cفرد خود '
        'که ظاهری شبیه جغد به او می\u200Cبخشد، یکی از دوست\u200Cداشتنی\u200Cترین '
        'نژادهاست. شخصیتی شیرین، آرام و سازگار دارد و به خوبی با '
        'محیط\u200Cهای مختلف وفق پیدا می\u200Cکند. آنها به نشستن در '
        'حالت\u200Cهای عجیب و غریب معروف هستند، از جمله حالت "بودا".',
    descriptionEn:
        'The Scottish Fold is famous for its unique folded ears that give it '
        'an owl-like appearance. This natural genetic mutation affects the '
        'cartilage throughout the body. They are sweet-natured cats that adapt '
        'well to various living situations. Scottish Folds are known for '
        'sitting in unusual positions, including the "Buddha position."',
    lifeSpan: '11-15 years',
    weight: '2.5-6 kg',
    coatType: 'Short-haired / Long-haired',
    colors: ['White', 'Black', 'Blue', 'Red', 'Cream', 'Tortoiseshell'],
  ),
  CatBreed(
    name: 'Sphynx',
    origin: 'Canada',
    temperament: 'Affectionate, Playful, Mischievous',
    description:
        'اسفینکس مشهورترین نژاد بدون مو با پوست چروک و گوش\u200Cهای بزرگ '
        'است. برخلاف تصور عموم، ضدحساسیت نیستند. آنها بسیار گرم و '
        'نرم\u200Cاند و عاشق بغل شدن برای گرم ماندن هستند. شخصیتی '
        'شیطون، بازیگوش و بشدت اجتماعی دارند و بیشتر شبیه سگ رفتار '
        'می\u200Cکنند تا گربه! نیازمند مراقبت ویژه از پوست هستند.',
    descriptionEn:
        'The Sphynx is the most famous hairless cat breed, known for its '
        'wrinkled skin and large ears. Despite lacking fur, they are not '
        'hypoallergenic as allergies are caused by skin oils and saliva. '
        'Sphynx cats are extremely warm to the touch and love to cuddle for '
        'warmth. They are highly social and act more like dogs than cats.',
    lifeSpan: '8-14 years',
    weight: '2.5-5.5 kg',
    coatType: 'Hairless',
    colors: ['Pink', 'Black', 'White', 'Blue', 'Red', 'Tortoiseshell'],
  ),
  CatBreed(
    name: 'Ragdoll',
    origin: 'United States',
    temperament: 'Relaxed, Affectionate, Gentle',
    description:
        'رگدال نام خود را از عادت شل شدن کامل در آغوش، درست مثل یک '
        'عروسک پارچه\u200Cای گرفته است. چشمان آبی خیره\u200Cکننده و '
        'پوشش نیمه\u200Cبلند ابریشمی دارند که به ندرت گره می\u200Cخورد. '
        'یکی از مهربان\u200Cترین نژادها هستند و صاحب خود را از اتاقی '
        'به اتاق دیگر دنبال می\u200Cکنند. بهترین انتخاب برای خانواده\u200Cها.',
    descriptionEn:
        'Ragdolls get their name from their tendency to go limp and relaxed '
        'when picked up, just like a ragdoll. They have striking blue eyes '
        'and a semi-long, silky coat that rarely mats. Ragdolls are one of '
        'the most affectionate breeds, often following their owners from room '
        'to room and greeting them at the door.',
    lifeSpan: '12-17 years',
    weight: '4.5-9 kg',
    coatType: 'Semi-long-haired',
    colors: ['Seal', 'Blue', 'Chocolate', 'Lilac', 'Red', 'Cream'],
  ),
  CatBreed(
    name: 'Abyssinian',
    origin: 'Ethiopia (Abyssinia)',
    temperament: 'Active, Curious, Intelligent',
    description:
        'حبشی یکی از قدیمی\u200Cترین نژادهای شناخته شده با پوشش '
        'تیک\u200Cدار خاص است که هر تار مو چند رنگ دارد. شباهت زیادی به '
        'گربه\u200Cهای نقاشی\u200Cهای مصر باستان دارد. بسیار فعال، '
        'کنجکاو و باهوش است و همیشه می\u200Cخواهد در کارهای شما '
        'شرکت کند. گربه\u200Cای نیست که گوشه\u200Cای بخوابد — عاشق '
        'بالا رفتن و کاوش است.',
    descriptionEn:
        'The Abyssinian is one of the oldest known cat breeds, resembling '
        'the cats depicted in ancient Egyptian art. They have a distinctive '
        'ticked coat pattern where each hair has bands of different colors. '
        'Abyssinians are extremely active and curious, always wanting to be '
        'involved in whatever their humans are doing. They are not lap cats '
        'but love to climb and explore.',
    lifeSpan: '9-15 years',
    weight: '2.5-5 kg',
    coatType: 'Short-haired',
    colors: ['Ruddy', 'Red', 'Blue', 'Fawn', 'Cinnamon'],
  ),
  CatBreed(
    name: 'Turkish Angora',
    origin: 'Turkey',
    temperament: 'Playful, Independent, Graceful',
    description:
        'آنگورای ترکی نژادی باستانی و طبیعی از ترکیه با پوشش ابریشمی '
        'نیمه\u200Cبلند و ظاهری بسیار elegant است. باهوش، بازیگوش و '
        'مستقل هستند و پیوند عمیقی با صاحب خود برقرار می\u200Cکنند. '
        'بسیاری از آنها هتروکرومیا (دو رنگ متفاوت چشم) دارند، مخصوصاً '
        'سفیدها با یک چشم آبی و یک چشم کهربایی. بسیار زیبا و چشمگیر.',
    descriptionEn:
        'The Turkish Angora is an ancient natural breed from Turkey, known '
        'for its silky, medium-long coat and elegant appearance. They are '
        'intelligent, playful cats that form strong bonds with their owners. '
        'Many Turkish Angoras have heterochromia (different colored eyes), '
        'especially white ones with one blue and one amber eye.',
    lifeSpan: '12-18 years',
    weight: '2.5-5 kg',
    coatType: 'Semi-long-haired',
    colors: ['White', 'Black', 'Blue', 'Red', 'Cream', 'Tortoiseshell'],
  ),
  CatBreed(
    name: 'Domestic Shorthair',
    origin: 'Iran',
    temperament: 'Independent, Adaptable, Playful',
    description:
        'گربه خانگی موکوتاه رایج\u200Cترین گربه در ایران است که '
        'در هر کوچه و خانه\u200Cای پیدا می\u200Cشود. مقاوم، سازگار '
        'و کم\u200Cتوقع است. صورت گرد و پوشش کوتاه و متراکم دارد و '
        'رنگ\u200Cهای متنوعی از نارنجی تابی تا سیاه، سفید و کالیکو '
        'را شامل می\u200Cشود. شخصیتی مستقل اما مهربان دارد و برای '
        'کسانی که اولین بار گربه نگه می\u200Cدارند عالی است.',
    descriptionEn:
        'The Domestic Shorthair is the most common cat in Iran, found in '
        'nearly every neighborhood. They are hardy, adaptable cats with '
        'round faces and short, dense coats. Their colors range from orange '
        'tabby to black, white, and calico. They are independent yet '
        'affectionate, making them perfect for first-time cat owners.',
    lifeSpan: '12-18 years',
    weight: '3-5 kg',
    coatType: 'Short-haired',
    colors: ['Orange Tabby', 'Black', 'White', 'Calico', 'Gray'],
  ),
  CatBreed(
    name: 'Persian Chinchilla',
    origin: 'Iran (Persia) / UK',
    temperament: 'Calm, Elegant, Gentle',
    description:
        'پرشین چین\u200Cچیلا گونه\u200Cای خیره\u200Cکننده از نژاد پرشین '
        'با پوشش نقره\u200Cای یا طلایی درخشان است که نوک تارهای مو '
        'رنگ تیره\u200Cتری دارد. چشمان سبز زمردی با خط مشکی دور '
        'چشم که ظاهری "خط چشم" دراماتیک به آنها می\u200Cبخشد. '
        'شخصیتی آرام، elegant و وفادار دارند و محیط ساکت را ترجیح می\u200Cدهند.',
    descriptionEn:
        'The Persian Chinchilla is a stunning variant of the Persian breed '
        'with a sparkling silver or golden coat tipped with darker color. '
        'They have striking emerald-green eyes outlined in black, giving '
        'them a dramatic "eyeliner" look. They are calm, elegant cats that '
        'prefer a quiet environment and are deeply loyal to their owners.',
    lifeSpan: '12-15 years',
    weight: '3-5.5 kg',
    coatType: 'Long-haired',
    colors: ['Silver Tipped', 'Golden Tipped', 'Blue Tipped'],
  ),
  CatBreed(
    name: 'Himalayan',
    origin: 'United States (cross breed)',
    temperament: 'Sweet, Gentle, Affectionate',
    description:
        'هیمالین که با نام "پرشین کالرپوینت" نیز شناخته می\u200Cشود، '
        'حاصل ترکیب نژاد پرشین و سیامی است. پوشش بلند و مجلل پرشین '
        'را با چشمان آبی خیره\u200Cکننده و الگوی نقطه\u200Cای سیامی '
        'ترکیب کرده است. شخصیتی شیرین، آرام و فوق\u200Cالعاده مهربان '
        'دارد و عاشق بغل شدن و نوازش است. در ایران بسیار محبوب است.',
    descriptionEn:
        'The Himalayan cat, also known as "Colourpoint Persian," is a '
        'cross between Persian and Siamese. They have the luxurious long '
        'coat of a Persian and the striking blue eyes and color-point '
        'pattern of a Siamese. Himalayan cats are calm, sweet-natured, '
        'and love being held and cuddled.',
    lifeSpan: '12-15 years',
    weight: '3.5-5.5 kg',
    coatType: 'Long-haired',
    colors: ['Seal Point', 'Blue Point', 'Chocolate Point', 'Lilac Point'],
  ),
  CatBreed(
    name: 'Exotic Shorthair',
    origin: 'United States',
    temperament: 'Calm, Loving, Playful',
    description:
        'اکزاتیک مو کوتاه در واقع همان پرشین است با موهای کوتاه! '
        'همان صورت گرد و شخصیت شیرین، اما با پوششی متراکم و مخملی که '
        'نگهداری بسیار آسان\u200Cتری دارد. به "پرشین تنبل\u200Cها" '
        'معروف است. آرام و مهربان است اما از بازی هم لذت می\u200Cبرد. '
        'یکی از محبوب\u200Cترین نژادها در ایران است.',
    descriptionEn:
        'The Exotic Shorthair is essentially a short-haired Persian — same '
        'round face, same sweet personality, but with a plush, dense coat '
        'that requires much less grooming. They are nicknamed "the lazy '
        'man\'s Persian." Exotics are calm and affectionate but also enjoy '
        'playtime, making them one of the most popular breeds in Iran.',
    lifeSpan: '12-15 years',
    weight: '3-6 kg',
    coatType: 'Short-haired',
    colors: ['White', 'Cream', 'Blue', 'Red', 'Black', 'Tabby'],
  ),
];
