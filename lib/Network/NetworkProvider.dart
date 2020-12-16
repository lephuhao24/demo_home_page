import 'package:dio/dio.dart';

class NetworkProvider {
  Dio dio = Dio();
  static final Dio shared = NetworkProvider().dio;

  NetworkProvider() {
    BaseOptions options = new BaseOptions(
      baseUrl: "http://api.most.dev.bravesoft.vn/api/v1",

      // connectTimeout: 10000,
      // receiveTimeout: 10000,
    );
    dio = new Dio(options);
  }
}
