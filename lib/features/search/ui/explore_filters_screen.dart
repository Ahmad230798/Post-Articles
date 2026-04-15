import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/search/cubit/explore_filters_cubit.dart';
import 'package:flutter_project/features/search/cubit/explore_filters_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/app_top_nav_bar.dart';
import '../../../core/widgets/category_pills.dart';
import '../../../features/home/models/category_model.dart';
import '../../../features/home/repository/category_repository.dart';

import 'widgets/ef_search_bar.dart';
import 'widgets/ef_active_filters.dart';
import 'widgets/ef_price_range.dart';
import 'widgets/ef_sort_by.dart';
import 'widgets/ef_rating.dart';
import 'widgets/ef_apply_button.dart';

class ExploreFiltersScreen extends StatefulWidget {
  const ExploreFiltersScreen({super.key});

  @override
  State<ExploreFiltersScreen> createState() => _ExploreFiltersScreenState();
}

class _ExploreFiltersScreenState extends State<ExploreFiltersScreen> {
  final CategoryRepository _categoryRepo = CategoryRepository();
  List<CategoryModel> categories = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final data = await _categoryRepo.getCategories();
    setState(() {
      categories = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExploreFiltersCubit(),
      child: BlocBuilder<ExploreFiltersCubit, ExploreFiltersState>(
        builder: (context, state) {
          final cubit = context.read<ExploreFiltersCubit>();

          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: AppTopNavBar(
                          title: "Filters",
                          showBack: true,
                          centerTitle: true,
                          trailing: TextButton(
                            onPressed: cubit.resetFilters,
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF319795),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: EFSearchBar(onChanged: cubit.updateSearch),
                      ),

                      SliverToBoxAdapter(
                        child: EFActiveFilters(categories: categories),
                      ),

                      SliverToBoxAdapter(
                        child: loading
                            ? const Center(child: CircularProgressIndicator())
                            : CategoryPills(
                                variant: CategoryVariant.tiles,
                                categories: categories
                                    .map((c) => c.name)
                                    .toList(),
                                activeIndex: state.selectedCategory,
                                onTap: (i) =>
                                    cubit.selectCategory(i, categories),
                              ),
                      ),

                      SliverToBoxAdapter(child: EFPriceRange()),

                      SliverToBoxAdapter(
                        child: EFSortBy(
                          selected: state.selectedSort,
                          onSelect: cubit.updateSort,
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: EFRating(
                          selectedRating: state.selectedRating,
                          onSelect: cubit.updateRating,
                        ),
                      ),

                      SliverToBoxAdapter(child: SizedBox(height: 120.h)),
                    ],
                  ),

                  EFApplyButton(
                    onApply: () {
                      Navigator.pop(context, state);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
