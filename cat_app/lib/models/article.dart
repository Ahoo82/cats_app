class Article {
  final String title;
  final String summary;
  final String readingTime;
  final String content;
  final String icon;

  const Article({
    required this.title,
    required this.summary,
    required this.readingTime,
    this.content = '',
    this.icon = '',
  });

  String get displayContent => content.isNotEmpty ? content : summary;
}
