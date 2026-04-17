import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/search/cubit/explore_filters_state.dart';
import '../cubit/explore_cubit.dart';

class ExFabButton extends StatelessWidget {
  const ExFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExploreCubit>();

    return FloatingActionButton(
      heroTag: 'explore_filters_fab',
      backgroundColor: const Color(0xFF319795),
      child: const Icon(Icons.tune, color: Colors.white),
      onPressed: () async {
        final filters = await Navigator.pushNamed(
          context,
          "/exploreFiltersScreen",
        );
        if (filters is ExploreFiltersState) {
          cubit.applyFilters(filters);
        }
      },
    );
  }
}
