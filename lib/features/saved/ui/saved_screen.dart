import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/app_top_nav_bar.dart';
import 'package:flutter_project/core/widgets/article_card.dart';
import 'package:flutter_project/core/widgets/category_pills.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/saved_header.dart';
import '../widgets/empty_state.dart';
import 'package:flutter_project/features/home/models/article_model.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  // 🔥 بيانات مؤقتة لعرضها باستخدام ArticleModel الجديد
  List<ArticleModel> get dummySavedArticles => [
    ArticleModel(
      id: 1,
      slug: "neural-plasticity",
      title: "Neural Plasticity in Adult Learning: New Frontiers",
      description:
          "Recent breakthroughs in fMRI mapping suggest that the adult brain maintains higher levels of synaptic flexibility...",
      coverImage: "https://picsum.photos/400/300?1",
      categoryName: "Neuroscience",
      authorName: "Dr. Elena Rostova",
      readTime: 12,
      likesCount: 1200,
      commentsCount: 42,
    ),
    ArticleModel(
      id: 2,
      slug: "quantum-spacetime",
      title: "Entanglement and the Architecture of Spacetime",
      description:
          "Exploring the ER=EPR conjecture and how quantum information might shape the universe...",
      coverImage: "https://picsum.photos/400/300?2",
      categoryName: "Quantum Theory",
      authorName: "Prof. Julian Thorne",
      readTime: 18,
      likesCount: 856,
      commentsCount: 142,
    ),
    ArticleModel(
      id: 3,
      slug: "post-digital-economy",
      title: "The Post-Digital Economy: Value Beyond Data",
      description:
          "An analytical review of emerging resource-based economic models...",
      coverImage: "https://picsum.photos/400/300?3",
      categoryName: "Economics",
      authorName: "Sarah Chen, PhD",
      readTime: 8,
      likesCount: 642,
      commentsCount: 54,
    ),
    ArticleModel(
      id: 4,
      slug: "crispr-3-ethics",
      title: "CRISPR 3.0: Ethical Boundaries of Gene Editing",
      description:
          "Navigating the moral landscape of precision genomic modifications...",
      coverImage: "https://picsum.photos/400/300?4",
      categoryName: "Biology",
      authorName: "Dr. Marcus Vane",
      readTime: 15,
      likesCount: 3090,
      commentsCount: 312,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final savedArticles = dummySavedArticles;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),

      body: Stack(
        children: [
          Column(
            children: [
              const AppTopNavBar(
                title: "ScholarLink",
                showBack: true,
                actions: [Icon(Icons.notifications, color: Color(0xFF1A365D))],
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    right: 24.w,
                    top: 24.h,
                    bottom: 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SavedHeader(),
                      SizedBox(height: 24.h),

                      const CategoryPills(
                        variant: CategoryVariant.pills,
                        categories: [
                          "All Library",
                          "Neuroscience",
                          "Quantum Physics",
                          "Economics",
                        ],
                        activeIndex: 0,
                      ),

                      SizedBox(height: 24.h),

                      // Grid
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth >= 700;
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isWide ? 2 : 1,
                                  crossAxisSpacing: 24.w,
                                  mainAxisSpacing: 24.h,
                                  childAspectRatio: 16 / 16.2,
                                ),
                            itemCount: savedArticles.length,
                            itemBuilder: (context, index) {
                              return ArticleCard(article: savedArticles[index]);
                            },
                          );
                        },
                      ),

                      SizedBox(height: 40.h),
                      const EmptyState(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
