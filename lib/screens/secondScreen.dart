import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_builder/features/Add/addCubit.dart';

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
      child: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (context, state) {
          if (state is UserDataLoaded) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /// Bio
                    Container(
                      height: size.height * .370,
                      margin: EdgeInsets.all(size.height * .02),
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .04,
                          vertical: size.height * .02),
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
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            state.userInfo.bio,
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
                                  state.userInfo.hobbies.length,
                                  (index) => Text(
                                    "$index. ${state.userInfo.hobbies[index]}",
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
                          ContactCard(
                              title: state.userInfo.number, icon: Icons.phone),
                          ContactCard(
                              title: state.userInfo.mail, icon: Icons.mail),
                        ],
                      ),
                    ),

                    /// Empty Space
                    Expanded(child: Container()),

                    /// Empty Space
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                  ],
                ),

                /// Next Page
                Positioned(
                  bottom: size.height / 40,
                  right: size.width * 0.460,
                  child: IconButton(
                      color: theme.canvasColor,
                      onPressed: nextPage,
                      icon: const Icon(Icons.arrow_upward_outlined)),
                ),
              ],
            );
          } else if (state is UserDataError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return const Center(
              child: Text('Unknown state'),
            );
          }
        },
      ),
    );
  }
}
