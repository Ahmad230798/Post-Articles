import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/app_top_nav_bar.dart';
import 'package:flutter_project/core/widgets/article_card.dart';
import 'package:flutter_project/core/widgets/category_pills.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/saved_header.dart';
import '../widgets/empty_state.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          return GridView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isWide ? 2 : 1,
                                  crossAxisSpacing: 24.w,
                                  mainAxisSpacing: 24.h,
                                  childAspectRatio: 16 / 16.2,
                                ),
                            children: const [
                              ArticleCard(
                                image: 'assets/images/articles/article1.png',
                                category: 'Neuroscience',
                                readTime: '12 min read',
                                title:
                                    'Neural Plasticity in Adult Learning: New Frontiers',
                                description:
                                    'Recent breakthroughs in fMRI mapping suggest that the adult brain maintains higher levels of synaptic flexibility than previously recorded...',
                                authorAvatar: 'assets/images/profile.png',
                                authorName: 'Dr. Elena Rostova',
                                isSaved: true,
                              ),
                              ArticleCard(
                                image: 'assets/images/articles/article2.png',
                                category: 'Quantum Theory',
                                readTime: '18 min read',
                                title:
                                    'Entanglement and the Architecture of Spacetime',
                                description:
                                    'Exploring the ER=EPR conjecture and how quantum information might be the very fabric that holds our universe together...',
                                authorAvatar: 'assets/images/profile.png',
                                authorName: 'Prof. Julian Thorne',
                                isSaved: true,
                              ),
                              ArticleCard(
                                image: 'assets/images/articles/article3.png',
                                category: 'Economics',
                                readTime: '8 min read',
                                title:
                                    'The Post-Digital Economy: Value Beyond Data',
                                description:
                                    'An analytical review of emerging resource-based economic models in decentralized digital ecosystems and their societal impact...',
                                authorAvatar: 'assets/images/profile.png',
                                authorName: 'Sarah Chen, PhD',
                                isSaved: true,
                              ),
                              ArticleCard(
                                image: 'assets/images/articles/article4.png',
                                category: 'Biology',
                                readTime: '15 min read',
                                title:
                                    'CRISPR 3.0: Ethical Boundaries of Gene Editing',
                                description:
                                    'Navigating the moral landscape of precision genomic modifications in the next decade of therapeutic advancements...',
                                authorAvatar: 'assets/images/profile.png',
                                authorName: 'Dr. Marcus Vane',
                                isSaved: true,
                              ),
                            ],
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
