import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/widgets/article_card.dart';
import '../cubit/explore_cubit.dart';
import '../cubit/explore_state.dart';

class ExArticlesGrid extends StatelessWidget {
  const ExArticlesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: state.articles.length,
          itemBuilder: (context, index) {
            final article = state.articles[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ArticleCard(
                image: article.image,
                category: article.category,
                title: article.title,
                readTime: article.readTime,
                description: article.description,
                likes: article.likes,
                shares: article.shares,
                authorAvatar: article.authorAvatar,
                authorName: article.authorName,
                isSaved: article.isSaved,
              ),
            );
          },
        );
      },
    );
  }
}
