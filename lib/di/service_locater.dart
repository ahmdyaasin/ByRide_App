import "package:byride_app/controller/controller.dart";
import "package:byride_app/network/api/auth_api.dart";
import "package:byride_app/network/api/data_api.dart";
import "package:byride_app/network/dio_client.dart";
import "package:byride_app/prefs_helper/prefs_helper.dart";
import "package:byride_app/respository/data_repository.dart";
import "package:dio/dio.dart";
import "package:get_it/get_it.dart";
import "package:shared_preferences/shared_preferences.dart";

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerLazySingleton(() => PrefsHelper(getIt()));
  getIt.registerSingleton(await SharedPreferences.getInstance());
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(AuthApi(DioClient(getIt<Dio>())));
  getIt.registerSingleton(DataApi(DioClient(getIt<Dio>())));
  getIt.registerSingleton(
      DataRepository(dataApi: DataApi(DioClient(getIt<Dio>()))));
  getIt.registerSingleton(Controller());
}
