import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/widgets/article_card.dart';
import 'package:flutter_project/features/home/models/article_model.dart';
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

        if (state.articles.isEmpty) {
          return const Center(
            child: Text("No articles found", style: TextStyle(fontSize: 16)),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemCount: state.articles.length,
          itemBuilder: (context, index) {
            final ArticleModel article = state.articles[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ArticleCard(article: article),
            );
          },
        );
      },
    );
  }
}
