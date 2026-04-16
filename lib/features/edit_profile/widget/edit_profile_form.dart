import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/app_font.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_project/features/auth/widget/drop_down_menue.dart';
import 'package:flutter_project/features/edit_profile/logic/cubit/edit_profile_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfileForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final EditProfileCubit cubit;
  const EditProfileForm({
    super.key,
    required this.formKey,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.person_outline, color: AppColor.green),
            horizentalspace(12),
            Text(
              "Identity",
              style: AppTextStyle.font20boldPrimary.copyWith(
                fontFamily: AppFont.newsreader,
              ),
            ),
          ],
        ),
        verticalspace(32),
        Text("FIRST NAME", style: AppTextStyle.font12meduimlightgray),
        verticalspace(8),
        AppTextFormField(
          controller: cubit.firstNameController,
          hinttText: cubit.firstNameController.text.isNotEmpty
              ? cubit.firstNameController.text
              : "Isaac",
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: AppColor.borderGrey,
          isFilled: true,
        ),
        verticalspace(40),
        Text("LAST NAME", style: AppTextStyle.font12meduimlightgray),
        verticalspace(8),
        AppTextFormField(
          controller: cubit.lastNameController,
          hinttText: "Hamilton",
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: AppColor.borderGrey,
          isFilled: true,
        ),
        verticalspace(40),
        Text("BIO", style: AppTextStyle.font12meduimlightgray),
        verticalspace(8),
        AppTextFormField(
          controller: cubit.bioController,
          linesCount: 5,
          hinttText:
              "Computational Biologist focusing on \nneural network architectures for protein \nintersection of AI and genomics.",
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: AppColor.borderGrey,
          isFilled: true,
        ),
        verticalspace(64),
        Row(
          children: [
            SvgPicture.asset("assets/svgs/craduated.svg"),
            horizentalspace(12),
            Text(
              "Academic Affiliation",
              style: AppTextStyle.font20boldPrimary.copyWith(
                fontFamily: AppFont.newsreader,
              ),
            ),
          ],
        ),
        verticalspace(32),
        Text("INSTITUTION", style: AppTextStyle.font12meduimlightgray),
        verticalspace(8),
        AppTextFormField(
          controller: cubit.institutionController,
          hinttText: "Massachusetts Institute of Technology (MIT)",
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: AppColor.borderGrey,
          isFilled: true,
        ),
        verticalspace(16),
        Text("FIELD OF STUDY", style: AppTextStyle.font12meduimlightgray),
        verticalspace(8),
        AppTextFormField(
          controller: cubit.filedOfStudycontroller,
          hinttText: "Biological Engineering",
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: AppColor.borderGrey,
          isFilled: true,
        ),
        verticalspace(40),
        Text("ACADEMIC STATUS", style: AppTextStyle.font12meduimlightgray),
        verticalspace(8),
        DropDownMenue(
          value: cubit.selectedAcademicStatus,
          focusColor: AppColor.borderGrey,
          border: Border.all(width: 0),
          onChanged: (value) {
            if (value != null) {
              cubit.changeAcademicStatus(value);
            }
          },
        ),
        verticalspace(40),
        Text("Location", style: AppTextStyle.font12meduimlightgray),
        verticalspace(8),
        AppTextFormField(
          controller: cubit.locationController,
          hinttText: "Cambridgem,MA",
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: AppColor.borderGrey,
          isFilled: true,
        ),
        verticalspace(64),
        Row(
          children: [
            Icon(Icons.link_sharp, color: AppColor.green),
            horizentalspace(12),
            Text(
              "Professional Links",
              style: AppTextStyle.font20boldPrimary.copyWith(
                fontFamily: AppFont.newsreader,
              ),
            ),
          ],
        ),
        verticalspace(32),
        Text("ORCID ID", style: AppTextStyle.font12meduimlightgray),
        verticalspace(8),
        AppTextFormField(
          controller: cubit.orcidIDController,
          hinttText: "0000-0002-1825-0097",
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: AppColor.borderGrey,
          isFilled: true,
        ),
        verticalspace(40),
        Text("WEBSITE", style: AppTextStyle.font12meduimlightgray),
        verticalspace(8),
        AppTextFormField(
          controller: cubit.websiteController,
          hinttText: "https://lab.mit.edu/aham",
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          fillColor: AppColor.borderGrey,
          isFilled: true,
        ),
      ],
    );
  }
}
