class NotificationResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<NotificationArticleModel> results;

  NotificationResponseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      count: json['count'] ?? 0,
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List? ?? [])
          .map((e) => NotificationArticleModel.fromJson(e))
          .toList(),
    );
  }
}

class NotificationArticleModel {
  final int id;
  final String title;
  final String slug;
  final String description;
  final String abstractText;
  final String? coverImage;
  final String status;
  final String accessLevel;
  final int readTime;
  final int viewsCount;
  final int likesCount;
  final int commentsCount;
  final double averageRating;
  final bool isFeatured;
  final String publishedAt;
  final String createdAt;
  bool isLiked;
  final bool isSaved;

  final NotificationAuthorModel sender;
  final NotificationCategoryModel category;

  NotificationArticleModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.abstractText,
    required this.coverImage,
    required this.status,
    required this.accessLevel,
    required this.readTime,
    required this.viewsCount,
    required this.likesCount,
    required this.commentsCount,
    required this.averageRating,
    required this.isFeatured,
    required this.publishedAt,
    required this.createdAt,
    required this.isLiked,
    required this.isSaved,
    required this.sender,
    required this.category,
  });

  factory NotificationArticleModel.fromJson(Map<String, dynamic> json) {
    return NotificationArticleModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['message'] ?? '',
      abstractText: json['abstract'] ?? '',
      coverImage: json['cover_image'],
      status: json['status'] ?? '',
      accessLevel: json['access_level'] ?? '',
      readTime: json['read_time'] ?? 0,
      viewsCount: json['views_count'] ?? 0,
      likesCount: json['likes_count'] ?? 0,
      commentsCount: json['comments_count'] ?? 0,
      averageRating: (json['average_rating'] ?? 0).toDouble(),
      isFeatured: json['is_featured'] ?? false,
      publishedAt: json['published_at'] ?? '',
      createdAt: json['created_at'] ?? '',
      isLiked: json['is_read'] ?? false,
      isSaved: json['is_saved'] ?? false,
      sender: NotificationAuthorModel.fromJson(json['sender'] ?? {}),
      category: NotificationCategoryModel.fromJson(json['category'] ?? {}),
    );
  }
  NotificationArticleModel copyWith({bool? isRead}) {
    return NotificationArticleModel(
      id: id,
      title: title,
      slug: slug,
      description: description,
      abstractText: abstractText,
      coverImage: coverImage,
      status: status,
      accessLevel: accessLevel,
      readTime: readTime,
      viewsCount: viewsCount,
      likesCount: likesCount,
      commentsCount: commentsCount,
      averageRating: averageRating,
      isFeatured: isFeatured,
      publishedAt: publishedAt,
      createdAt: createdAt,
      isLiked: isLiked,
      isSaved: isSaved,
      sender: sender,
      category: category,
    );
  }
}

class NotificationAuthorModel {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String? avatar;
  final String institution;
  final String academicStatus;

  NotificationAuthorModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.institution,
    required this.academicStatus,
  });

  factory NotificationAuthorModel.fromJson(Map<String, dynamic> json) {
    return NotificationAuthorModel(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      avatar: json['avatar'],
      institution: json['institution'] ?? '',
      academicStatus: json['academic_status'] ?? '',
    );
  }
}

class NotificationCategoryModel {
  final int id;
  final String name;
  final String slug;
  final String icon;
  final String description;
  final int articlesCount;

  NotificationCategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.icon,
    required this.description,
    required this.articlesCount,
  });

  factory NotificationCategoryModel.fromJson(Map<String, dynamic> json) {
    return NotificationCategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      icon: json['icon'] ?? '',
      description: json['description'] ?? '',
      articlesCount: json['articles_count'] ?? 0,
    );
  }
}
