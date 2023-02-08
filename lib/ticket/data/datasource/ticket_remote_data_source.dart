import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ticket_app/core/data/api_paths.dart';
import 'package:ticket_app/core/data/exceptions.dart';
import 'package:ticket_app/ticket/data/dto/ticket_history_dto.dart';

@singleton
class TicketRemoteDataSource {
  final Dio dio;

  TicketRemoteDataSource(this.dio);

  Future<TicketHistoryDTO> getAllTickets() async {
    const responseUrl = ApiPaths.allTickets;

    try {
      final response = await dio.get(responseUrl);

      //status code is not null and is equal to 200
      if (response.statusCode! == 200) {
        final ticketHistoriesData = response.data['data']['dist'];

        return TicketHistoryDTO.fromJson(ticketHistoriesData);
      } else {
        throw ServerException('something went wrong');
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.other && e.error is SocketException) {
        throw ServerException('no internet');
      } else if (e.response != null) {
        throw ServerException(e.response?.statusMessage ?? "unknown error");
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}
