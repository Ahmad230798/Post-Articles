import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/core/widgets/app_top_nav_bar.dart';
import 'package:flutter_project/core/widgets/category_pills.dart';
import 'package:flutter_project/features/saved/logic/cubit/saved_articals_cubit.dart';
import 'package:flutter_project/features/saved/logic/cubit/saved_articals_state.dart';
import 'package:flutter_project/features/saved/models/saved_articals_model.dart';
import 'package:flutter_project/features/saved/repo/saved_articals_repo.dart';
import 'package:flutter_project/features/saved/widgets/artice_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/saved_header.dart';
import '../widgets/empty_state.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  // 🔥 بيانات مؤقتة لعرضها باستخدام ArticleModel الجديد
  List<SavedArticleModel> get savedArticlesList => [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SavedArticalsCubit(SavedArticalsRepo(api: ApiServices()))
            ..getSavedArticals(),
      child: BlocConsumer<SavedArticalsCubit, SavedArticalsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SavedArticalsStateFailure) {
            return Scaffold(
              backgroundColor: const Color(0xFFF7FAFC),
              body: Center(
                child: Text(
                  "Failed to load saved articles. Please try again.",
                  style: TextStyle(fontSize: 16.sp, color: Colors.red),
                ),
              ),
            );
          }
          if (state is SavedArticalsStateLoading) {
            return Scaffold(
              backgroundColor: const Color(0xFFF7FAFC),
              body: Center(
                child: CircularProgressIndicator(
                  color: const Color(0xFF1A365D),
                ),
              ),
            );
          }

          final savedArticles = (state is SavedArticalsStateSuccess)
              ? state.articals
              : [];

          return Scaffold(
            backgroundColor: const Color(0xFFF7FAFC),

            body: Stack(
              children: [
                Column(
                  children: [
                    const AppTopNavBar(
                      title: "ScholarLink",
                      showBack: true,
                      actions: [
                        Icon(Icons.notifications, color: Color(0xFF1A365D)),
                      ],
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                          left: 24.w,
                          right: 24.w,
                          top: 24.h,
                          bottom: 24.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SavedHeader(articlesCount: savedArticles.length),
                            SizedBox(height: 24.h),

                            const CategoryPills(
                              variant: CategoryVariant.pills,
                              categories: [
                                "All Library",
                                "Neuroscience",
                                "Quantum Physics",
                                "Economics",
                              ],
                              activeIndex: 0,
                            ),

                            SizedBox(height: 24.h),

                            // Grid
                            LayoutBuilder(
                              builder: (context, constraints) {
                                final isWide = constraints.maxWidth >= 700;
                                return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: isWide ? 2 : 1,
                                        crossAxisSpacing: 24.w,
                                        mainAxisSpacing: 24.h,
                                        childAspectRatio: 16 / 16.2,
                                      ),
                                  itemCount: savedArticles.length,
                                  itemBuilder: (context, index) {
                                    return SavedArticleCard(
                                      article: savedArticles[index],
                                    );
                                  },
                                );
                              },
                            ),

                            SizedBox(height: 40.h),
                            const EmptyState(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
