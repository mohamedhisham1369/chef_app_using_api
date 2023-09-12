

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/network/diohelper/diohelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/cahehelper.dart';

import '../../../network/diohelper/endpoints.dart';
import 'editprofile_state.dart';

class EditprofileCubit extends Cubit<EditprofileState> {
  EditprofileCubit() : super(EditprofileInitial());


 static EditprofileCubit get(context)=>BlocProvider.of(context);
  static var token =cachehelper.getdata(key: "token");
  static String  file="https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80";
void editprofile(
    {
      required  var name, required var phone,required  var brandname,required var minimumcharge,
      required var description,required var location,}
    )
{

  emit (Editprofile_loading_state());
  diohelper.patchdata(url:chefupdate,tokenvalue: token , data: {
    "name":name,
    "phone":phone,
    "location":location,
    "brandName":brandname,
    "minCharge":minimumcharge,
    "disc":description,
    "profilePic":file


  }
  )
      .then((value)  {
        print(value.data);

    emit (Editprofile_success_state());

  }).
  catchError((error){
      print(error.toString());
    emit (Editprofile_error_state(error.toString()));


  });
  
  
  
}







}
