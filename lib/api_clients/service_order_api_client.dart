import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:industriai/api_clients/service_order_api_client_interface.dart';
import 'package:industriai/database/models/service_order.dart';
import 'package:http_parser/http_parser.dart';

class ServiceOrderApiClient implements ServiceOrderApiClientInterface {
  final _client = GetIt.I.get<Dio>();

  @override
  Future<List<ServiceOrder>> fetchServiceOrders() async {
    String? errorMessage;

    try {
      final response = await _client.get('/service_order');
      final rawList = response.data['serviceOrders'] as List;
      return rawList.map((e) => ServiceOrder.fromJson(e)).toList();
    } on DioException catch (e) {
      errorMessage = 'Ocorreu um erro com o servidor';

      if (e.response != null) {
        errorMessage += ' (${e.response!.statusCode})';
      }

      errorMessage += '.';
    } on Exception catch (e) {
      errorMessage = e.toString();
    }

    throw FetchServiceOrderException(
        errorMessage ?? 'Um erro desconhecido ocorreu');
  }

  @override
  Future<ServiceOrder?> createServiceOrderFromAudio(
      {required String audioPath}) async {
    final file = File(audioPath);
    final bytes = file.readAsBytesSync();
    final multipartFile = MultipartFile.fromBytes(bytes,
        filename: 'audio.wav', contentType: MediaType('audio', 'wav'));

    final payload = {
      'audio': multipartFile,
    };

    final formData = FormData.fromMap(payload);

    try {
      final response = await _client.post('/service_order', data: formData);
      return ServiceOrder.fromJson(response.data);
    } on DioException catch (e) {
      print('erro');
    } on Exception catch (e) {
      print('erro');
    }

    return null;
  }
}
