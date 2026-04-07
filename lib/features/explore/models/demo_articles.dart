import '../models/article_model.dart';

final demoArticles = [
  {
    "id": 1,
    "title": "Quantum Leap: The New Era of Encryption Standards",
    "category": "Technology",
    "image": "assets/images/articles/article1.png",
    "likes": "1.2k",
    "shares": "89",
    "authorName": "Alice",
    "authorAvatar": "assets/images/articles/profile.png",
  },
  {
    "id": 2,
    "title": "Personalized Medicine: DNA Sequencing for Everyone",
    "category": "Health",
    "image": "assets/images/articles/article2.png",
    "likes": "856",
    "shares": "142",
    "authorName": "Bob",
    "authorAvatar": "assets/images/articles/profile.png",
  },
  {
    "id": 3,
    "title": "The Global Connectivity Mesh: Satellites vs Fiber",
    "category": "Science",
    "image": "assets/images/articles/article3.png",
    "likes": "2.4k",
    "shares": "312",
    "authorName": "Charlie",
    "authorAvatar": "assets/images/articles/profile.png",
  },
  {
    "id": 4,
    "title": "DeFi 2.0: Reshaping Global Capital Markets",
    "category": "Business",
    "image": "assets/images/articles/article4.png",
    "likes": "642",
    "shares": "54",
    "authorName": "Dana",
    "authorAvatar": "assets/images/articles/profile.png",
  },
  {
    "id": 5,
    "title": "AI in Everyday Life: Smart Assistants Revolution",
    "category": "Lifestyle",
    "image": "assets/images/articles/article5.png",
    "likes": "1.1k",
    "shares": "76",
    "authorName": "Eve",
    "authorAvatar": "assets/images/articles/profile.png",
  },
];

final demoArticleModels = demoArticles
    .map((json) => ArticleModel.fromJson(json))
    .toList();
