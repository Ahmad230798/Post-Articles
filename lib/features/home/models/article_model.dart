import 'package:equatable/equatable.dart';

class ArticleModel extends Equatable {
  final int? id;
  final String? slug;
  final String? title;
  final String? description;
  final String? abstractText;
  final String? coverImage;
  final String? categoryName;
  final String? authorName;
  final int? readTime;
  final int? likesCount;
  final int? commentsCount;
  final String? averageRating;
  final int? authorId;

  const ArticleModel({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.abstractText,
    this.coverImage,
    this.categoryName,
    this.authorName,
    this.authorId,
    this.readTime,
    this.likesCount,
    this.commentsCount,
    this.averageRating,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json["id"],
      slug: json["slug"],
      title: json["title"] ?? "",
      description: json["description"],
      abstractText: json["abstract"],
      coverImage: json["cover_image"],
      categoryName: json["category"]?["name"],
      authorName: json["author"]?["username"],
      readTime: json["read_time"],
      likesCount: json["likes_count"],
      commentsCount: json["comments_count"] is int
          ? json["comments_count"]
          : int.tryParse(json["comments_count"] ?? "0"),
      averageRating: (json["average_rating"] ?? "0").toString(),
      authorId: json["author"]?["id"],
    );
  }

  @override
  List<Object?> get props => [
    id,
    slug,
    title,
    description,
    abstractText,
    coverImage,
    categoryName,
    authorName,
    readTime,
    likesCount,
    commentsCount,
    averageRating,
    authorId,
  ];
}
