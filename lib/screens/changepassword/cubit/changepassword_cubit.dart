import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/cahehelper.dart';
import 'package:flutter_application_1/network/diohelper/diohelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../network/diohelper/endpoints.dart';
import 'changepassword_state.dart';

class ChangepasswordCubit extends Cubit<ChangepasswordState> {
  ChangepasswordCubit() : super(ChangepasswordInitial());


  ChangepasswordCubit get(context)=>BlocProvider.of(context);


  bool is_password_for_old_password= true;
  bool is_password_for_new_password= true;
  bool is_password_for_confirm_password= true;
  IconData suffix_icon_for_old_password = Icons.visibility;
  IconData suffix_icon_for_new_password = Icons.visibility;
  IconData suffix_icon_for_confirm_password = Icons.visibility;

  void show_password_old_password() {
    is_password_for_old_password = !is_password_for_old_password;
    suffix_icon_for_old_password =
    is_password_for_old_password ? Icons.visibility : Icons.visibility_off;
    emit(suffix_icon_for_old_password_change_state());
  }


  void show_password_new_password(){
    is_password_for_new_password=!is_password_for_new_password;
    suffix_icon_for_new_password=is_password_for_new_password?Icons.visibility:Icons.visibility_off;
    emit(suffix_icon_for_new_password_change_state());

  }

  void show_password_confirm_password(){
    is_password_for_confirm_password=!is_password_for_confirm_password;
    suffix_icon_for_confirm_password=is_password_for_confirm_password?Icons.visibility:Icons.visibility_off;
    emit(suffix_icon_for_confirm_password_change_state());


  }

 static var token =cachehelper.getdata(key: "token");

  void changepasssword(
      {required String oldpassword,required String newpassword,required String confirmpassword,}
      )
  {
    emit(change_password_loading_state());
    diohelper.patchdata(url: chefchangepassword,tokenvalue: token, data: {
      "oldPass": oldpassword,
      "newPass": newpassword,
      "confirmPassword": confirmpassword,


    }).
    then((value) {
      print(value.data);

      emit(change_password_success_state());
    }).

    catchError((error){
      print(error.toString());
      emit(change_password_error_state());


    });






  }




}
