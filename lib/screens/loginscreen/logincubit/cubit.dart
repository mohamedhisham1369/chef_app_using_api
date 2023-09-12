import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginscreen/logincubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/network/diohelper/diohelper.dart';

import '../../../network/diohelper/endpoints.dart';
import '../../../network/models/loginusermodel/loginusermodle.dart';

class logincubit extends Cubit <loginstates>{
  logincubit():super(Login_Init_state());

  static logincubit get (context)=> BlocProvider.of(context);
    bool ispasswordshow= true;
    IconData suffixicon = Icons.visibility;
    void showLoginpassword(){
    ispasswordshow=!ispasswordshow;
    suffixicon=ispasswordshow?Icons.visibility:Icons.visibility_off;
    emit(Login_suffixicon_change_state());

    }

  loginmodel? Login_model;
  void login ({required String email ,required String password } ){
    emit(Login_loading_state());
    diohelper.postdata(url: chefsignin , data: {"email": email, "password": password}).
    then((value) {
      print (value.data);
      Login_model=loginmodel.fromJson(value.data);
      print(Login_model!.token);




      emit(Login_success_state(Login_model));
    }).
    catchError((error ){
      print (error.toString());

      emit(Login_error_state(error.toString()));


    });

  }





}

