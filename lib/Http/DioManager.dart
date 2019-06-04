import 'package:dio/dio.dart';

class DioManager{
  Dio _dio;
  get dio{
    return _dio;
  }

  DioManager._internal(){

    _dio = Dio();
  }
  static DioManager singletion = DioManager._internal();
  factory DioManager()=>singletion;

}

