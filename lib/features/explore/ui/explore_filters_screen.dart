import 'package:flutter/material.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                /// 🔵 AppBar المشترك بدل EFHeader
                SliverToBoxAdapter(
                  child: AppTopNavBar(
                    title: "Filters",
                    showBack: true,
                    centerTitle: true,
                    trailing: TextButton(
                      onPressed: () {
                        // TODO: Reset logic
                      },
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

                SliverToBoxAdapter(child: EFSearchBar()),
                SliverToBoxAdapter(child: EFActiveFilters()),
                SliverToBoxAdapter(child: SizedBox(height: 12.h)),

                /// 🔵 استدعاء الـ CategoryPills المشترك بدل EFCategories
                SliverToBoxAdapter(
                  child: CategoryPills(
                    variant: CategoryVariant.tiles,
                    categories: ["Audio", "Mobile"],
                  ),
                ),

                SliverToBoxAdapter(child: EFPriceRange()),
                SliverToBoxAdapter(child: EFSortBy()),
                SliverToBoxAdapter(child: EFRating()),
                SliverToBoxAdapter(child: SizedBox(height: 120.h)),
              ],
            ),

            /// Sticky Bottom Button
            const EFApplyButton(),
          ],
        ),
      ),
    );
  }
}
