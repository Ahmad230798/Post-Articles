import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
import 'package:flutter_project/core/constants/text_style.dart';
import 'package:flutter_project/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:flutter_project/features/onboarding/ui/screens/onboarding_screen2.dart';
import 'package:flutter_project/features/onboarding/ui/screens/onboarding_screen3.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingContainer extends StatefulWidget {
  const OnboardingContainer({super.key});

  @override
  State<OnboardingContainer> createState() => _OnboardingContainerState();
}

class _OnboardingContainerState extends State<OnboardingContainer> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// الصفحات
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                OnboardingScreen(),
                OnboardingScreen2(),
                OnboardingScreen3(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: currentPage == index ? 32 : 8,
                decoration: BoxDecoration(
                  color: currentPage == index ? Colors.teal : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          ),

          SizedBox(height: 32.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              width: 1.sw,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  if (currentPage < 2) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // Navigate to Home
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentPage == 2 ? "Get Started" : "Next",
                      style: AppTextStyle.font16boldlightblue.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 25),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              width: 1.sw,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  if (currentPage < 2) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // Navigate to Home
                  }
                },
                child: Text(
                  "Log In",
                  style: AppTextStyle.font16boldlightblue.copyWith(
                    color: AppColor.lightblue,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 25.h),
        ],
      ),
    );
  }
}
