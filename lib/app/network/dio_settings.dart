import 'package:dio/dio.dart';

class DioSetting{
  final Dio dio;

  DioSetting(this.dio){
    dio.interceptors.add(QueuedInterceptorsWrapper(
      onRequest: (options, handler){
        handler.next(options);
      },
    ));
  }
}