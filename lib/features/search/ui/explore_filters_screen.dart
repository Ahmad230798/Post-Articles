import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/search/cubit/explore_filters_cubit.dart';
import 'package:flutter_project/features/search/cubit/explore_filters_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/app_top_nav_bar.dart';
import '../../../core/widgets/category_pills.dart';

import 'widgets/ef_search_bar.dart';
import 'widgets/ef_active_filters.dart';
import 'widgets/ef_price_range.dart';
import 'widgets/ef_sort_by.dart';
import 'widgets/ef_rating.dart';
import 'widgets/ef_apply_button.dart';

class ExploreFiltersScreen extends StatelessWidget {
  const ExploreFiltersScreen({super.key});

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

                      SliverToBoxAdapter(child: EFActiveFilters()),

                      SliverToBoxAdapter(
                        child: CategoryPills(
                          variant: CategoryVariant.tiles,
                          categories: ["Audio", "Mobile"],
                          activeIndex: state.selectedCategory,
                          onTap: cubit.selectCategory,
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
