import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homescreen/cubit/homescreen_cubit.dart';
import 'package:flutter_application_1/screens/homescreen/cubit/homescreen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>HomescreenCubit(),
      child: BlocConsumer<HomescreenCubit,HomescreenState>(
        listener:(BuildContext context, Object? state) {   },
        builder:(BuildContext context, state){
          return Scaffold(
            body: HomescreenCubit.get(context).widgetlist[HomescreenCubit.get(context).currentindex],

          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              HomescreenCubit.get(context).changebutton(index);
            },
            currentIndex: HomescreenCubit.get(context).currentindex,
            items: [

              BottomNavigationBarItem(icon:Icon(Icons.person_rounded),label:"profile"),
              BottomNavigationBarItem(icon:Icon(Icons.home_filled),label:"meal"),


            ],

          ),

          );


        },



      ),
    )   ;



  }
}
