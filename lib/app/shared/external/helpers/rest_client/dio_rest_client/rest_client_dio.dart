import 'package:dio/dio.dart';

import '../../../../presenter/stores/service_address_store/service_address_store.dart';
import '../exceptions/rest_client_exception.dart';
import '../interceptors/unauthentication_interceptor.dart';
import '../interfaces/rest_client_interface.dart';
import '../response/rest_client_response.dart';

class RestClientDio implements IRestClient {
  late Dio _dio;
  final ServiceAddressStore _serviceAddressStore;

  RestClientDio({
    required ServiceAddressStore serviceAddressStore,
  }) : _serviceAddressStore = serviceAddressStore {
    _dio = Dio();
    _dio.interceptors.add(UnauthenticationInterceptor());
  }

  String get _baseUrl =>
      'http://${_serviceAddressStore.ip}:${_serviceAddressStore.port}/TDRServerConferencia';

  @override
  Future<RestClientResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post<T>(
        _baseUrl + path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.message,
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<T>(
        _baseUrl + path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      throw RestClientException(
        error: e.error,
        message: e.message,
        statusCode: e.response?.statusCode,
      );
    }
  }
}
