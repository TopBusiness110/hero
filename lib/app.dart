import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hero/features/login/cubit/login_cubit.dart';
import 'package:hero/features/my_wallet/cubit/my_wallet_cubit.dart';
import 'package:hero/features/requestlocation/cubit/request_location_cubit.dart';
import 'package:hero/features/signup/cubit/signup_cubit.dart';
import 'package:hero/features/trip_service/cubit/payment_cubit.dart';


import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:hero/injector.dart' as injector;

import 'features/bike_details/cubit/bike_details_cubit.dart';
import 'features/documents/cubit/upload_documents_cubit.dart';
import 'features/driver_trip/cubit/driver_trip_cubit.dart';
import 'features/edit_profile/cubit/edit_profile_cubit.dart';
import 'features/home/cubit/home_cubit.dart';
import 'features/homedriver/cubit/home_driver_cubit.dart';
import 'features/orders/cubit/cubit/orders_cubit.dart';
import 'features/profits/cubit/profits_cubit.dart';
import 'features/trip_details/cubit/trip_details_cubit.dart';
import 'features/user_trip/cubit/user_trip_cubit.dart';
import 'main.dart';

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
        BlocProvider(
          create: (_) => injector.serviceLocator<OrdersCubit>(),
        ),
        BlocProvider(
          create: (_) => injector.serviceLocator<LoginCubit>(),
        ),
        BlocProvider(
          create: (_) => injector.serviceLocator<PaymentCubit>(),
        ),
        BlocProvider(
          create: (_) => injector.serviceLocator<SignupCubit>(),
        ),

        BlocProvider(
          create: (_) => injector.serviceLocator<RequestLocationCubit>(),
        ),

        BlocProvider(
          create: (_) => injector.serviceLocator<EditProfileCubit>(),
        ),
        BlocProvider(
          create: (_) => injector.serviceLocator<TripDetailsCubit>(),
        ),
     BlocProvider(
          create: (_) => injector.serviceLocator<BikeDetailsCubit>(),
        ),
 BlocProvider(
          create: (_) => injector.serviceLocator<UploadDocumentsCubit>(),
        ),
 BlocProvider(
          create: (_) => injector.serviceLocator<MyWalletCubit>(),
        ),
 BlocProvider(
          create: (_) => injector.serviceLocator<ProfitsCubit>(),
        ),
 BlocProvider(
          create: (_) => injector.serviceLocator<DriverTripCubit>(),
        ), BlocProvider(
          create: (_) => injector.serviceLocator<UserTripCubit>(),
        ),

      ],
      child: GetMaterialApp(
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: appTheme(
        ),
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.light(),
        navigatorKey: navigatorKey,
        // standard dark theme
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        onGenerateRoute: AppRoutes.onGenerateRoute,

    ));
  }
}
