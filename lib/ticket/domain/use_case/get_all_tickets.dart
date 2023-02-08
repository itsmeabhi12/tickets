import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ticket_app/core/domain/no_params.dart';
import 'package:ticket_app/core/domain/use_case.dart';
import 'package:ticket_app/ticket/domain/entity/ticket_failure.dart';
import 'package:ticket_app/ticket/domain/entity/ticket_history.dart';
import 'package:ticket_app/ticket/domain/repository/ticket_repository.dart';

@singleton
class GetAllTickets
    extends UseCase<Future<Either<TicketFailure, TicketHistory>>, NoParams?> {
  final TicketRepository repository;

  GetAllTickets(this.repository);

  @override
  Future<Either<TicketFailure, TicketHistory>> call(NoParams? params) {
    return repository.getAllTickets();
  }
}
