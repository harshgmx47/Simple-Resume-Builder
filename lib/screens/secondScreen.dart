import 'package:flutter/material.dart';
import 'package:resume_builder/features/data/userStaticData.dart';

import '../utils/strings/myStrings.dart';
import 'widgets/contact_screen.dart';

class SecondView extends StatelessWidget {
  const SecondView({super.key, required this.nextPage});

  final VoidCallback nextPage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Bio
          Container(
            margin: EdgeInsets.all(size.height * .02),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .03,
            ),
            width: size.width,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.secondScreenBio,
                  style: theme.textTheme.bodyLarge,
                ),
                Text(
                  UserData.infoBio,
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          /// Hobbies
          Container(
            margin: EdgeInsets.all(size.height * .02),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .03,
              vertical: size.height * .01,
            ),
            width: size.width,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.secondScreenHobbies,
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                SizedBox(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        UserData.userInfo.hobbies.length,
                        (index) => Text(
                          "$index. ${UserData.userInfo.hobbies[index]}",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ))
              ],
            ),
          ),

          /// Contact
          Container(
            margin: EdgeInsets.all(size.height * .01),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .03,
              vertical: size.height * .01,
            ),
            width: size.width,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.secondScreenContact,
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(
                  height: size.height * .01,
                ),
                ContactCard(title: UserData.userInfo.number, icon: Icons.phone),
                ContactCard(title: UserData.userInfo.mail, icon: Icons.mail),
              ],
            ),
          ),

          /// Empty Space
          Expanded(child: Container()),

          /// Next Page
          IconButton(
              color: theme.canvasColor,
              onPressed: nextPage,
              icon: const Icon(Icons.arrow_upward_outlined)),

          /// Empty Space
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
