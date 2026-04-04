import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/category_pills.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/widgets/article_card.dart';
import 'package:flutter_project/core/widgets/app_bottom_nav.dart';

import 'widgets/home_header.dart';
import 'widgets/home_hero_story.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundLight,

      // 🔵 الشريط السفلي المشترك
      bottomNavigationBar: AppBottomNav(
        currentIndex: 0,
        onTap: (index) {
          // TODO: Navigate to page
        },
      ),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 🔵 الهيدر
            SliverToBoxAdapter(child: HomeHeader()),

            // 🔵 التصنيفات
            SliverToBoxAdapter(
              child: CategoryPills(
                variant: CategoryVariant.tabs,
                categories: [
                  "Featured",
                  "Technology",
                  "Health",
                  "Science",
                  "Business",
                ],
                activeIndex: 0,
              ),
            ),

            // 🔵 القصة الرئيسية
            SliverToBoxAdapter(child: HomeHeroStory()),

            // 🔵 عنوان Latest Stories
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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

            // 🔵 قائمة المقالات
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = demoArticles[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: ArticleCard(
                      image: item["image"] ?? '',
                      category: item["category"] ?? '',
                      title: item["title"] ?? '',
                      likes: item["likes"],
                      shares: item["shares"],
                    ),
                  );
                }, childCount: demoArticles.length),
              ),
            ),

            // 🔵 مساحة تحت للـ BottomNav
            SliverToBoxAdapter(child: SizedBox(height: 80.h)),
          ],
        ),
      ),
    );
  }
}

final demoArticles = [
  {
    "title": "Quantum Leap: The New Era of Encryption Standards",
    "category": "Technology",
    "image": "assets/images/articles/article2.png",
    "likes": "1.2k",
    "shares": "89",
  },
  {
    "title": "Personalized Medicine: DNA Sequencing for Everyone",
    "category": "Health",
    "image": "assets/images/articles/article3.png",
    "likes": "856",
    "shares": "142",
  },
  {
    "title": "The Global Connectivity Mesh: Satellites vs Fiber",
    "category": "Science",
    "image": "assets/images/articles/article4.png",
    "likes": "2.4k",
    "shares": "312",
  },
  {
    "title": "DeFi 2.0: Reshaping Global Capital Markets",
    "category": "Business",
    "image": "assets/images/articles/article5.png",
    "likes": "642",
    "shares": "54",
  },
];
