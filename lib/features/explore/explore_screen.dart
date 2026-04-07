import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/explore/widgets/ex_articles_grid.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/app_top_nav_bar.dart';
import '../../core/widgets/category_pills.dart';
import '../../core/widgets/article_card.dart';

import 'cubit/explore_cubit.dart';
import 'cubit/explore_state.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExploreCubit()..fetchArticles(),
      child: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          final cubit = context.read<ExploreCubit>();

          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  // 🔹 Top Navigation
                  AppTopNavBar(
                    title: "Explore",
                    showBack: false,
                    trailing: IconButton(
                      icon: const Icon(Icons.search, color: Color(0xFF319795)),
                      onPressed: () {
                        // ممكن نفتح صفحة بحث أو نعمل SearchBar
                      },
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // 🔹 Categories
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CategoryPills(
                      variant: CategoryVariant.pills,
                      categories: const [
                        "Trending",
                        "Tech",
                        "Business",
                        "Lifestyle",
                      ],
                      activeIndex: state.selectedCategory,
                      onTap: cubit.selectCategory,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // 🔹 Sort Bar
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${state.articles.length} Results Found",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1A365D),
                          ),
                        ),
                        DropdownButton<String>(
                          value: state.selectedSort,
                          items: const [
                            DropdownMenuItem(
                              value: "Most Popular",
                              child: Text("Most Popular"),
                            ),
                            DropdownMenuItem(
                              value: "Newest",
                              child: Text("Newest"),
                            ),
                            DropdownMenuItem(
                              value: "Most Shared",
                              child: Text("Most Shared"),
                            ),
                          ],
                          onChanged: (val) {
                            if (val != null) cubit.updateSort(val);
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // 🔹 Articles Grid
                  Expanded(
                    child:
                        ExArticlesGrid(), // ← هون رح يستخدم الـ ListView بدل GridView
                  ),
                ],
              ),
            ),

            // 🔹 Floating Filter Button
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xFF319795),
              child: const Icon(Icons.tune, color: Colors.white),
              onPressed: () async {
                final filters = await Navigator.pushNamed(
                  context,
                  "/exploreFiltersScreen",
                );
                if (filters is ExploreState) {
                  cubit.applyFilters(filters);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
