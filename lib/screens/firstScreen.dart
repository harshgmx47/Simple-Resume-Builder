import 'package:flutter/material.dart';
import 'package:resume_builder/features/data/userStaticData.dart';
import 'package:resume_builder/utils/colors/MyColors.dart';

import 'widgets/skills_box.dart';
import 'widgets/skills_progress.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final VoidCallback nextPage;

  const MyHomePage({
    super.key,
    required this.title,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          //Create user Avatar
          Container(
            padding: EdgeInsets.all(size.height * 0.01),
            decoration: BoxDecoration(
                color: themeData.cardColor, shape: BoxShape.circle),
            child: CircleAvatar(
              radius: size.height * .1,
              backgroundColor: MyColors.primaryColor,
              backgroundImage: const NetworkImage(
                  "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png"),
            ),
          ),
          // Empty Space
          SizedBox(
            height: size.height * 0.01,
          ),

          /// Developer Full Name
          Text(
            UserData.userInfo.name,
            style: themeData.textTheme.displayLarge,
          ),

          // Empty Space
          SizedBox(
            height: size.height * 0.02,
          ),

          /// Developer Skills
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            spacing: size.width * .05,
            runSpacing: size.width * .03,
            children: List.generate(
                UserData.userInfo.skillsAndProgress.length,
                (index) => SkillBox(
                      text: UserData.userInfo.skillsAndProgress[index].name,
                    )),
          ),

          // Empty Space
          SizedBox(
            height: size.height * 0.03,
          ),

          /// Skills Progress
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              UserData.userInfo.skillsAndProgress.length,
              (index) => SkillsProgress(
                progress: UserData.userInfo.skillsAndProgress[index].progress,
                title: UserData.userInfo.skillsAndProgress[index].name,
              ),
            ),
          ),
          // Empty Space
          Expanded(child: Container()),

          // Next Page
          IconButton(
            color: themeData.canvasColor,
            onPressed: nextPage,
            icon: const Icon(Icons.arrow_downward_outlined),
          ),

          /// Empty Space
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}