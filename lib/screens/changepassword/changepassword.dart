import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constantas/componets.dart';
import 'package:flutter_application_1/screens/changepassword/cubit/changepassword_state.dart';
import 'package:flutter_application_1/screens/profile/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/changepassword_cubit.dart';


class changepassword extends StatelessWidget {
  var oldpasswordcontroller =TextEditingController();
  var newpasswordcontrolller=TextEditingController();
  var confirmpasswordcontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ChangepasswordCubit(),
      child: BlocConsumer<ChangepasswordCubit,ChangepasswordState>(
        listener:(BuildContext context, Object? state) {
          if(state is change_password_success_state){
            showtoast(msg: "password changed", color: Colors.green);
            Duration(seconds: 3);
            naviagtefinsh(context, profilescreen());


          }

        },
        builder:(BuildContext context, state){
          var cubit=ChangepasswordCubit().get(context);
          return Scaffold(

            appBar: AppBar(title: appbartext( text: 'change password'),),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        lockicon(),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: double.infinity,

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                deafaulttext(text: "change password"),
                              ],
                            ),

                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: defaultformfield(
                            controller: oldpasswordcontroller,
                            type: TextInputType.text,
                            validation: (value){
                              if(value?.isEmpty ?? true)
                              {
                                return "please enter a valid email";

                              }
                              return null;


                            },
                            ispassword:cubit.is_password_for_old_password ,

                            label: "old password",
                            Prefixicon: Icons.lock,
                            suffix:cubit.suffix_icon_for_old_password ,
                            suffixPressed: (){
                              cubit.show_password_old_password();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: defaultformfield(
                            controller:newpasswordcontrolller ,
                            type: TextInputType.text,
                            validation: (value){
                              if(value?.isEmpty ?? true)
                              {
                                return "please enter password";

                              }
                              return null;


                            },
                            ispassword:cubit.is_password_for_new_password ,
                            label: "new password",
                            Prefixicon: Icons.lock,
                            suffix: cubit.suffix_icon_for_new_password,


                            suffixPressed: (){
                              cubit.show_password_new_password();

                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: defaultformfield(
                            controller:confirmpasswordcontroller ,
                            type: TextInputType.text,
                            ispassword:cubit.is_password_for_confirm_password ,

                            validation: (value){
                              if(value?.isEmpty ?? true)
                              {
                                return "please enter a valid email";

                              }
                              return null;


                            },

                            label: "confirm password",
                            Prefixicon: Icons.lock,
                            suffix: cubit.suffix_icon_for_confirm_password,


                            suffixPressed: (){
                              cubit.show_password_confirm_password();

                            },

                          ),
                        ),



                        SizedBox(
                          height: 40,
                        ),

                        Container(
                          child: loadingbutton(
                              inputstate: state is!change_password_loading_state ,
                              buttonname:  "changepassword",
                              Function: (){
                                if(formkey.currentState!.validate()){
                                  if(oldpasswordcontroller.text!=newpasswordcontrolller.text){
                                    if(confirmpasswordcontroller.text==newpasswordcontrolller.text){
                                      cubit.changepasssword(
                                          oldpassword: oldpasswordcontroller.text,
                                          newpassword: newpasswordcontrolller.text,
                                          confirmpassword: confirmpasswordcontroller.text);


                                    }
                                    else{
                                      showtoast(msg: "password not match", color: Colors.red);
                                    }
                                  }
                                  else{
                                    showtoast(msg: "new password is equal old password", color: Colors.red);
                                  }


                                }
                              }


                          ),
                        ),



                      ],

                    ),
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
