import 'package:resume_builder/features/model/resume_model.dart';

/// Custom Class for storing Developer Data locally
class UserData {
  UserData._();

  static UserInfo userInfo = UserInfo(
    name: "Harsh vadera",
    bio: infoBio,
    skillsAndProgress: <SkillsData>[
      SkillsData(
        name: 'Software Engineer',
        progress: 0.7,
      ),
      SkillsData(
        name: 'Mobile App Developer',
        progress: 0.9,
      ),
      SkillsData(
        name: 'Flutter Developer',
        progress: 1,
      ),
    ],
    hobbies: <String>[
      "Learning about Development",
      "Create YouTube Content",
      "Plying COD",
    ],
    number: '+91 940 96 82 750',
    mail: 'harshgmx47@gmail.com',
  );

  static const String infoBio = """
I'm Harsh Vadera, a motivated software engineering student with a passion for mobile development using Dart and Flutter 📱. I enjoy sharing programming knowledge on social media 🌐. Let's explore mobile development together! 🚀"
""";
}
