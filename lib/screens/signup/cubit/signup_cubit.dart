

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/network/diohelper/diohelper.dart';
import 'package:flutter_application_1/network/diohelper/endpoints.dart';
import 'package:flutter_application_1/screens/signup/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  static SignupCubit get (context)=> BlocProvider.of(context);



  bool ispasswordshow= true;
  bool ispasswordshowforconfirmpassword= true;
  IconData suffixicon = Icons.visibility;
  IconData suffixiconforconfirmpassword = Icons.visibility;

  void showpassword(){
    ispasswordshow=!ispasswordshow;
    suffixicon=ispasswordshow?Icons.visibility:Icons.visibility_off;
    emit(signup_suffixicon_change_state());

  }

  void showpasswordforconfirmpassword(){
    ispasswordshowforconfirmpassword=!ispasswordshowforconfirmpassword;
    suffixiconforconfirmpassword=ispasswordshowforconfirmpassword?Icons.visibility:Icons.visibility_off;
    emit(signup_suffixicon_change_state());

  }


  // void signupfunction({
  //   required String name,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required String location,
  //   required String brandName,
  //   required String minCharge,
  //   required String disc,
  //
  // }) {
  //   emit(signup_loading_state());
  //
  //   diohelper.postdata(
  //     url: chef_signup,
  //     data: {
  //       "name": name,
  //       "phone": phone,
  //       "email": email,
  //       "password": password,
  //       "confirmPassword": confirmPassword,
  //       "location": location,
  //       "brandName": brandName,
  //       "minCharge": minCharge,
  //       "disc": disc,
  //       "frontId":"",
  //       "backId":"",
  //     },
  //   ).then((value) {
  //     print(value.data);
  //     emit(signup_success_state());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(signup_error_state());
  //   });
  // }
  //


  // Step 1
  late var x;

  // Future<void> signupfunction({
  //   required String name,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required String location,
  //   required String brandName,
  //   required String minCharge,
  //   required String disc,
  // }) async {
  //   emit(signup_loading_state());
  //
  //   // Step 2: Load images from assets
  //   Future<List<int>> loadImageFromAssets(String assetPath) async {
  //     final ByteData data = await rootBundle.load(assetPath);
  //     return data.buffer.asUint8List();
  //   }
  //
  //   // Step 3: Convert images to bytes
  //   final frontIdBytes = await loadImageFromAssets('images/bg 1.png');
  //   final backIdBytes = await loadImageFromAssets('images/bg 1.png');
  //
  //   diohelper.postdata(
  //     url: chef_signup,
  //     data: {
  //       "name": name,
  //       "phone": phone,
  //       "email": email,
  //       "password": password,
  //       "confirmPassword": confirmPassword,
  //       "location": location,
  //       "brandName": brandName,
  //       "minCharge": minCharge,
  //       "disc": disc,
  //       "frontId": MultipartFile.fromBytes(frontIdBytes, filename: 'bg 1.png'), // Step 4
  //       "backId": MultipartFile.fromBytes(backIdBytes, filename: 'bg 1.png'),   // Step 4
  //     },
  //   ).then((value) {
  //     print(value.data);
  //     emit(signup_success_state());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(signup_error_state());
  //   });
  // }
  late var y;

  // Future<void> signupfunction({
  //   required String name,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required String location,
  //   required String brandName,
  //   required String minCharge,
  //   required String disc,
  // }) async {
  //   emit(signup_loading_state());
  //
  //   // Step 2: Load images from assets
  //   Future<List<int>> loadImageFromAssets(String assetPath) async {
  //     final ByteData data = await rootBundle.load(assetPath);
  //     return data.buffer.asUint8List();
  //   }
  //
  //   // Step 3: Convert images to bytes
  //   final frontIdBytes = await loadImageFromAssets('images/bg 1.png');
  //   final backIdBytes = await loadImageFromAssets('images/bg 1.png');
  //
  //   // Step 4: Create the JSON request data with images
  //   final jsonData = {
  //     "name": name,
  //     "phone": phone,
  //     "email": email,
  //     "password": password,
  //     "confirmPassword": confirmPassword,
  //     "location": location,
  //     "brandName": brandName,
  //     "minCharge": minCharge,
  //     "disc": disc,
  //     "frontId": frontIdBytes,
  //     "backId": backIdBytes,
  //   };
  //
  //   diohelper.postdata(
  //     url: chef_signup,
  //     data: jsonData,
  //   ).then((value) {
  //     print(value.data);
  //     emit(signup_success_state());
  //   }).catchError((error) {
  //     if (error is DioError) {
  //       if (error.response != null) {
  //         print("Error Status: ${error.response!.statusCode}");
  //         print("Error Data: ${error.response!.data}");
  //       } else {
  //         print("Error: ${error.message}");
  //       }
  //     } else {
  //       print("Unexpected error: $error");
  //     }
  //     emit(signup_error_state());
  //   });
  // }
  //
  late var w;

  // Future<void> signupfunction({
  //   required String name,
  //   required String phone,
  //   required String email,
  //   required String password,
  //   required String confirmPassword,
  //   required String location,
  //   required String brandName,
  //   required String minCharge,
  //   required String disc,
  // }) async {
  //   emit(signup_loading_state());
  //
  //
  //   // Step 2: Load images from assets
  //   Future<List<int>> loadImageFromAssets(String assetPath) async {
  //     final ByteData data = await rootBundle.load(assetPath);
  //     return data.buffer.asUint8List();
  //   }
  //
  //   // Step 3: Convert images to bytes
  //   final frontIdBytes = await loadImageFromAssets('images/bg 1.png');
  //   final backIdBytes = await loadImageFromAssets('images/bg 1.png');
  //
  //
  //
  //
  //
  //
  //
  //   diohelper.postdata(
  //     url: chef_signup,
  //     data:  {
  //       "name": name,
  //       "phone": phone,
  //       "email": email,
  //       "password": password,
  //       "confirmPassword": confirmPassword,
  //       "location": location,
  //       "brandName": brandName,
  //       "minCharge": minCharge,
  //       "disc": disc,
  //       "healthCertificate":"",
  //       "frontId": frontIdBytes,
  //       "backId": backIdBytes,
  //       "profilePic":frontIdBytes,
  //     },
  //   ).then((value) {
  //     print(value.data);
  //     emit(signup_success_state());
  //   }).catchError((error) {
  //     if (error is DioError) {
  //       if (error.response != null) {
  //         print("Error Status: ${error.response!.statusCode}");
  //         try {
  //           // Attempt to parse the error response as JSON and print it
  //           final Map<String, dynamic> errorData =
  //           error.response!.data as Map<String, dynamic>;
  //           print("Error Data: ${errorData['ErrorMessage']}");
  //           print("Error Details: ${errorData['Error']}");
  //         } catch (e) {
  //           // Handle any JSON parsing errors
  //           print("Error Response: ${error.response!.data}");
  //         }
  //       } else {
  //         print("Error: ${error.message}");
  //       }
  //     } else {
  //       print("Unexpected error: $error");
  //     }
  //     emit(signup_error_state());
  //   });
  // }

  late var z;


  Future<void> signupfunction({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required String location,
    required String brandName,
    required String minCharge,
    required String disc,
  }) async {
    emit(signup_loading_state());

    // Step 2: Load images from assets
    Future<List<int>> loadImageFromAssets(String assetPath) async {
      final ByteData data = await rootBundle.load(assetPath);
      return data.buffer.asUint8List();
    }

    // Step 3: Convert images to bytes
    final frontIdBytes = await loadImageFromAssets('images/bg 1.png');
    final backIdBytes = await loadImageFromAssets('images/bg 1.png');

    try {
      final response = await diohelper.postdata(
        url: chef_signup,
        data:  {
          "name": name,
          "phone": phone,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "location": location,
          "brandName": brandName,
          "minCharge": minCharge,
          "disc": disc,
          "healthCertificate":frontIdBytes,
          "frontId": frontIdBytes,
          "backId": backIdBytes,
          "profilePic": frontIdBytes,
        },
      );

      // Check if the response status code indicates success
      if (response.statusCode == 200) {
        print("Sign up successful");
        emit(signup_success_state());
      } else {
        print("Sign up failed with status code: ${response.statusCode}");
        emit(signup_error_state());
      }
    } catch (error) {
      print("Unexpected error: $error");
      emit(signup_error_state());
    }
  }



}
