import 'package:ticket_app/ticket/domain/entity/ticket.dart';

class TicketHistory {
  final List<Ticket> day;
  final List<Ticket> week;
  final List<Ticket> month;
  final List<Ticket> year;

  TicketHistory({
    required this.day,
    required this.week,
    required this.month,
    required this.year,
  });
}
