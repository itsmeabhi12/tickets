import 'package:flutter/material.dart';
import 'package:ticket_app/ticket/domain/entity/ticket.dart';
import 'package:ticket_app/ticket/domain/entity/ticket_history.dart';
import 'package:ticket_app/ticket/presentation/enum/ticket_filter.dart';

class TicketHelper {
  static const totalTickets = "Total tickets";
  static const unassignedTickets = "Unassigned tickets";
  static const assignedTickets = "Assigned tickets";
  static const inProgressTickets = "In Progress tickets";
  static const closedTickets = "Closed tickets";

  static List<Ticket> getData({
    required TicketHistory history,
    required TicketFilter filter,
  }) {
    switch (filter) {
      case TicketFilter.day:
        return history.day;
      case TicketFilter.month:
        return history.month;
      case TicketFilter.week:
        return history.week;
      case TicketFilter.year:
        return history.year;
    }
  }

  static Widget getIconFromLabel(String label) {
    switch (label) {
      case unassignedTickets:
        return const Icon(Icons.mail);
      case totalTickets:
        return const Icon(Icons.confirmation_num);
      case closedTickets:
        return const Icon(Icons.done_all);
      case assignedTickets:
        return const Icon(Icons.people);
      case inProgressTickets:
        return const Icon(Icons.wifi_protected_setup_sharp);
      default:
        return const Icon(Icons.device_unknown);
    }
  }
}
