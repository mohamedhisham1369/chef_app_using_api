import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/cahehelper.dart';
import 'package:flutter_application_1/network/diohelper/diohelper.dart';
import 'package:flutter_application_1/screens/meal/cubit/meal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../network/diohelper/endpoints.dart';
import 'addmeal_state.dart';
class AddmealCubit extends Cubit<AddmealState> {
  AddmealCubit() : super(AddmealInitial());

  static AddmealCubit get(context)=>BlocProvider.of(context);

  List <String> categories=[
    'Beef',
    'Chicken',
    'Fish',
    'Seafood',
    'Pork',
    'Lamb',
    'Vegetarian',
    'Vegan',
    'Gluten-free',
    'Dairy-free',

  ];

  String selecteditem="Beef";

  void changeitem(item){
    selecteditem=item;

  }
  bool showNumber = true; // Initially show number

  void chageradiobutton(var value){

    showNumber =value;
    emit(chageradiobuttonstate());
  }


var token=cachehelper.getdata(key: "token");

  void addmeal({required var name,required var price,required var category,required var decription}){
    emit(Addmeal_loading_state());
    print(name);
    print(price);
    print(category);
    print(decription);
    print(showNumber.toString());
    diohelper.postdata(url: add_to_menu,tokenvalue:token , data: {
      "name": name,
      "description": decription,
      "price": price,
      "category": category,
      "mealImages": "",
      "howToSell": showNumber? "number": "quantity"
    }).
    then((value) {
      emit(Addmeal_success_state());

    }).
    catchError((error){
      print(error.toString());
      emit(Addmeal_error_state());

    });

  }





}
