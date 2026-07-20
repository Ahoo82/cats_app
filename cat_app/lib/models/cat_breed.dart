class CatBreed {
  final String name;
  final String origin;
  final String temperament;
  final String description;
  final String lifeSpan;
  final String weight;
  final String coatType;
  final List<String> colors;

  const CatBreed({
    required this.name,
    required this.origin,
    required this.temperament,
    required this.description,
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
];
