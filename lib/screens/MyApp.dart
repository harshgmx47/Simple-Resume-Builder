import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:resume_builder/features/Add/addCubit.dart';
import 'package:resume_builder/features/model/resume_model.dart';
import 'package:resume_builder/screens/AddEditItemScreen.dart';
import 'package:resume_builder/screens/MainView.dart';
import 'package:resume_builder/utils/themes/AppTheme.dart';

import '../features/model/Adapters/HiveAdapter.dart';

Future<Widget> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  // Register Hive adapters
  Hive.registerAdapter(UserInfoAdapter());
  Hive.registerAdapter(SkillsDataAdapter());

  await Hive.openBox<UserInfo>('userInfoBox');

  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
  }
  return MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => UserDataCubit(UserInfoRepository()),
    )
  ], child: const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppThemes.light,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const MainView(), // Define the initial route
          '/second': (context) => AddUpdateUserInfoScreen(),
        },
      ),
    );
  }
}
