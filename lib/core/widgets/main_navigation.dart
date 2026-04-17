import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/widgets/app_bottom_nav.dart';
import 'package:flutter_project/features/explore/explore_screen.dart';
import 'package:flutter_project/features/home/ui/home_screen.dart';
import 'package:flutter_project/features/my_profile/ui/my_profile.dart';
import 'package:flutter_project/features/saved/ui/saved_screen.dart';
import 'package:flutter_project/features/home/cubit/home_cubit.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: [
            HomeScreen(),
            const ExploreScreen(),
            const SavedScreen(),
            const MyProfile(),
          ],
        ),
        bottomNavigationBar: AppBottomNav(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() => currentIndex = index);

            // 🔹 إذا رجعت على الـ Home tab، يعمل refresh
            if (index == 0) {
              context.read<HomeCubit>().loadInitialData();
            }
          },
        ),
      ),
    );
  }
}
