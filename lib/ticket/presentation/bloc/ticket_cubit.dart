import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ticket_app/core/domain/no_params.dart';
import 'package:ticket_app/ticket/domain/use_case/get_all_tickets.dart';
import 'package:ticket_app/ticket/presentation/bloc/ticket_state.dart';

@singleton
class TicketCubit extends Cubit<TicketState> {
  final GetAllTickets getAllTickets;
  TicketCubit(this.getAllTickets) : super(TicketInitial());

  Future<void> loadAllTickets() async {
    emit(TicketLoading());

    final ticketsOrFailure = await getAllTickets(NoParams());

    emit(
      ticketsOrFailure.fold(
        (failure) => TicketFailed(failure),
        (data) => TicketLoaded(data),
      ),
    );
  }
}
