import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/app_bottom_nav.dart';
import 'package:flutter_project/features/explore/explore_screen.dart';
import 'package:flutter_project/features/home/ui/home_screen.dart';
import 'package:flutter_project/features/my_profile/ui/my_profile.dart';
import 'package:flutter_project/features/saved/ui/saved_screen.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_project/features/saved/logic/cubit/saved_articals_cubit.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          ExploreScreen(),
          SavedScreen(),
          MyProfile(),
        ],
      ),

      // ✔️ زر البوست يظهر فقط في الهوم
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
              heroTag: "main_fab",
              backgroundColor: AppColor.accent,
              child: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, Routes.publishStep1Screen);
              },
            )
          : null,

      bottomNavigationBar: AppBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);

          if (index == 0) {
            context.read<HomeCubit>().loadInitialData();
          }

          if (index == 2) {
            context.read<SavedArticalsCubit>().getSavedArticals();
          }
        },
      ),
    );
  }
}
