class ArticleSection {
  final String? heading;
  final String? body;
  final List<String>? bullets;
  final String? type;

  const ArticleSection({
    this.heading,
    this.body,
    this.bullets,
    this.type,
  });
}

class Article {
  final String title;
  final String summary;
  final String readingTime;
  final String content;
  final String icon;
  final List<ArticleSection> sections;

  const Article({
    required this.title,
    required this.summary,
    required this.readingTime,
    this.content = '',
    this.icon = '',
    this.sections = const [],
  });

  String get displayContent => content.isNotEmpty ? content : summary;
  bool get hasSections => sections.isNotEmpty;
}
