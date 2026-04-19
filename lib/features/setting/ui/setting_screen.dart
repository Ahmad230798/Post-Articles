import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/app_font.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/core/services/services.dart';
import 'package:flutter_project/core/widgets/app_text_button.dart';
import 'package:flutter_project/features/my_profile/logic/cubit/my_profile_cubit.dart';
import 'package:flutter_project/features/my_profile/logic/cubit/my_profile_state.dart';
import 'package:flutter_project/features/my_profile/repo/my_profile_repo.dart';
import 'package:flutter_project/features/setting/widgets/account_work_space_options.dart';
import 'package:flutter_project/features/setting/widgets/information_and_help_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MyProfileCubit(MyProfileRepo(apiServices: ApiServices()))
            ..loadMyProfile(),
      child: BlocBuilder<MyProfileCubit, MyProfileState>(
        builder: (context, state) {
          if (state is MyProfileLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is MyProfileFailure) {
            return Scaffold(body: Center(child: Text(state.errorMessage)));
          }

          if (state is MyProfileLoaded) {
            final user = state.user;
            final articles = state.articles;
            final pref = SharedPreferencesService();
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
                  horizentalspace(22),
                ],
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80.w,
                          height: 80.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/mobile_screen.jpg",
                              ),
                            ),
                          ),
                        ),
                        horizentalspace(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.username,
                              style: AppTextStyle.font20regularblack,
                            ),
                            Text(
                              user.academicStatus,
                              style: AppTextStyle.font14regulardarkblue
                                  .copyWith(fontFamily: AppFont.publicSans),
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalspace(48),
                    Text(
                      "ACCOUNT WORKSPACE",
                      style: AppTextStyle.font12semiboldbluegray,
                    ),
                    verticalspace(16),
                    AccountWorkSpaceOptions(),
                    verticalspace(25),
                    Text(
                      "Information & Help",
                      style: AppTextStyle.font12semiboldbluegray,
                    ),
                    verticalspace(16),
                    InformationAndHelpOptions(),
                    verticalspace(40),
                    AppTextButton(
                      widget: Icon(Icons.logout, size: 24, color: AppColor.red),
                      buttonText: "Log Out",
                      onPressed: () async {
                        await pref.clearTokens();
                        context.pushAndRemoveUntil(
                          Routes.loginScreen,
                          predicate: (route) {
                            return false;
                          },
                        );
                      },
                      backgroundcolor: Colors.white,
                      textStyle: AppTextStyle.font16semiboldred,
                      borderColor: AppColor.red,
                    ),
                    verticalspace(56),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "SCHOLARLINK V2.4.0 • ACADEMIC EDITION",
                            style: AppTextStyle.font10meduimWgray,
                          ),
                          Text(
                            "© 2024 Global Research Initiative",
                            style: AppTextStyle.font10regulargray,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
