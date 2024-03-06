import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resume_builder/features/Add/addCubit.dart';
import 'package:resume_builder/features/model/resume_model.dart';

class AddUpdateUserInfoScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final mailController = TextEditingController();
  final bioController = TextEditingController();
  final skillsAndProgressController = TextEditingController();
  final hobbiesController = TextEditingController();

  AddUpdateUserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => UserDataCubit(UserInfoRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add/Update User Info'),
        ),
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: SizedBox(
            child: ListView(
              children: [
                // Input fields for user information
                TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  controller: numberController,
                  decoration: InputDecoration(
                    labelText: 'Number',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  controller: mailController,
                  decoration: InputDecoration(
                    labelText: 'Mail',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: Theme.of(context).textTheme.bodyMedium,
                  controller: bioController,
                  decoration: InputDecoration(
                    labelText: 'Bio',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  controller: skillsAndProgressController,
                  decoration: InputDecoration(
                    labelText: 'Skills and Progress (Skill:Progress, ...)',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  controller: hobbiesController,
                  decoration: InputDecoration(
                    labelText: 'Hobbies',
                    labelStyle: Theme.of(context).textTheme.bodyMedium,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 15.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                // Add/Update button
                ElevatedButton(
                  onPressed: () {
                    final skillsWithProgress = skillsAndProgressController.text
                        .split(',')
                        .map((entry) {
                          final parts = entry.split(':');
                          if (parts.length == 2) {
                            final skill = parts[0].trim();
                            final progress = double.tryParse(parts[1].trim());

                            if (progress != null) {
                              return SkillsData(
                                  name: skill, progress: progress);
                            }
                          }
                          return null;
                        })
                        .where((element) => element != null)
                        .cast<SkillsData>()
                        .toList();
                    final userInfo = UserInfo(
                      name: nameController.text,
                      number: numberController.text,
                      mail: mailController.text,
                      bio: bioController.text,
                      skillsAndProgress: skillsWithProgress,
                      hobbies: hobbiesController.text
                          .split(',')
                          .map((e) => e.trim())
                          .toList(),
                    );
                    context.read<UserDataCubit>().addOrUpdateUserInfo(userInfo);
                    Navigator.pop(context);
                  },
                  child: const Text('Add/Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
