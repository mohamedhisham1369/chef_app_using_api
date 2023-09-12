

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/network/diohelper/diohelper.dart';
import 'package:flutter_application_1/network/diohelper/endpoints.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/models/meals/mealsmodel.dart';
import 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealInitial());
 static MealCubit get(context)=>BlocProvider.of(context);
  var token="FOODAPI eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0ZTBhNmY0NjEwNjJmMzhmYzg3MjlmNiIsImVtYWlsIjoiYW5hcy5yb3V0ZUBnbWFpbC5jb20iLCJuYW1lIjoiQW5hcyIsImlhdCI6MTY5NDM2ODY4MX0.t6MdepYMk0ZINcBkvkklFHU54SOCLdzWj_Dys4IVWr8";

  mealsmodel? model;
  
  void getmealdata(){
    emit(meal_loading_state());
    diohelper.getData(url:admingetmeals,query: {"status":"all"} ,tokenvalue: token,
    ).then((value) {
      model=mealsmodel.fromJson(value.data);
      print(model!.meals![0].name);
      emit(meal_success_state(model!));
    }).catchError((){
      emit(meal_error_state());


    });
  }






}
