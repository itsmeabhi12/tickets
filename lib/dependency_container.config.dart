// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ticket_app/dependency_container.dart' as _i9;
import 'package:ticket_app/ticket/data/datasource/ticket_remote_data_source.dart'
    as _i4;
import 'package:ticket_app/ticket/data/repository/ticket_repository_impl.dart'
    as _i6;
import 'package:ticket_app/ticket/domain/repository/ticket_repository.dart'
    as _i5;
import 'package:ticket_app/ticket/domain/use_case/get_all_tickets.dart' as _i7;
import 'package:ticket_app/ticket/presentation/bloc/ticket_cubit.dart' as _i8;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.BaseOptions>(
      () => registerModule.baseOptions,
      instanceName: 'BaseOptions',
    );
    gh.lazySingleton<_i3.Dio>(() =>
        registerModule.dio(gh<_i3.BaseOptions>(instanceName: 'BaseOptions')));
    gh.singleton<_i4.TicketRemoteDataSource>(
        _i4.TicketRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i5.TicketRepository>(
        _i6.TicketHistoryRepositoryImpl(gh<_i4.TicketRemoteDataSource>()));
    gh.singleton<_i7.GetAllTickets>(
        _i7.GetAllTickets(gh<_i5.TicketRepository>()));
    gh.singleton<_i8.TicketCubit>(_i8.TicketCubit(gh<_i7.GetAllTickets>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
