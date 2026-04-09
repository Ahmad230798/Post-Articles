import 'package:flutter_project/features/home/models/article_model.dart';

final dummyArticles = List.generate(
  5,
  (i) => ArticleModel(
    id: i,
    slug: "article-$i",
    title: "Trending Article $i",
    description: "This is a short description for article $i",
    coverImage: "https://picsum.photos/400/300?$i",
    categoryName: "Tech",
    authorName: "Author $i",
    readTime: 5,
    likesCount: i * 10,
    commentsCount: i * 2,
  ),
);
