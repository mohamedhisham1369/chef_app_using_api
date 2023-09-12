
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screens/meal/meal.dart';
import 'package:flutter_application_1/screens/profile/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'homescreen_state.dart';

class HomescreenCubit extends Cubit<HomescreenState> {
  HomescreenCubit() : super(HomescreenInitial());

 static HomescreenCubit get(context)=>BlocProvider.of(context);




int currentindex=0;

List<Widget> widgetlist=[
  profilescreen(),
  mealscreen(),
];

void changebutton(int index){

  currentindex=index;
  emit (changebuttonnavbarstate());


}

}
