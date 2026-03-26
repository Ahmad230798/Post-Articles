import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_color.dart';
// import 'package:flutter_project/features/onboarding/ui/onboarding_screen.dart';
import 'package:flutter_project/features/onboarding/ui/screens/onboarding_screen2.dart';

class ButtonAndTransition extends StatefulWidget {
  const ButtonAndTransition({super.key});

  @override
  State<ButtonAndTransition> createState() => _ButtonAndTransitionState();
}

class _ButtonAndTransitionState extends State<ButtonAndTransition> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: const [OnboardingScreen2()],
          ),
        ),

        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            bool isActive = index == currentIndex;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive
                    ? Colors.teal
                    : AppColor.onboardingtransitiongray,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        ),
      ],
    );
  }
}
