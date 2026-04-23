import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/constants/app_font.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/extentions.dart';
import 'package:flutter_project/core/helpers/snack_bar_helper.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/routing/routes.dart';
import 'package:flutter_project/core/services/api/api_services.dart';
import 'package:flutter_project/core/widgets/app_text_button.dart';
import 'package:flutter_project/features/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'package:flutter_project/features/edit_profile/logic/cubit/edit_profile_state.dart';
import 'package:flutter_project/features/edit_profile/repo/edit_profile_repo.dart';
import 'package:flutter_project/features/edit_profile/widget/edit_profile_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          EditProfileCubit(EditProfileRepo(ApiServices()))..getProfileInfo(),

      child: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileLoaded && state.didSave) {
            SnackBarHelper.showSuccess(context, "Profile updated successfully");
          }
          if (state is EditProfileLoaded && state.submitError != null) {
            SnackBarHelper.showError(context, state.submitError!);
          }
        },
        builder: (context, state) {
          final cubit = context.read<EditProfileCubit>();

          if (state is EditProfileLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is EditProfileFailure) {
            return Scaffold(body: Center(child: Text(state.errorMessage)));
          }
          if (state is EditProfileLoaded) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  "ScholarLink",
                  style: AppTextStyle.font20boldPrimary.copyWith(
                    letterSpacing: -0.25,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    vertical: 23.h,
                    horizontal: 24.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Edit Profile",
                        style: AppTextStyle.font30boldblack.copyWith(
                          fontFamily: AppFont.newsreader,
                        ),
                      ),
                      verticalspace(8),
                      Text(
                        "Update your academic identity and research links for the global community.",
                        style: AppTextStyle.font14regulardarkblue.copyWith(
                          fontFamily: AppFont.publicSans,
                        ),
                      ),

                      verticalspace(48),
                      EditProfileForm(formKey: formKey, cubit: cubit),
                      verticalspace(104),
                      AppTextButton(
                        buttonText: "Discard Changes",
                        onPressed: () {
                          cubit.updateProfileInfo();
                          context.pushAndRemoveUntil(
                            Routes.myProfileScreen,
                            predicate: (route) => false,
                          );
                        },
                        backgroundcolor: Colors.white,
                        textStyle: AppTextStyle.font16mediumblack,
                      ),
                      verticalspace(16),
                      AppTextButton(
                        buttonText: "Save Profile",
                        isLoading: state.isSubmitting,
                        onPressed: state.isSubmitting
                            ? null
                            : () {
                                cubit.updateProfileInfo();
                                context.pushAndRemoveUntil(
                                  Routes.myProfileScreen,
                                  predicate: (route) => false,
                                );
                              },
                      ),
                      verticalspace(100),
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
