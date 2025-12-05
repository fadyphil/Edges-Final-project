import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:trip_planner/core/presentaion/auth_gate/auth_gate.dart';
import 'package:trip_planner/core/presentaion/blocs/app%20status/app_status_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/profile/profile_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/theme%20cubit/theme_cubit.dart';

import 'package:trip_planner/core/di/service_locator.dart' as di;
import 'package:trip_planner/features/destination/presentation/blocs/destination_image_urls_cubit.dart';
import 'package:trip_planner/features/destination/presentation/blocs/explore_cubit.dart';
import 'package:trip_planner/features/favorites/presentation/blocs/favorites_cubit.dart';
import 'package:trip_planner/features/trip/presentation/blocs/my_trips_cubit.dart';
import 'package:trip_planner/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<ExploreCubit>()..getDestinations()),
        BlocProvider(create: (_) => di.sl<FavoritesCubit>()),
        BlocProvider(create: (_) => di.sl<DestinationImageUrlsCubit>()),
        BlocProvider(create: (_) => di.sl<MyTripsCubit>()),
        BlocProvider(
          create: (_) => di.sl<AppStatusCubit>()..checkOnboardingStatus(),
        ),

        BlocProvider(create: (_) => di.sl<ThemeCubit>()..loadTheme()),
        BlocProvider(create: (_) => di.sl<ProfileCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Trip Planner',
            debugShowCheckedModeBanner: false,
            darkTheme: AppTheme.darkTheme,
            theme: AppTheme.lightTheme,
            themeMode: state,
            home: const AuthGate(),
          );
        },
      ),
    );
  }
}
