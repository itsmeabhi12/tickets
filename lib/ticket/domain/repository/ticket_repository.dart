import 'package:dartz/dartz.dart';
import 'package:ticket_app/ticket/domain/entity/ticket_failure.dart';
import 'package:ticket_app/ticket/domain/entity/ticket_history.dart';

abstract class TicketRepository {
  Future<Either<TicketFailure, TicketHistory>> getAllTickets();
}
