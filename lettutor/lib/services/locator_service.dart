import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lettutor/data/network/dio_client.dart';
import 'package:lettutor/data/sharedpref/shared_preference_helper.dart';
import 'package:lettutor/data/ultis.dart';

import 'package:lettutor/module/local_module.dart';
import 'package:lettutor/module/network_module.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'language_service.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerSingletonAsync<SharedPreferences>(
          () => LocalModule.provideSharedPreferences());

  // singletons:----------------------------------------------------------------
  getIt.registerSingleton(
      SharedPreferenceHelper(await getIt.getAsync<SharedPreferences>()));
  getIt.registerSingleton<Dio>(
      NetworkModule.provideDio(getIt<SharedPreferenceHelper>()));
  getIt.registerSingleton(DioClient(getIt<Dio>()));

  // repository:----------------------------------------------------------------
  getIt.registerSingleton(Ultis(
    getIt<SharedPreferenceHelper>(),
  ));

  // stores:--------------------------------------------------------------------
  getIt.registerSingleton(LanguageStore(getIt<Ultis>()));
}
