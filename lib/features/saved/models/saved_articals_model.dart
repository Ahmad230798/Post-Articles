import 'package:flutter_project/features/home/models/article_model.dart';

class SavedArticleModel {
  final int id;
  final ArticleModel article;
  final String createdAt;

  SavedArticleModel({
    required this.id,
    required this.article,
    required this.createdAt,
  });

  factory SavedArticleModel.fromJson(Map<String, dynamic> json) {
    return SavedArticleModel(
      id: json['id'],
      article: ArticleModel.fromJson(json['article']),
      createdAt: json['created_at'] ?? '',
    );
  }
}

// class ArticleItemModel {
//   final int id;
//   final String title;
//   final String slug;
//   final String description;
//   final String abstractText;
//   final String? coverImage;
//   final String status;
//   final String accessLevel;
//   final int readTime;
//   final int viewsCount;
//   final int likesCount;
//   final int commentsCount;
//   final double averageRating;
//   final bool isFeatured;
//   final String publishedAt;
//   final String createdAt;
//   final String? authorName;
//   final String? categoryName;
//   ArticleItemModel({
//     required this.id,
//     required this.title,
//     required this.slug,
//     required this.description,
//     required this.abstractText,
//     required this.coverImage,
//     required this.status,
//     required this.accessLevel,
//     required this.readTime,
//     required this.viewsCount,
//     required this.likesCount,
//     required this.commentsCount,
//     required this.averageRating,
//     required this.isFeatured,
//     required this.publishedAt,
//     required this.createdAt,
//     this.authorName,
//     this.categoryName,
//   });

//   factory ArticleItemModel.fromJson(Map<String, dynamic> json) {
//     return ArticleItemModel(
//       id: json['id'],
//       title: json['title'] ?? '',
//       slug: json['slug'] ?? '',
//       description: json['description'] ?? '',
//       abstractText: json['abstract'] ?? '',
//       coverImage: json['cover_image'],
//       status: json['status'] ?? '',
//       authorName: json["author"]?["username"],
//       categoryName: json["category"]?["name"],
//       accessLevel: json['access_level'] ?? '',
//       readTime: json['read_time'] ?? 0,
//       viewsCount: json['views_count'] ?? 0,
//       likesCount: json['likes_count'] ?? 0,
//       commentsCount: json['comments_count'] ?? 0,
//       averageRating: (json['average_rating'] ?? 0).toDouble(),
//       isFeatured: json['is_featured'] ?? false,
//       publishedAt: json['published_at'] ?? '',
//       createdAt: json['created_at'] ?? '',
//     );
//   }
// }
