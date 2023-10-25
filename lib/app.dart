import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:hero/injector.dart' as injector;

import 'features/home/cubit/home_cubit.dart';
import 'features/homedriver/screen/pages/home_map_driver/cubit/home_driver_cubit.dart';

class HeroApp extends StatefulWidget {
  const HeroApp({Key? key}) : super(key: key);

  @override
  State<HeroApp> createState() => _HeroAppState();
}

class _HeroAppState extends State<HeroApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(text);

    return MultiBlocProvider(
      providers: [
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<SplashCubit>(),
    //     // ),
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<LoginCubit>(),
    //     // ),
        BlocProvider(
          create: (_) => injector.serviceLocator<HomeCubit>(),
        ), BlocProvider(
          create: (_) => injector.serviceLocator<HomeDriverCubit>(),
        ),
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<PostsCubit>(),
    //     // ),
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<ProfileCubit>(),
    //     // ),
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<FavoriteCubit>(),
    //     // ),
    //     //
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<PrivacyCubit>(),
    //     // ),
    //     //
    //     //
    //     // BlocProvider(
    //     //   create: (_) => injector.serviceLocator<AddServiceCubit>(),
    //     // ),
    //
    //
    //
      ],
      child: GetMaterialApp(
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: appTheme(),
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.light(),
        // standard dark theme
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: AppRoutes.onGenerateRoute,

    ));
  }
}
