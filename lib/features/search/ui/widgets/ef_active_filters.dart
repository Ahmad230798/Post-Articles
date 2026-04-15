import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

import '../../cubit/explore_filters_cubit.dart';
import '../../cubit/explore_filters_state.dart';
import '../../../home/models/category_model.dart';

/// 🔥 لازم يكون فوق EFActiveFilters
class _FilterChipData {
  final String label;
  final VoidCallback onRemove;

  _FilterChipData({required this.label, required this.onRemove});
}

class EFActiveFilters extends StatelessWidget {
  final List<CategoryModel> categories;

  const EFActiveFilters({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreFiltersCubit, ExploreFiltersState>(
      builder: (context, state) {
        final cubit = context.read<ExploreFiltersCubit>();

        final List<_FilterChipData> filters = [];

        // Category
        if (categories.isNotEmpty) {
          filters.add(
            _FilterChipData(
              label: categories[state.selectedCategory].name,
              onRemove: () => cubit.selectCategory(0, categories),
            ),
          );
        }

        // Price Range
        if (state.minPrice > 0 || state.maxPrice < 500) {
          filters.add(
            _FilterChipData(
              label:
                  "\$${state.minPrice.toInt()} - \$${state.maxPrice.toInt()}",
              onRemove: () => cubit.updateRange(0, 500),
            ),
          );
        }

        // Sort
        if (state.selectedSort != "Most Relevant") {
          filters.add(
            _FilterChipData(
              label: state.selectedSort,
              onRemove: () => cubit.updateSort("Most Relevant"),
            ),
          );
        }

        // Rating
        if (state.selectedRating > 0) {
          filters.add(
            _FilterChipData(
              label: "${state.selectedRating}+ Stars",
              onRemove: () => cubit.updateRating(0),
            ),
          );
        }

        // Tags
        for (var tag in state.selectedTags) {
          filters.add(
            _FilterChipData(label: tag, onRemove: () => cubit.toggleTag(tag)),
          );
        }

        // Search Query
        if (state.searchQuery.isNotEmpty) {
          filters.add(
            _FilterChipData(
              label: "Search: ${state.searchQuery}",
              onRemove: () => cubit.updateSearch(""),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Active Filters",
                style: AppTextStyle.font14regularGrey.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColor.textDark,
                ),
              ),

              SizedBox(height: 12.h),

              if (filters.isEmpty)
                Text(
                  "No active filters",
                  style: AppTextStyle.font14regularGrey.copyWith(
                    color: AppColor.grey,
                  ),
                )
              else
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: filters.map((f) => _chip(f)).toList(),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _chip(_FilterChipData data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColor.accent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColor.accent.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            data.label,
            style: AppTextStyle.font14regularGrey.copyWith(
              color: AppColor.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 4.w),
          GestureDetector(
            onTap: data.onRemove,
            child: Icon(Icons.close, size: 16.sp, color: AppColor.accent),
          ),
        ],
      ),
    );
  }
}
