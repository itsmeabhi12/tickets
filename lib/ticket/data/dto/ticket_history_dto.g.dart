// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketHistoryDTO _$TicketHistoryDTOFromJson(Map<String, dynamic> json) =>
    TicketHistoryDTO(
      day: (json['day'] as List<dynamic>)
          .map((e) => TicketDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      week: (json['week'] as List<dynamic>)
          .map((e) => TicketDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      month: (json['month'] as List<dynamic>)
          .map((e) => TicketDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      year: (json['year'] as List<dynamic>)
          .map((e) => TicketDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketHistoryDTOToJson(TicketHistoryDTO instance) =>
    <String, dynamic>{
      'day': instance.day,
      'week': instance.week,
      'month': instance.month,
      'year': instance.year,
    };
