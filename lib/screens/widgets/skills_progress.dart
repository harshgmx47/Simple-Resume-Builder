import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:resume_builder/utils/colors/MyColors.dart';

class SkillsProgress extends StatelessWidget {
  const SkillsProgress({
    super.key,
    required this.progress,
    required this.title,
  });

  final double progress;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * .015),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// title
          Text(
            title,
            style: theme.textTheme.displaySmall,
          ),

          /// Empty Space
          const SizedBox(
            height: 2,
          ),

          /// Progress Bar
          LinearPercentIndicator(
            alignment: MainAxisAlignment.center,
            width: size.width * 0.8,
            lineHeight: size.height * .02,
            percent: progress,
            progressColor: MyColors.primaryColor,
            backgroundColor: MyColors.primaryColor.withOpacity(0.2),
            barRadius: const Radius.circular(50),
          ),
        ],
      ),
    );
  }
}
