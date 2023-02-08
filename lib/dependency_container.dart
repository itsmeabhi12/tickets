import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ticket_app/dependency_container.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @Named('BaseOptions')
  BaseOptions get baseOptions => BaseOptions(
        validateStatus: (status) =>
            status != null && status >= 200 && status < 400,
      );
  @lazySingleton
  Dio dio(@Named('BaseOptions') BaseOptions baseOptions) => Dio(baseOptions);
}
