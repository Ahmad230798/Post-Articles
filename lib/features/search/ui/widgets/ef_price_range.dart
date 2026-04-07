import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';

import '../../cubit/explore_filters_cubit.dart';
import '../../cubit/explore_filters_state.dart';

class EFPriceRange extends StatelessWidget {
  const EFPriceRange({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreFiltersCubit, ExploreFiltersState>(
      builder: (context, state) {
        final cubit = context.read<ExploreFiltersCubit>();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price Range",
                style: AppTextStyle.font16boldgray.copyWith(
                  color: AppColor.textDark,
                ),
              ),

              SizedBox(height: 24.h),

              // 🔥 RangeSlider الحقيقي
              RangeSlider(
                values: RangeValues(state.minPrice, state.maxPrice),
                min: 0,
                max: 500,
                activeColor: AppColor.accent,
                inactiveColor: AppColor.grey.withOpacity(0.3),
                onChanged: (values) {
                  cubit.updateRange(values.start, values.end);
                },
              ),

              SizedBox(height: 12.h),

              // Min / Max labels
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _priceLabel("Min Price", "\$${state.minPrice.toInt()}"),
                  _priceLabel("Max Price", "\$${state.maxPrice.toInt()}"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _priceLabel(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.font12regularWhite70.copyWith(
            color: AppColor.grey,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: AppTextStyle.font16boldgray.copyWith(color: AppColor.textDark),
        ),
      ],
    );
  }
}
