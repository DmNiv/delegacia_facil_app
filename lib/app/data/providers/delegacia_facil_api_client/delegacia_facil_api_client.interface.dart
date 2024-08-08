import 'package:dio/dio.dart';

abstract class IDelegaciaFacilApiClient {
  Future<Response> get(
    String url, {
    Map<String, dynamic> headers = const {},
  });

  Future<Response> post(
    String url,
    dynamic body, {
    Map<String, dynamic> headers = const {},
  });

  Future<Response> put(
    String url,
    dynamic body, {
    Map<String, dynamic> headers = const {},
  });
}
