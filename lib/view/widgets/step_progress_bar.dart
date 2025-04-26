import 'package:flutter/material.dart';
import 'package:community_engaged_app/utils/app_colors.dart';


///A horizontal line step counter used for sign up screen for every step it will complete
///1/3 step of this line with themeColor if the user complete the three step
///signUp it will fill the full color
class StepProgressBar extends StatelessWidget {
  final int currentStep; // 1, 2, or 3

  const StepProgressBar({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fullWidth = constraints.maxWidth;
        double stepWidth = (fullWidth / 3) * currentStep.clamp(0, 3);

        return Stack(
          children: [
            Container(
              height: 5,
              width: fullWidth,
              decoration: BoxDecoration(
                color: AppColor.themeColor.withOpacity(.5),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 5,
              width: stepWidth,
              decoration: BoxDecoration(
                color: AppColor.themeColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        );
      },
    );
  }
}
