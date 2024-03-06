// Import necessary packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../model/resume_model.dart';

// Define events for user data
abstract class UserDataEvent {}

class AddOrUpdateUserInfoEvent extends UserDataEvent {
  final UserInfo userInfo;

  AddOrUpdateUserInfoEvent(this.userInfo);
}

class DeleteUserInfoEvent extends UserDataEvent {}

// Define states for user data
abstract class UserDataState {}

class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataLoaded extends UserDataState {
  final UserInfo userInfo;

  UserDataLoaded(this.userInfo);
}

class UserDataEmpty extends UserDataState {}

class UserDataError extends UserDataState {
  final String message;

  UserDataError(this.message);
}

// Define UserDataCubit for managing user data
class UserDataCubit extends Cubit<UserDataState> {
  final UserInfoRepository repository;

  UserDataCubit(this.repository) : super(UserDataInitial());

  void addOrUpdateUserInfo(UserInfo userInfo) async {
    try {
      await repository.addOrUpdateUserInfo(userInfo);
      emit(UserDataLoaded(userInfo));
    } catch (e) {
      emit(UserDataError("Failed to add/update user info"));
    }
  }

  void deleteUserInfo() async {
    try {
      await repository.deleteUserInfo();
      emit(UserDataEmpty());
    } catch (e) {
      emit(UserDataError("Failed to delete user info"));
    }
  }

  void fetchUserInfo() async {
    try {
      final userInfo = await repository.getUserInfo();
      if (userInfo != null) {
        emit(UserDataLoaded(userInfo));
      } else {
        emit(UserDataError('User info not found'));
      }
    } catch (e) {
      emit(UserDataError('Failed to fetch user info'));
    }
  }
}

// Define repository class to interact with Hive
class UserInfoRepository {
  Future<void> addOrUpdateUserInfo(UserInfo userInfo) async {
    final box = await Hive.openBox<UserInfo>('userInfoBox');
    await box.put('userInfo', userInfo);
  }

  Future<UserInfo?> getUserInfo() async {
    final box = await Hive.openBox<UserInfo>('userInfoBox');
    return box.get('userInfo');
  }

  Future<void> deleteUserInfo() async {
    final box = await Hive.openBox<UserInfo>('userInfoBox');
    await box.delete('userInfo');
  }
}
