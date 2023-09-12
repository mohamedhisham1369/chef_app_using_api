
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constantas/componets.dart';
import 'package:flutter_application_1/screens/addmeal/addmealscreen.dart';
import 'package:flutter_application_1/screens/meal/cubit/meal_cubit.dart';
import 'package:flutter_application_1/screens/meal/cubit/meal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class mealscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MealCubit()..getmealdata(),
      child: BlocConsumer<MealCubit, MealState>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    button(function: () {
                      naviagte(context, addmealscreen());
                    }, name: "Add meal"),
                    SizedBox(height: 20),
                    ConditionalBuilder(
                      condition: MealCubit.get(context).model != null,
                      builder: (context) => Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              MealCubit.get(context).model!.meals!.length,
                                  (userIndex) => Container(
                                width: double.infinity,

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,

                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,

                                            children: [
                                              Container(
                                                child: deafaulttext(
                                                    text:
                                                    " name: ${MealCubit.get(context).model!.meals![userIndex].name}"),
                                              ),
                                              SizedBox(height: 20),

                                              Container(
                                                child: deafaulttext(
                                                    text:
                                                    "description:  ${MealCubit.get(context).model!.meals![userIndex].description}"),
                                              ),
                                              SizedBox(height: 20),

                                              Container(
                                                child: deafaulttext(
                                                    text:
                                                    "status: ${MealCubit.get(context).model!.meals![userIndex].status}"),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Container(

                                            child: Icon(Icons.no_meals,color: Colors.deepOrange,size:30 ,)),
                                      ],
                                    ),
                                    Divider(color: Colors.black,),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      fallback: (context) => Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
