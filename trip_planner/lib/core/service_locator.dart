import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_planner/core/data/local/destinations/destination_local_data_source.dart';
import 'package:trip_planner/core/data/local/exhange_rate_local_date_source.dart';
import 'package:trip_planner/core/data/local/favorites/favorites_local_data_source.dart';
import 'package:trip_planner/core/data/local/favorites/favorites_repo_impl.dart';
import 'package:trip_planner/core/data/local/objectbox_store.dart';
import 'package:trip_planner/core/data/local/theme%20local/theme_local_data_source.dart';
import 'package:trip_planner/core/data/local/trips/trip_local_data_source.dart';
import 'package:trip_planner/core/data/local/trips/trip_repo_impl.dart';
import 'package:trip_planner/core/data/local/user%20%20profile/user_local_data_source.dart';
import 'package:trip_planner/core/data/repos/exchange_rate_repository_impl.dart';
import 'package:trip_planner/core/data/repos/remote/destination_remote_repository.dart';
import 'package:trip_planner/core/data/repos/remote/image_remote_repository.dart';
import 'package:trip_planner/core/data/repos/remote/weather_remote_repository.dart';
import 'package:trip_planner/core/data/repos/theme_repository_impl.dart';
import 'package:trip_planner/core/data/repos/user_profile_repository_impl.dart';
import 'package:trip_planner/core/data/services/destination_remote_data_source.dart';
import 'package:trip_planner/core/data/services/exchange_rate_remote_data_source.dart';
import 'package:trip_planner/core/data/services/image_remote_data_source.dart';
import 'package:trip_planner/core/data/services/weather_remote_data_source.dart';
import 'package:trip_planner/core/domain/repo/destination_repository.dart';
import 'package:trip_planner/core/domain/repo/exchange_rate_repository.dart';
import 'package:trip_planner/core/domain/repo/favorites_repository.dart';
import 'package:trip_planner/core/domain/repo/image_repository.dart';
import 'package:trip_planner/core/domain/repo/theme_repository.dart';
import 'package:trip_planner/core/domain/repo/trip_repository.dart';
import 'package:trip_planner/core/domain/repo/user_repository.dart';
import 'package:trip_planner/core/domain/repo/weather_repository.dart';
import 'package:trip_planner/core/domain/usecases/destination%20use%20cases/get_destination_by_id_use_case.dart';
import 'package:trip_planner/core/domain/usecases/destination%20use%20cases/get_destinations_by_ids_use_case.dart';
import 'package:trip_planner/core/domain/usecases/expenses/add_expense_use_case.dart';
import 'package:trip_planner/core/domain/usecases/expenses/delete_expense_use_case.dart';
import 'package:trip_planner/core/domain/usecases/favorite%20use%20cases/add_to_favorite_repo_use_case.dart';
import 'package:trip_planner/core/domain/usecases/currency%20conversion%20use%20cases/convert_currency_use_case.dart';
import 'package:trip_planner/core/domain/usecases/destination%20use%20cases/get_destinations_use_case.dart';
import 'package:trip_planner/core/domain/usecases/favorite%20use%20cases/get_favorites_ids_use_case.dart';
import 'package:trip_planner/core/domain/usecases/image%20use%20cases/get_images_for_destination_use_case.dart';
import 'package:trip_planner/core/domain/usecases/theme%20use%20cases/get_theme_use_case.dart';
import 'package:trip_planner/core/domain/usecases/theme%20use%20cases/save_theme_use_case.dart';
import 'package:trip_planner/core/domain/usecases/trip%20use%20cases/delete_trip_use_case.dart';
import 'package:trip_planner/core/domain/usecases/trip%20use%20cases/get_all_trips_use_case.dart';
import 'package:trip_planner/core/domain/usecases/trip%20use%20cases/get_trip_by_id_use_case.dart';
import 'package:trip_planner/core/domain/usecases/trip%20use%20cases/update_trip_use_case.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile%20use%20cases/clear_all_app_data_use_case.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile%20use%20cases/get_app_statistics_use_case.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile/clear_user_profile_use_case.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile/get_user_profile_use_case.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile/save_user_profile_use_case.dart';
import 'package:trip_planner/core/domain/usecases/user%20profile/update_user_profile_use_case.dart';
import 'package:trip_planner/core/domain/usecases/weather%20use%20%20cases/get_weather_use_case.dart';
import 'package:trip_planner/core/domain/usecases/favorite%20use%20cases/remove_favorite_use_case.dart';
import 'package:trip_planner/core/domain/usecases/trip%20use%20cases/save_trip_use_case.dart';
import 'package:trip_planner/core/presentaion/blocs/app%20status/app_status_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/destination%20image%20urls/destination_image_urls_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/explore/explore_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/favorite/favorite_screen_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/favorite/favorites_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/my%20trips/my_trips_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/onboarding/onboarding_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/profile/profile_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/theme%20cubit/theme_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/trip%20planning/trip_planning_cubit.dart';
import 'package:trip_planner/core/presentaion/blocs/weather/weather_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => Dio());

  sl.registerSingletonAsync<SharedPreferences>(
    () => SharedPreferences.getInstance(),
  );

  sl.registerSingletonAsync<ObjectBox>(() => ObjectBox.create());

  sl.registerLazySingleton<Store>(() => sl<ObjectBox>().store);

  sl.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSourceImpl(sl<Store>()),
  );

  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepoImpl(sl<FavoritesLocalDataSource>()),
  );

  sl.registerLazySingleton(() => DestinationRemoteDataSource(sl()));

  sl.registerLazySingleton(() => DestinationLocalDataSource(sl<Store>()));

  sl.registerLazySingleton<DestinationRepository>(
    () => DestinationRepositoryImpl(sl(), sl()),
  );

  sl.registerLazySingleton(() => ImageRemoteDataSource(sl()));

  sl.registerLazySingleton<ImageRepository>(() => ImageRemoteRepository(sl()));

  sl.registerLazySingleton(() => WeatherRemoteDataSource(sl()));

  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRemoteRepository(sl()),
  );

  sl.registerLazySingleton(() => ExchangeRateRemoteDataSource(sl()));

  sl.registerLazySingleton<ExhangeRateLocalDateSource>(
    () => ExhangeRateLocalDateSourceImpl(sl<SharedPreferences>()),
  );

  sl.registerLazySingleton<ExchangeRateRepository>(
    () => ExchangeRateRepositoryImpl(sl(), sl()),
  );

  sl.registerLazySingleton(() => UserLocalDataSourceImpl(sl()));

  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserProfileRepositoryImpl(sl()),
  );

  sl.registerLazySingleton(() => TripLocalDataSource(sl()));

  sl.registerLazySingleton<TripRepository>(() => TripRepoImpl(sl()));

  sl.registerLazySingleton(() => GetWeatherUseCase(sl()));

  sl.registerLazySingleton(() => GetDestinationsUseCase(sl()));

  sl.registerLazySingleton(() => GetDestinationByIdUseCase(sl()));

  sl.registerLazySingleton(() => GetDestinationsByIdsUseCase(sl()));

  sl.registerLazySingleton(() => AddToFavoritesUseCase(sl()));

  sl.registerLazySingleton(() => GetImagesForDestinationUseCase(sl()));

  sl.registerLazySingleton(() => RemoveFromFavoritesUseCase(sl()));

  sl.registerLazySingleton(() => GetFavoriteIdsUseCase(sl()));

  sl.registerLazySingleton(() => ConvertCurrencyUseCase(sl()));

  sl.registerLazySingleton(() => SaveTripUseCase(sl()));

  sl.registerLazySingleton(() => GetAllTripsUseCase(sl()));

  sl.registerLazySingleton(() => GetTripByIdUseCase(sl()));

  sl.registerLazySingleton(() => UpdateTripUseCase(sl()));

  sl.registerLazySingleton(() => DeleteTripUseCase(sl()));

  sl.registerLazySingleton(() => GetUserProfileUseCase(sl()));

  sl.registerLazySingleton(() => UpdateUserProfileUseCase(sl()));

  sl.registerLazySingleton(() => SaveUserProfileUseCase(sl()));

  sl.registerLazySingleton(() => ClearUserProfileUseCase(sl()));

  sl.registerLazySingleton(() => AddExpenseUseCase(sl()));

  sl.registerLazySingleton(() => DeleteExpenseUseCase(sl()));

  sl.registerLazySingleton(() => GetAppStatisticsUseCase(sl(), sl()));

  sl.registerLazySingleton(() => ClearAllAppDataUseCase(sl(), sl(), sl()));

  sl.registerLazySingleton(() => ThemeLocalDataSource(sl()));

  sl.registerLazySingleton<ThemeRepository>(() => ThemeRepositoryImpl(sl()));

  sl.registerLazySingleton(() => GetThemeUseCase(sl()));

  sl.registerLazySingleton(() => SaveThemeUseCase(sl()));

  sl.registerFactory(() => ExploreCubit(sl()));

  sl.registerFactory(() => WeatherCubit(sl()));

  sl.registerFactory(() => DestinationImageUrlsCubit(sl()));

  sl.registerFactory(() => FavoritesCubit(sl(), sl(), sl()));

  sl.registerFactory(() => TripPlanningCubit(sl(), sl()));

  sl.registerFactory(() => MyTripsCubit(sl(), sl(), sl(), sl(), sl(), sl()));

  sl.registerFactory(() => FavoritesScreenCubit(sl(), sl()));

  sl.registerFactory(() => OnboardingCubit(sl()));

  sl.registerLazySingleton(() => AppStatusCubit(sl()));

  sl.registerFactory(
    () => ProfileCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl()),
  );

  sl.registerFactory(() => ThemeCubit(sl(), sl()));
}
