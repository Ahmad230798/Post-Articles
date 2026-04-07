import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/explore_cubit.dart';
import '../cubit/explore_state.dart';

class ExActiveFilters extends StatelessWidget {
  const ExActiveFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        final cubit = context.read<ExploreCubit>();
        final filters = <Widget>[];

        if (state.searchQuery.isNotEmpty) {
          filters.add(
            _chip("Search: ${state.searchQuery}", () => cubit.updateSearch("")),
          );
        }
        if (state.selectedRating > 0) {
          filters.add(
            _chip(
              "${state.selectedRating}+ Stars",
              () => cubit.updateRating(0),
            ),
          );
        }
        if (state.selectedSort != "Most Popular") {
          filters.add(
            _chip(state.selectedSort, () => cubit.updateSort("Most Popular")),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: filters.isEmpty
              ? const Text("No active filters")
              : Wrap(spacing: 8, runSpacing: 8, children: filters),
        );
      },
    );
  }

  Widget _chip(String label, VoidCallback onRemove) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: onRemove,
            child: const Icon(Icons.close, size: 16, color: Colors.teal),
          ),
        ],
      ),
    );
  }
}
