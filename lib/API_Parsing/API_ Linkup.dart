import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class API{
  String url = "https://mkan-media.herokuapp.com/v1/audio/tracks";
  late Dio _dio;


  MKANAPI() {
    _dio = Dio();
  }

}

