import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homescreen/homescreen.dart';
import 'package:flutter_application_1/screens/loginscreen/logincubit/cubit.dart';
import 'package:flutter_application_1/screens/loginscreen/logincubit/states.dart';
import 'package:flutter_application_1/screens/signup/signupscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/cahehelper.dart';
import '../../constantas/componets.dart';

import '../sendcode/sendcode.dart';

class Logincsreen extends StatelessWidget {
var emailconttroler=TextEditingController();
var passwordcontroller=TextEditingController();
var formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context )=>logincubit(),
      child: BlocConsumer<logincubit,loginstates> (
        listener: (context,state){
          if (state is Login_success_state){
            showtoast(msg: "welcome " ,color: Colors.green);
            cachehelper.savedata(key: "token", value: "FOODAPI " + (state.Login_model?.token ?? "")).then((value) {
              naviagtefinsh(context, homescreen());
            });



          }
            if (state is Login_error_state){
              showtoast(msg: "invaild email or password " ,color: Colors.red);

            }

        },
        builder: (context,state){

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                 Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 222,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/background_image 1.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: SizedBox(
                          width: 327,
                          child: Text(
                            'Welcome Back',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              // fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Form(
                  key:formkey ,
                  child: Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            SizedBox(height: 30,),
                            Container(
                              child: defaultformfield(
                                  controller: emailconttroler,
                                  type: TextInputType.emailAddress,
                                  validation: (value){
                                    if(value!.isEmpty)
                                    {
                                      return "please enter a valid email";

                                    }
                                   return null;

                                  },
                                  label: "email address",
                                  Prefixicon: Icons.email),
                            ),
                            SizedBox(height: 40,),

                            Container(
                              child: defaultformfield(
                                controller: passwordcontroller,
                                label: "password",
                                Prefixicon: Icons.lock,
                                type:TextInputType.visiblePassword,
                                ispassword: logincubit.get(context).ispasswordshow,
                                validation: (value){
                                  if(value!.isEmpty  )
                                  {
                                    return "please enter a password";

                                  }
                                  return null;


                                },
                                suffix: logincubit.get(context).suffixicon,
                                suffixPressed: (){logincubit.get(context).showLoginpassword();}
                              ),
                            ),
                            SizedBox(height: 40,),
                              TextButton(onPressed: (){

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => sendcode()),
                                );
                                },

                                child: Text(
                                'forget password ?',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Color(0xFFB5B7B8),
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w700,
                                  height: 1,
                                ),
                              ),),

                            SizedBox(height: 40,),



                            Container(
                              child: loadingbutton(inputstate: state is!Login_loading_state,
                                  buttonname:"Login",
                                  Function: (){
                                    if (formkey.currentState!.validate()){
                                      logincubit.get(context).login(email: emailconttroler.text,
                                          password: passwordcontroller.text);

                                    }
                                    else{
                                      print("error solution");

                                    }

                                  }  ),
                            ),




                            SizedBox(height: 40,),

                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don’t have an account? ',
                                    style: TextStyle(
                                      color: Color(0xFF7D8FAB),
                                      fontSize: 16,

                                      fontWeight: FontWeight.w400,
                                      height: 1.38,
                                    ),
                                  ),
                                  TextButton(onPressed: (){
                                    naviagte(context, signupscreen());
                                  }, child:  Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Color(0xFFFA9A0C),
                                      fontSize: 16,
                                      // fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 1.38,
                                    ),
                                  ),),




                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),

          );
        },

      ),


    );







  }
}
