import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/user_profile/logic/cubit/user_profile_cubit.dart';
import 'package:flutter_project/features/user_profile/logic/cubit/user_profile_state.dart';
import 'package:flutter_project/features/user_profile/repo/user_profile_repo.dart';
import 'package:flutter_project/features/user_profile/widgets/areas_and_expertise.dart';
import 'package:flutter_project/features/user_profile/widgets/profile_header.dart';
import 'package:flutter_project/features/user_profile/widgets/user_bio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfile extends StatelessWidget {
  final String username;
  const UserProfile({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserProfileCubit(UserProfileRepo(ApiServices()), "ahmad1233")
            ..getUserProfile(),
      child: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is UserProfileFailure) {
            return Scaffold(body: Center(child: Text(state.errorMassege)));
          }
          if (state is UserProfileSuccess) {
            final user = state.user;
            final isLoading = state.isFollowingLoading;
            final loaded = state.isFollowing;
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          vertical: 24.h,
                          horizontal: 16.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileHeader(
                              userName: user.username,
                              userTitle: user.title,
                              userLocation: user.location,
                              onPressed: () {
                                context.read<UserProfileCubit>().follow();
                              },
                              isLoading: isLoading,
                              bottomText: loaded == true
                                  ? "Followed"
                                  : "Follow",
                            ),
                            verticalspace(40),
                            UserBio(
                              followers: user.networkCount.toString(),
                              posts: user.postsCount.toString(),
                              impact: '92',
                            ),
                            verticalspace(32),
                            Text(
                              "Areas of Expertise",
                              style: AppTextStyle.font18boldlightblue,
                            ),
                            verticalspace(16),
                            AreasAndExpertise(),
                            verticalspace(8),
                            Text(
                              "About",
                              style: AppTextStyle.font18boldlightblue,
                            ),
                            verticalspace(8),
                            Text(
                              user.bio,
                              style: AppTextStyle.font14regulardarkblue
                                  .copyWith(color: AppColor.darkBlueGray),
                            ),
                            verticalspace(15),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
