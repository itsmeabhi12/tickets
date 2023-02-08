import 'package:ticket_app/ticket/domain/entity/ticket_failure.dart';
import 'package:ticket_app/ticket/domain/entity/ticket_history.dart';

abstract class TicketState {}

class TicketInitial extends TicketState {}

class TicketLoading extends TicketState {}

class TicketLoaded extends TicketState {
  final TicketHistory data;

  TicketLoaded(this.data);
}

class TicketFailed extends TicketState {
  final TicketFailure failure;

  TicketFailed(this.failure);
}
