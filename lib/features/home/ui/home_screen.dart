import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/widgets/category_pills.dart';
import 'package:flutter_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_project/features/home/cubit/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/widgets/article_card.dart';
import 'package:flutter_project/core/routing/routes.dart';

import 'widgets/home_header.dart';
import 'widgets/home_hero_story.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return Scaffold(
          backgroundColor: AppColor.backgroundLight,

          // 🔹 SideMenu (Drawer)
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: AppColor.accent),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          "assets/images/profile.png",
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Majd",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "majd@example.com",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                _drawerItem(context, Icons.explore, "Explore", Routes.main),
                _drawerItem(
                  context,
                  Icons.bookmark,
                  "Saved",
                  Routes.savedScreen,
                ),
                _drawerItem(
                  context,
                  Icons.person,
                  "Profile",
                  Routes.userProfileScreen,
                ),
                _drawerItem(
                  context,
                  Icons.settings,
                  "Settings",
                  Routes.settingScreen,
                ),
                _drawerItem(
                  context,
                  Icons.comment,
                  "Comments",
                  Routes.commentsScreen,
                ),
                SizedBox(height: 280.h),
                _drawerItem(
                  context,
                  Icons.logout,
                  "Logout",
                  Routes.onBoardingScreen,
                ),
              ],
            ),
          ),

          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: HomeHeader()),

                SliverToBoxAdapter(
                  child: CategoryPills(
                    variant: CategoryVariant.tabs,
                    categories: state.categories.map((c) => c.name).toList(),
                    activeIndex: state.activeCategory,
                    onTap: cubit.changeCategory,
                  ),
                ),

                SliverToBoxAdapter(
                  child: HomeHeroStory(article: state.featuredArticle),
                ),

                SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      "Latest Stories",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ),

                if (state.isLoading)
                  const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  )
                else
                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final item = state.articles[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.articleDetailsScreen,
                                arguments: item, // لازم يكون ArticleModel
                              );
                            },
                            child: ArticleCard(article: item),
                          ),
                        );
                      }, childCount: state.articles.length),
                    ),
                  ),

                SliverToBoxAdapter(child: SizedBox(height: 80.h)),
              ],
            ),
          ),

          // 🔹 Floating Publish Button
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.accent,
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, Routes.publishStep1Screen);
            },
          ),
        );
      },
    );
  }

  // 🔹 Helper for Drawer Items
  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String title,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColor.accent),
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
