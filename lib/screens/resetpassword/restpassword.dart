import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constantas/componets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loginscreen/loginscreen.dart';
import 'cubit/resetpassword_cubit.dart';
import 'cubit/resetpassword_state.dart';

class Resetpassword extends StatelessWidget {
  var newpassword=TextEditingController();
  var confirmpassword=TextEditingController();
  var code=TextEditingController();
  var formkey=GlobalKey<FormState>();

  final String email ;
  Resetpassword(this.email);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ResetpasswordCubit(),
      child: BlocConsumer<ResetpasswordCubit,ResetpasswordState>(
        listener:(BuildContext context, Object? state) {
          if (state is Resetpasssword_succes_state){
            showtoast(msg: "passwordchangesuccessflur", color: Colors.green);
            naviagtefinsh(context, Logincsreen());
          }
        },
        builder:(BuildContext context, state){
          return Scaffold(

            appBar: AppBar(title: appbartext( text: 'Create New password'),),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        lockicon(),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                            child: deafaulttext(text: "Create new password")),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: defaultformfield(
                            controller: newpassword,
                            type: TextInputType.text,
                            validation: (value){
                              if(value?.isEmpty ?? true)
                              {
                                return "please enter a valid email";

                              }
                              return null;


                            },
                            ispassword: ResetpasswordCubit.get(context).ispasswordshow,

                            label: "New password",
                            Prefixicon: Icons.lock,
                            suffix: ResetpasswordCubit.get(context).suffixiconforpassword,
                            suffixPressed: (){
                              ResetpasswordCubit.get(context).showpassword();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: defaultformfield(
                            controller:confirmpassword ,
                            type: TextInputType.text,
                            validation: (value){
                              if(value?.isEmpty ?? true)
                              {
                                return "please enter a valid email";

                              }
                              return null;


                            },
                            ispassword: ResetpasswordCubit.get(context).ispasswordshowforconfirmpassword,
                            label: "confirmpassword",
                            Prefixicon: Icons.lock,
                            suffix: ResetpasswordCubit.get(context).suffixiconforconfirmpassword,
                            suffixPressed: (){
                              ResetpasswordCubit.get(context).showconfirmpassword();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: defaultformfield(
                            controller:code ,
                            type: TextInputType.text,
                            validation: (value){
                              if(value?.isEmpty ?? true)
                              {
                                return "please enter a valid email";

                              }
                              return null;


                            },
                            label: "code",


                          ),
                        ),



                        SizedBox(
                          height: 40,
                        ),
                        // Container(
                        //     child: button(function: (){
                        //
                        //     }
                        //     , name: "Reset password")),
                        loadingbutton(
                            inputstate: state is! Resetpasssword_loading_state,
                            buttonname:  "resetpassword",
                            Function: (){
                              if(formkey.currentState!.validate()){
                                if (newpassword.text==confirmpassword.text){
                                  ResetpasswordCubit.get(context).resetpassword(
                                      email:email.toString() ,
                                      password:newpassword .text,
                                      confirmpassword: confirmpassword.text,
                                      code: code.text);

                                }
                                else {
                                  print ("passworddontmatac");
                                }
                              }
                            }


                        )



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
