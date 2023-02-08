import 'package:json_annotation/json_annotation.dart';
import 'package:ticket_app/ticket/data/dto/ticket_dto.dart';
import 'package:ticket_app/ticket/domain/entity/ticket.dart';
import 'package:ticket_app/ticket/domain/entity/ticket_history.dart';

part 'ticket_history_dto.g.dart';

@JsonSerializable()
class TicketHistoryDTO {
  final List<TicketDTO> day;
  final List<TicketDTO> week;
  final List<TicketDTO> month;
  final List<TicketDTO> year;

  TicketHistoryDTO({
    required this.day,
    required this.week,
    required this.month,
    required this.year,
  });

  factory TicketHistoryDTO.fromJson(Map<String, dynamic> json) =>
      _$TicketHistoryDTOFromJson(json);

  factory TicketHistoryDTO.fromDomain(TicketHistory domain) => TicketHistoryDTO(
        day: domain.day.fromDomain(),
        week: domain.week.fromDomain(),
        month: domain.month.fromDomain(),
        year: domain.year.fromDomain(),
      );

  TicketHistory toDomain() => TicketHistory(
        day: day.toDomain(),
        week: week.toDomain(),
        month: month.toDomain(),
        year: year.toDomain(),
      );
}

extension ListX on List<Ticket> {
  List<TicketDTO> fromDomain() => map((e) => TicketDTO.fromDomain(e)).toList();
}

extension ListXX on List<TicketDTO> {
  List<Ticket> toDomain() => map((e) => e.toDomain()).toList();
}
