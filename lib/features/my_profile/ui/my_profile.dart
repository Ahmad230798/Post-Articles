import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/app_font.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/features/my_profile/logic/cubit/my_profile_cubit.dart';
import 'package:flutter_project/features/my_profile/logic/cubit/my_profile_state.dart';
import 'package:flutter_project/features/my_profile/repo/my_profile_repo.dart';
import 'package:flutter_project/features/my_profile/widgets/account_management_menue.dart';
import 'package:flutter_project/features/my_profile/widgets/info_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyProfileCubit(MyProfileRepo(apiServices: ApiServices()))
            ..getMyProfile(),
      child: BlocBuilder<MyProfileCubit, MyProfileState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FailureState) {
            return Scaffold(body: Center(child: Text(state.errorMessage)));
          }
          if (state is SuccessState) {
            final user = state.user;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  "ScholarLink",
                  style: AppTextStyle.font20boldPrimary.copyWith(
                    letterSpacing: -0.25,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_none),
                  ),
                  horizentalspace(10),
                  Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: AssetImage("assets/images/profilePic.jpg"),
                      ),
                    ),
                  ),

                  horizentalspace(20),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalspace(32),
                      Container(
                        width: 120.w,
                        height: 120.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 4, color: Colors.white),
                          image: DecorationImage(
                            image: AssetImage("assets/images/myProfilePic.jpg"),
                          ),
                        ),
                      ),
                      verticalspace(32),
                      Text(
                        user.username,
                        style: AppTextStyle.font36bolddarkblue,
                      ),
                      verticalspace(4),
                      Text(
                        user.academicStatus,
                        style: AppTextStyle.font18mediumgray,
                      ),
                      Text(
                        user.institution,
                        style: AppTextStyle.font14regulardarkblue.copyWith(
                          fontFamily: AppFont.publicSans,
                        ),
                      ),
                      verticalspace(12),
                      Container(
                        height: 28.h,

                        decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            left: 12,
                            bottom: 4,
                            right: 12,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.fingerprint,
                                size: 20,
                                color: AppColor.blueGrey,
                              ),
                              horizentalspace(4),
                              Text(
                                user.orcidId,
                                style: AppTextStyle.font12semiboldbluegray
                                    .copyWith(fontFamily: AppFont.publicSans),
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalspace(12),
                      Container(
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: AppColor.lightGreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            left: 12,
                            bottom: 4,
                            right: 12,
                          ),
                          child: Text(
                            user.institution,
                            style: AppTextStyle.font12semiboldbluegray.copyWith(
                              fontFamily: AppFont.publicSans,
                            ),
                          ),
                        ),
                      ),
                      verticalspace(16),
                      Text(
                        style: AppTextStyle.font14regulardarkblue.copyWith(
                          fontFamily: AppFont.publicSans,
                        ),
                        user.bio,
                      ),
                      verticalspace(48),
                      Row(
                        children: [
                          InfoCard(
                            count: user.postsCount.toString(),
                            text: 'PUBLICATIONS',
                          ),
                          horizentalspace(16),
                          InfoCard(
                            count: user.networkCount.toString(),
                            text: "FOLLOWERS",
                          ),
                        ],
                      ),
                      verticalspace(48),
                      Row(
                        children: [
                          Text(
                            "My Articles",
                            style: AppTextStyle.font24bolddark.copyWith(
                              fontFamily: AppFont.newsreader,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "View All",
                            style: AppTextStyle.font14bolddarkblue.copyWith(
                              color: AppColor.accent,
                              fontFamily: AppFont.publicSans,
                            ),
                          ),
                        ],
                      ),
                      verticalspace(32),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: user.postsCount,
                        itemBuilder: (context, state) {
                          return SizedBox();
                        },
                      ),
                      // ListView(
                      //   shrinkWrap: true,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   children: [
                      //     ArticalCard(
                      //       kindAndDate: 'Research Paper • May 2024',
                      //       title:
                      //           'Syntactic Drift in LLM- Generated Archaic English: A Quantitative Study',
                      //       text:
                      //           'This paper investigates the divergence of morphological markers in synthetic text…',
                      //     ),
                      //     verticalspace(32),
                      //     ArticalCard(
                      //       kindAndDate: 'Research Paper • May 2024',
                      //       title:
                      //           'Syntactic Drift in LLM- Generated Archaic English: A Quantitative Study',
                      //       text:
                      //           'This paper investigates the divergence of morphological markers in synthetic text…',
                      //     ),
                      //   ],
                      // ),
                      verticalspace(48),
                      Text(
                        "ACCOUNT MANAGEMENT",
                        style: AppTextStyle.font12semiboldbluegray,
                      ),
                      verticalspace(16),
                      AccountManagementMenue(),
                      verticalspace(10),
                      Divider(thickness: 1.5, indent: 20, endIndent: 30),
                      verticalspace(26),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.logout, size: 24, color: AppColor.red),
                            horizentalspace(12),
                            Text(
                              "Logout",
                              style: AppTextStyle.font14meduimbluegray.copyWith(
                                color: AppColor.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalspace(90),
                    ],
                  ),
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
