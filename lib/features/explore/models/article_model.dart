class ArticleModel {
  final int id;
  final String title;
  final String category;
  final String image;
  final String? readTime;
  final String? description;
  final String? likes;
  final String? shares;
  final String? authorAvatar;
  final String? authorName;
  final bool isSaved;

  ArticleModel({
    required this.id,
    required this.title,
    required this.category,
    required this.image,
    this.readTime,
    this.description,
    this.likes,
    this.shares,
    this.authorAvatar,
    this.authorName,
    this.isSaved = false,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      readTime: json['readTime'],
      description: json['description'],
      likes: json['likes'],
      shares: json['shares'],
      authorAvatar: json['authorAvatar'],
      authorName: json['authorName'],
      isSaved: json['isSaved'] ?? false,
    );
  }
}
