import 'package:flutter/material.dart';
import 'package:flutter_project/core/widgets/app_top_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/discussion_header.dart';
import '../widgets/comment_card.dart';
import '../widgets/reply_card.dart';
import '../widgets/metrics_card.dart';
import '../widgets/comment_input_bar.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC),

      body: Stack(
        children: [
          Column(
            children: [
              /// Top Navigation Bar (fixed)
              const AppTopNavBar(title: "Discussion", showBack: true),

              /// Main Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Discussion Header
                      const DiscussionHeader(),
                      SizedBox(height: 32.h),

                      /// -------------------------
                      /// Comment 1
                      /// -------------------------
                      CommentCard(
                        avatar: "assets/images/profile.png",
                        name: "Dr. Aris Thorne",
                        role: "Neurobiology Lead @ MIT",
                        time: "2h ago",
                        text:
                            "The findings regarding the mTOR pathway activation in this cohort are revolutionary. However, I wonder if the sample size adequately accounts for the variability in baseline cognitive reserves?",
                        likes: "24",
                      ),

                      /// Reply to Comment 1
                      ReplyCard(
                        avatar: "assets/images/profile.png",
                        name: "Sarah Jenkins",
                        role: "PhD Candidate",
                        time: "1h ago",
                        text:
                            "@Aris Thorne We addressed this in Section 4.2. We used a Propensity Score Matching approach to normalize the cognitive baselines across the control group.",
                        likes: "8",
                      ),

                      SizedBox(height: 32.h),

                      /// -------------------------
                      /// Comment 2
                      /// -------------------------
                      CommentCard(
                        avatar: "assets/images/profile.png",
                        name: "James Chen",
                        role: "Data Scientist",
                        time: "45m ago",
                        text:
                            "Is the dataset used for the neural mapping available on OpenScience? I'd love to run a few cross-validations using our own synthetic model.",
                        likes: "Like",
                      ),

                      SizedBox(height: 32.h),

                      /// Metrics Card
                      const MetricsCard(),

                      SizedBox(height: 120.h),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// Bottom Input Bar (fixed)
          const Align(
            alignment: Alignment.bottomCenter,
            child: CommentInputBar(),
          ),
        ],
      ),
    );
  }
}
