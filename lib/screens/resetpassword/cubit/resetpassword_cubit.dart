import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/diohelper/diohelper.dart';
import 'package:flutter_application_1/screens/resetpassword/cubit/resetpassword_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/diohelper/endpoints.dart';


class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  ResetpasswordCubit() : super(ResetpasswordInitial());


  static ResetpasswordCubit get(context)=>BlocProvider.of(context);


  bool ispasswordshow= true;
  bool ispasswordshowforconfirmpassword= true;
  IconData suffixiconforpassword = Icons.visibility;
  IconData suffixiconforconfirmpassword = Icons.visibility;
  void showpassword(){
    ispasswordshow=!ispasswordshow;
    suffixiconforpassword=ispasswordshow?Icons.visibility:Icons.visibility_off;
    emit(Reset_password_suffixicon_change_state());}
  void showconfirmpassword(){
    ispasswordshowforconfirmpassword=!ispasswordshowforconfirmpassword;
    suffixiconforconfirmpassword=ispasswordshowforconfirmpassword?Icons.visibility:Icons.visibility_off;
    emit(Reset_password_suffixicon_change_state_forconfimpassword());
  }

void resetpassword(

    {required String email, required String password,required String confirmpassword,required String code })
{
    emit(Resetpasssword_loading_state());
    print (email);
    print(password);
    print(confirmpassword);
    print(code);
    diohelper.patchdata(url: change_forgotten_password,
      data: {
        "email": email,
        "password": password,
        "confirmPassword":confirmpassword,
        "code":code,
      }

    ).then((value) {
      print(value.data);
      emit(Resetpasssword_succes_state());

    }).catchError((){

      emit(Resetpasssword_error_state());

    });

}


}
