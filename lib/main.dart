import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sign_lang_app/core/di/dependency_injection.dart';
import 'package:sign_lang_app/core/routing/app_router.dart';
import 'package:sign_lang_app/core/routing/routes.dart';
import 'package:sign_lang_app/core/theming/colors.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/extentions.dart';
import 'package:sign_lang_app/core/utils/sharedprefrence.dart';
import 'package:sign_lang_app/core/utils/simple_bloc_observer.dart';
import 'package:sign_lang_app/features/dictionary/domain/entities/dictionary_entity.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   // Initialize SharedPreferences
await checkIfLoggedInUser();
  Hive.registerAdapter(DictionaryEntityAdapter());
  await Hive.initFlutter();
  await Hive.openBox<DictionaryEntity>(KDictionaryBox);

  Bloc.observer = SimpleBlocObserver();

  setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        initialRoute:isLoggedInUser? Routes.bottomNavigationScreen: Routes.loginScreen,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}


checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}