import 'package:dio/dio.dart';

class diohelper{

  static   Dio dio=Dio(
      BaseOptions(
        baseUrl:"https://food-api-omega.vercel.app/api/v1/",
        receiveDataWhenStatusError: true,
      ));

  static Future<Response> getData({required  String url,  Map<String, dynamic> ?query,String? tokenvalue})
  async{
    dio.options.headers = {
      "token": tokenvalue??'',
    };
    return await  dio.get(url,queryParameters: query);}

  static Future<Response> postdata({required  String url, Map<String, dynamic>?query,String? tokenvalue,
    required  Map<String, dynamic> data ,})
  async {
    dio.options.headers = {
      "token": tokenvalue??'',
    };

    return dio.post(url, queryParameters: query, data:  data,);}

  static Future<Response> patchdata({required  String url, Map<String, dynamic>?query,

    required  Map<String, dynamic> data , String? tokenvalue})
  
  async {
    print(tokenvalue);
    dio.options.headers = {
      "token": tokenvalue??'',
    };
    return dio.patch(url, queryParameters: query, data:  data,);

  }





  static Future<Response> upladimage({
    required String url,

    String? filePath, // The path to the image file you want to upload.
  }) async {

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        filePath!,
        filename: "image.png", // You can specify the desired filename here.
      ),
    });

    return await dio.post(url, data: formData);
  }



}
