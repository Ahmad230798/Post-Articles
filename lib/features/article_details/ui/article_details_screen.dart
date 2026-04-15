import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/home/models/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/widgets/app_top_nav_bar.dart';

import '../cubit/article_details_cubit.dart';
import '../cubit/article_details_state.dart';
import '../repository/article_details_repository.dart';

import 'widgets/ad_hero_image.dart';
import 'widgets/ad_title_section.dart';
import 'widgets/ad_author_section.dart';
import 'widgets/ad_action_buttons.dart';
import 'widgets/ad_body_content.dart';
import 'widgets/rating_section.dart';
import 'widgets/comments_section.dart';
import 'widgets/related_articles_section.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// 🔵 استقبل ArticleModel كامل من الـ Navigator
    final article = ModalRoute.of(context)!.settings.arguments as ArticleModel;
    final slug = article.slug;

    return BlocProvider(
      create: (_) => ArticleDetailsCubit(ArticleDetailsRepository())
        ..loadArticle(slug)
        ..loadRelated(article.categoryName ?? ""),
      child: BlocBuilder<ArticleDetailsCubit, ArticleDetailsState>(
        builder: (context, state) {
          final cubit = context.read<ArticleDetailsCubit>();

          /// 🔵 استخدم بيانات الـ API إذا وصلت، وإلا استخدم بيانات الـ arguments
          final current = state.article ?? article;

          return Scaffold(
            backgroundColor: AppColor.backgroundLight,
            body: SafeArea(
              child: state.loading && state.article == null
                  ? const Center(child: CircularProgressIndicator())
                  : state.error != null
                  ? Center(child: Text(state.error!))
                  : CustomScrollView(
                      slivers: [
                        /// 🔵 AppBar
                        SliverToBoxAdapter(
                          child: AppTopNavBar(
                            title: "Article Details",
                            showBack: true,
                            centerTitle: false,
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: Color(0xFF1A365D),
                              ),
                            ),
                          ),
                        ),

                        /// 🔵 Hero Image
                        SliverToBoxAdapter(
                          child: ADHeroImage(imageUrl: current.coverImage),
                        ),

                        /// 🔵 Title Section
                        SliverToBoxAdapter(
                          child: ADTitleSection(
                            category: current.categoryName ?? "",
                            title: current.title,
                          ),
                        ),

                        /// 🔵 Author Section
                        SliverToBoxAdapter(
                          child: ADAuthorSection(
                            authorName: current.authorName ?? "",
                            readTime: current.readTime ?? 0,
                          ),
                        ),

                        /// 🔵 Rating Section
                        SliverToBoxAdapter(
                          child: ADRatingSection(
                            rating: current.averageRating ?? "0",
                          ),
                        ),

                        /// 🔵 Action Buttons
                        SliverToBoxAdapter(
                          child: ADActionsButtons(
                            isBookmarked: state.isBookmarked,
                            onBookmark: () => cubit.toggleBookmark(slug),
                            onCite: () => cubit.loadCitation(slug),
                            onLike: () {},
                          ),
                        ),

                        /// 🔵 Body Content
                        SliverToBoxAdapter(
                          child: ADBodyContent(
                            description: current.description ?? "",
                            abstractText: current.abstractText ?? "",
                          ),
                        ),

                        /// 🔵 Comments Section
                        SliverToBoxAdapter(
                          child: ADCommentsSection(slug: slug),
                        ),

                        /// 🔵 Related Articles
                        SliverToBoxAdapter(child: ADRelatedArticles()),

                        SliverToBoxAdapter(child: SizedBox(height: 80.h)),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
