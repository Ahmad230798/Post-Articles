import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/core/helpers/spacing.dart';
import 'package:flutter_project/core/widgets/app_text_form_field.dart';
import 'package:flutter_project/features/auth/widget/app_text_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  bool isObscureText = true;
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: 16.w,
            vertical: 10.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: AppColor.primary,
                        size: 25,
                      ),

                      onPressed: () {},
                    ),
                    horizentalspace(90),
                    Text(
                      "ScholarLink",
                      style: AppTextStyle.font18boldlightblue,
                    ),
                  ],
                ),
                verticalspace(50),
                Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0xffE2E8F0), width: 1.sp),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 35.h,
                      horizontal: 32.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              SvgPicture.asset("assets/svgs/loginavatar.svg"),
                              verticalspace(28),
                              Text(
                                "Welcome Back",
                                style: AppTextStyle.font30boldblack,
                              ),
                              verticalspace(8),
                              Text(
                                "Sign in to continue your learning\njourney",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.font16regularbluewithopacity
                                    .copyWith(
                                      color: AppColor.lightgrey,
                                      height: 24 / 16,
                                      letterSpacing: 0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        verticalspace(32),
                        Form(
                          key: formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email Address",
                                style: AppTextStyle.font14semiboldbluegray,
                              ),
                              verticalspace(8),
                              AppTextFormField(
                                hinttText: "name@university.edu",
                              ),
                              verticalspace(20),
                              Row(
                                children: [
                                  Text(
                                    "Password",
                                    style: AppTextStyle.font14semiboldbluegray,
                                  ),
                                  Expanded(child: SizedBox()),
                                  GestureDetector(
                                    child: Text(
                                      "Forget Passowrd?",
                                      style: AppTextStyle.font14regularGrey
                                          .copyWith(
                                            color: AppColor.green,
                                            letterSpacing: 0,
                                          ),
                                    ),
                                    onTap: () {
                                      //Go to forget passowrd screen
                                    },
                                  ),
                                ],
                              ),
                              verticalspace(8),
                              AppTextFormField(
                                hinttText: "Enter your password",
                                suffixIcone: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscureText = !isObscureText;
                                    });
                                  },
                                  icon: Icon(
                                    isObscureText
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    size: 25,
                                    color: AppColor.lightgrey,
                                  ),
                                ),
                                isObscureText: isObscureText,
                              ),
                              verticalspace(20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: isClicked,
                                    onChanged: (value) {
                                      isClicked = value!;
                                    },
                                  ),
                                  Text("Remember me for 30 days"),
                                ],
                              ),
                              verticalspace(20),
                              AppTextButton(buttonText: 'Sign In'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
