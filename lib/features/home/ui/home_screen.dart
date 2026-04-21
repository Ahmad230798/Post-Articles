import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/services/services.dart';
import 'package:flutter_project/core/widgets/category_pills.dart';
import 'package:flutter_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_project/features/home/cubit/home_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/widgets/article_card.dart';
import 'package:flutter_project/core/routing/routes.dart';

import 'widgets/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final user = state.user;

        return Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: AppColor.accent),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(
                          "assets/images/profile.png",
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (user != null)
                        Text(
                          user.username,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (user != null)
                        Text(
                          user.email,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                ),
                _drawerItem(context, Icons.explore, "Explore", () {
                  Navigator.pushNamed(
                    context,
                    Routes.main,
                    // ignore: use_build_context_synchronously
                  ).then((_) => context.read<HomeCubit>().loadInitialData());
                }),
                _drawerItem(context, Icons.bookmark, "Saved", () {
                  Navigator.pushNamed(
                    context,
                    Routes.savedScreen,
                    // ignore: use_build_context_synchronously
                  ).then((_) => context.read<HomeCubit>().loadInitialData());
                }),
                _drawerItem(context, Icons.person, "Profile", () {
                  Navigator.pushNamed(
                    context,
                    Routes.myProfileScreen,
                    // ignore: use_build_context_synchronously
                  ).then((_) => context.read<HomeCubit>().loadInitialData());
                }),
                _drawerItem(context, Icons.settings, "Settings", () {
                  Navigator.pushNamed(
                    context,
                    Routes.settingScreen,
                    // ignore: use_build_context_synchronously
                  ).then((_) => context.read<HomeCubit>().loadInitialData());
                }),
                _drawerItem(context, Icons.comment, "Comments", () {
                  Navigator.pushNamed(
                    context,
                    Routes.commentsScreen,
                    // ignore: use_build_context_synchronously
                  ).then((_) => context.read<HomeCubit>().loadInitialData());
                }),
                SizedBox(height: 280.h),
                _drawerItem(context, Icons.logout, "Logout", () async {
                  final pref = SharedPreferencesService();
                  await pref.clearTokens();
                  context.pushAndRemoveUntil(
                    Routes.loginScreen,
                    predicate: (route) {
                      return false;
                    },
                  );
                }),
              ],
            ),
          ),

          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async => cubit.loadInitialData(),
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
                                  arguments: item,
                                ).then((_) => cubit.loadInitialData());
                              },
                              child: ArticleCard(article: item, user: user!),
                            ),
                          );
                        }, childCount: state.articles.length),
                      ),
                    ),

                  SliverToBoxAdapter(child: SizedBox(height: 80.h)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String title,

    void Function()? onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: AppColor.accent),
      title: Text(title),
      onTap: onTap,
    );
  }
}
