import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/app_top_nav_bar.dart';
import '../../core/widgets/category_pills.dart';
import '../../features/home/models/category_model.dart';
import '../../features/home/repository/category_repository.dart';

import 'cubit/explore_cubit.dart';
import 'cubit/explore_state.dart';
import 'widgets/ex_articles_grid.dart';
import 'widgets/ex_sort_bar.dart';
import 'widgets/ex_search_bar.dart';
import 'widgets/ex_active_filters.dart';
import 'widgets/ex_fab_button.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final CategoryRepository _categoryRepo = CategoryRepository();
  List<CategoryModel> categories = [];
  bool isCategoriesLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final data = await _categoryRepo.getCategories();
    setState(() {
      categories = data;
      isCategoriesLoading = false;
    });
  }

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
                      onPressed: () {},
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // 🔹 Search Bar
                  const ExSearchBar(),

                  // 🔹 Active Filters
                  const ExActiveFilters(),

                  SizedBox(height: 8.h),

                  // 🔹 Categories (Dynamic)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: isCategoriesLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CategoryPills(
                            variant: CategoryVariant.pills,
                            categories: categories.map((c) => c.name).toList(),
                            activeIndex: state.selectedCategory,
                            onTap: (index) =>
                                cubit.selectCategory(index, categories),
                          ),
                  ),

                  SizedBox(height: 12.h),

                  // 🔹 Sort Bar
                  const ExSortBar(),

                  SizedBox(height: 12.h),

                  // 🔹 Articles Grid
                  const Expanded(child: ExArticlesGrid()),
                ],
              ),
            ),

            // 🔹 Floating Filter Button
            floatingActionButton: const ExFabButton(),
          );
        },
      ),
    );
  }
}
