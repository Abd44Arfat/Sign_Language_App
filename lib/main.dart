import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/routing/app_router.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/simple_bloc_observer.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  Hive.registerAdapter(DictionaryEntityAdapter());
  await Hive.initFlutter();
  await Hive.openBox<DictionaryEntity>(KDictionaryBox);
  
  Bloc.observer = SimpleBlocObserver();
  
  // Optionally set up your service locator here
  setupServiceLocator();

  runApp(
    MyApp(), // Wrap your app
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
 
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Cairo',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.dictionaryScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}