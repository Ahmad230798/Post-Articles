import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'widgets/ad_header.dart';
import 'widgets/ad_hero_image.dart';
import 'widgets/ad_title_section.dart';
import 'widgets/ad_author_section.dart';
import 'widgets/ad_action_buttons.dart';
import 'widgets/ad_body_content.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundLight,

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ADHeader()),
            SliverToBoxAdapter(child: ADHeroImage()),
            SliverToBoxAdapter(child: ADTitleSection()),
            SliverToBoxAdapter(child: ADAuthorSection()),
            SliverToBoxAdapter(child: ADActionsButtons()),
            SliverToBoxAdapter(child: ADBodyContent()),
            SliverToBoxAdapter(child: SizedBox(height: 80.h)),
          ],
        ),
      ),
    );
  }
}
