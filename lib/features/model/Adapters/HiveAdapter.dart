import 'package:hive/hive.dart';
import 'package:resume_builder/features/model/resume_model.dart';

class UserInfoAdapter extends TypeAdapter<UserInfo> {
  @override
  final int typeId = 0;

  @override
  UserInfo read(BinaryReader reader) {
    return UserInfo(
      name: reader.read(),
      number: reader.read(),
      mail: reader.read(),
      bio: reader.read(),
      skillsAndProgress:
          reader.readList().map((dynamic e) => e as SkillsData).toList(),
      hobbies: reader.readList().cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserInfo obj) {
    writer
      ..write(obj.name)
      ..write(obj.number)
      ..write(obj.mail)
      ..write(obj.bio)
      ..writeList(obj.skillsAndProgress)
      ..writeList(obj.hobbies);
  }
}

class SkillsDataAdapter extends TypeAdapter<SkillsData> {
  @override
  final int typeId = 1;

  @override
  SkillsData read(BinaryReader reader) {
    return SkillsData(
      name: reader.read(),
      progress: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, SkillsData obj) {
    writer
      ..write(obj.name)
      ..write(obj.progress);
  }
}
