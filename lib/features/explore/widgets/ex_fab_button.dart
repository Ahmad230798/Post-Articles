import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/explore_cubit.dart';
import '../cubit/explore_state.dart';

class ExFabButton extends StatelessWidget {
  const ExFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExploreCubit>();

    return FloatingActionButton(
      backgroundColor: const Color(0xFF319795),
      child: const Icon(Icons.tune, color: Colors.white),
      onPressed: () async {
        final filters = await Navigator.pushNamed(context, "/exploreFilters");
        if (filters is ExploreState) {
          cubit.applyFilters(filters);
        }
      },
    );
  }
}
