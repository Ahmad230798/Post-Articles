import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/widgets/app_text_form_field.dart';
import '../cubit/explore_cubit.dart';
import '../cubit/explore_state.dart';

class ExSearchBar extends StatelessWidget {
  const ExSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        final cubit = context.read<ExploreCubit>();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AppTextFormField(
            hinttText: "Search articles...",
            suffixIcone: const Icon(Icons.search),
            isObscureText: false,
            // عند الكتابة نحدث الـ searchQuery
            onChanged: (val) => cubit.updateSearch(val),
          ),
        );
      },
    );
  }
}
