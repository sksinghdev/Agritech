import 'package:dio/dio.dart';


class ApiService {
final Dio _dio;
ApiService(this._dio);


Future<Response<dynamic>> get(String path) async => _dio.get(path);
}