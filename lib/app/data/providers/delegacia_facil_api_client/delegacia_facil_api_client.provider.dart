import 'dart:io';
import 'package:delegacia_facil_app/app/data/providers/delegacia_facil_api_client/delegacia_facil_api_client.interface.dart';
import 'package:dio/dio.dart';

typedef Header = Map<String, dynamic>;
typedef Request = Future<Response> Function();

/// `DelegaciaFacilApiClient` serves as an HTTP client.
/// It has methods for processing GET, POST, PUT HTTP requests.
/// It utilizes the Dio HTTP client under the hood for sending these requests.
class DelegaciaFacilApiClient implements IDelegaciaFacilApiClient {
  late final Dio _dio;

  DelegaciaFacilApiClient({
    Dio? dio,
  }) {
    _dio = dio ?? Dio(BaseOptions(
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
    ));
  }


  @override
  Future<Response> get(String url, {Header headers = const {}}) async {
    try {
      return await _dio.get(url, options: Options(headers: headers));
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        statusMessage: 'Error: $e',
      );
    }
  }


  @override
  Future<Response> post(String url, dynamic body, {Header headers = const {}}) async {
    try {
      return await _dio.post(url, data: body, options: Options(headers: headers));
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        statusMessage: 'Error: $e',
      );
    }
  }

 
  @override
  Future<Response> put(String url, dynamic body, {Header headers = const {}}) async {
    try {
      return await _dio.put(url, data: body, options: Options(headers: headers));
    } catch (e) {
      return Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        statusMessage: 'Error: $e',
      );
    }
  }
}