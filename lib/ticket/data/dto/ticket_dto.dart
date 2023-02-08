import 'package:json_annotation/json_annotation.dart';
import 'package:ticket_app/ticket/domain/entity/ticket.dart';

part 'ticket_dto.g.dart';

@JsonSerializable()
class TicketDTO {
  final String label;
  final String? value;

  TicketDTO(this.label, this.value);

  factory TicketDTO.fromJson(Map<String, dynamic> json) =>
      _$TicketDTOFromJson(json);

  factory TicketDTO.fromDomain(Ticket domain) =>
      TicketDTO(domain.label, domain.value);

  Ticket toDomain() => Ticket(label, value);
}
