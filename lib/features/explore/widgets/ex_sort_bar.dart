import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/explore_cubit.dart';
import '../cubit/explore_state.dart';

class ExSortBar extends StatelessWidget {
  const ExSortBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreCubit, ExploreState>(
      builder: (context, state) {
        final cubit = context.read<ExploreCubit>();

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${state.articles.length} Results Found",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A365D),
                ),
              ),
              DropdownButton<String>(
                value: state.selectedSort,
                items: const [
                  DropdownMenuItem(
                    value: "Most Relevant",
                    child: Text("Most Relevant"),
                  ),
                  DropdownMenuItem(
                    value: "Newest Arrivals",
                    child: Text("Newest Arrivals"),
                  ),
                  DropdownMenuItem(
                    value: "Price: High to Low",
                    child: Text("Price: High to Low"),
                  ),
                ],

                onChanged: (val) {
                  if (val != null) cubit.updateSort(val);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
