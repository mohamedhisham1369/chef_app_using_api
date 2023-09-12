import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/sendcode/cubit/sendcode_cubit.dart';
import 'package:flutter_application_1/screens/sendcode/cubit/sendcode_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constantas/componets.dart';
import '../resetpassword/restpassword.dart';
class sendcode extends StatelessWidget {
  var sendcodeemailcontroller=TextEditingController();
  var sendcodeformkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SendcodeCubit(),
      child: BlocConsumer<SendcodeCubit,SendcodeState>(
        listener:(BuildContext context, Object? state) {
          if(state is Sendcode_success_state){

            showtoast(msg: "check your email address " ,color: Colors.green);
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Resetpassword(sendcodeemailcontroller.text)));

          }
          if (state is Sendcode_error_state){
            showtoast(msg: "invaild email" ,color: Colors.red);

          }


        },
        builder:(BuildContext context, state){


          return   Scaffold(
            appBar: AppBar(title: appbartext( text: 'Forget password'),),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      lockicon(),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          child: deafaulttext(text: "Enter Your mail and we will send you code to rest your password")),
                      SizedBox(
                        height: 40,
                      ),
                      Form(
                        key:sendcodeformkey,
                        child: Container(

                          child: defaultformfield(
                            controller: sendcodeemailcontroller,
                            type: TextInputType.emailAddress,
                            validation: (value){
                              if(value!.isEmpty)
                              {
                                return "please enter a valid email";

                              }
                              return null;


                            },
                            label: "email",
                            Prefixicon: Icons.email_outlined,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      Container(
                        child: loadingbutton(inputstate: state is! Sendcode_loading_state,
                            buttonname:"Send Code",
                            Function: (){
                          if(sendcodeformkey.currentState!.validate()){
                            SendcodeCubit.get(context).sendcode(sendcodeemailcontroller.text);




                          }

                          else{
                            print("error");
                          }


                            }  ),
                      ),

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
