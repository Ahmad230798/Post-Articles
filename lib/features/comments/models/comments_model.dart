class CommentModel {
  final int id;
  final String text;
  final String authorName;
  final String createdAt;
  final int likesCount;
  final bool isLiked;
  CommentModel({
    required this.id,
    required this.text,
    required this.authorName,
    required this.createdAt,
    required this.likesCount,
    required this.isLiked,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      text: json['content'] ?? '', // 🔵 هنا التعديل
      authorName: json['author']?['username'] ?? 'Unknown',
      createdAt: json['created_at'] ?? '',
      likesCount: json['likes_count'] ?? 0,
      isLiked: json['is_liked'] ?? false,
    );
  }
}
