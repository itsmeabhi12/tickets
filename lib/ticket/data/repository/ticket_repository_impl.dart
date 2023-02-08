import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ticket_app/core/data/exceptions.dart';
import 'package:ticket_app/ticket/data/datasource/ticket_remote_data_source.dart';
import 'package:ticket_app/ticket/domain/entity/ticket_failure.dart';
import 'package:ticket_app/ticket/domain/entity/ticket_history.dart';
import 'package:ticket_app/ticket/domain/repository/ticket_repository.dart';

@Singleton(as: TicketRepository)
class TicketHistoryRepositoryImpl implements TicketRepository {
  final TicketRemoteDataSource remoteDataSource;

  TicketHistoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<TicketFailure, TicketHistory>> getAllTickets() async {
    try {
      final tickets = await remoteDataSource.getAllTickets();
      return Right(tickets.toDomain());
    } on ServerException catch (e) {
      return Left(TicketFailure(message: e.message));
    } catch (e) {
      rethrow;
    }
  }
}
