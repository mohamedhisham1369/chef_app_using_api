import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/editprofile/editprofile.dart';
import 'package:flutter_application_1/screens/loginscreen/loginscreen.dart';
import 'package:flutter_application_1/screens/profile/cubit/profile_cubit.dart';
import 'package:flutter_application_1/screens/profile/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/cahehelper.dart';

import '../../constantas/componets.dart';
import '../changepassword/changepassword.dart';

class profilescreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ProfileCubit(),
      child: BlocConsumer<ProfileCubit,ProfileState>(
        listener:(BuildContext context, Object? state) {   },
        builder:(BuildContext context, state){
          return   Scaffold (
            body:SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        CircleAvatar(radius: 30,

                        child: Image(
                          fit: BoxFit.cover ,
                          image: AssetImage("images/background_image 1.png",)
                          ,


                        )

                          ,),
                      SizedBox(height: 20,),

                      Text(
                          "name",
                          style: TextStyle(
                            fontSize: 24,

                          )
                      ),
                      SizedBox(height: 20,),

                      Text(
                          "email",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          )
                      ),
                      SizedBox(height: 20,),
                      Container(child: deaafulticonbutton(Function:(){
                        naviagte(context, editprofile());
                      }
                          , label: 'Editprofile', icon: Icons.person , color: Colors.black)),
                      SizedBox(height: 20,),
                      Container(child: deaafulticonbutton(Function:(){
                        naviagte(context, changepassword());

                      } , label: 'password', icon: Icons.visibility_off , color: Colors.black)),
                      SizedBox(height: 20,),
                      Container(child: deaafulticonbutton(Function:(){} , label: 'settings', icon: Icons.settings , color: Colors.black)),
                      SizedBox(height: 20,),
                      Container(child: deaafulticonbutton(Function:(){
                        cachehelper.removedata(key: "token", ).then((value) {
                          if (value){
                            naviagtefinsh(context, Logincsreen());

                          }
                        });


                        naviagtefinsh(context, Logincsreen());
                      } , label: 'Logout', icon: Icons.logout , )),


                    ],

                  ),
                ),
              ),
            ),


          );


        },



      ),
    )   ;



  }
}
