import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loginscreen/loginscreen.dart';
import 'package:flutter_application_1/screens/signup/cubit/signup_cubit.dart';
import 'package:flutter_application_1/screens/signup/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constantas/componets.dart';


class signupscreen extends StatelessWidget {
  var nameconttroller=TextEditingController();
  var emailconttroler=TextEditingController();
  var passwordcontroller=TextEditingController();
  var confirmpasswordcontroller=TextEditingController();
  var location=TextEditingController();
  var brandname=TextEditingController();
  var disccription=TextEditingController();
  var minCharge=TextEditingController();
  var phone=TextEditingController();





  var formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context )=>SignupCubit(),
      child: BlocConsumer<SignupCubit,SignupState> (
        listener: (context,state){
          if (state is signup_success_state){
            showtoast(msg: "check your mail to activate your account", color: Colors.green);
            naviagtefinsh(context, Logincsreen());
          }
          else if (state is signup_error_state){
            showtoast(msg: "check your mail", color: Colors.red );

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
                            "sign up",
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
                                  controller: nameconttroller,
                                  type: TextInputType.text,
                                  validation: (value){
                                    if(value!.isEmpty)
                                    {
                                      return "please enter  email";

                                    }
                                    return null;

                                  },
                                  label: "name",
                                  Prefixicon: Icons.person),
                            ),
                            SizedBox(height: 40,),
                            Container(
                              child: defaultformfield(
                                  controller:phone ,
                                  type: TextInputType.number,
                                  validation: (value){
                                    if(value!.isEmpty)
                                    {
                                      return "please enter  your phone number";

                                    }
                                    return null;

                                  },
                                  label: "phone ",
                                  Prefixicon: Icons.phone),
                            ),
                            SizedBox(height: 40,),
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
                                  ispassword: SignupCubit.get(context).ispasswordshow,
                                  validation: (value){
                                    if(value!.isEmpty  )
                                    {
                                      return "please enter a password";

                                    }
                                    return null;


                                  },
                                  suffix: SignupCubit.get(context).suffixicon,
                                  suffixPressed: (){SignupCubit.get(context).showpassword();}
                              ),
                            ),
                            SizedBox(height: 40,),
                            Container(
                              child: defaultformfield(
                                controller:confirmpasswordcontroller ,
                                type: TextInputType.text,
                                ispassword:SignupCubit.get(context).ispasswordshowforconfirmpassword ,

                                validation: (value){
                                  if(value?.isEmpty ?? true)
                                  {
                                    return "please enter a valid email";

                                  }
                                  return null;


                                },

                                label: "confirm password",
                                Prefixicon: Icons.lock,
                                suffix: SignupCubit.get(context).suffixiconforconfirmpassword,


                                suffixPressed: (){
                                  SignupCubit.get(context).showpasswordforconfirmpassword();

                                },

                              ),
                            ),

                            SizedBox(height: 40,),
                            Container(
                              child: defaultformfield(
                                  controller: location,
                                  type: TextInputType.text,
                                  validation: (value){
                                    if(value!.isEmpty)
                                    {
                                      return "please enter location ";

                                    }
                                    return null;

                                  },
                                  label: "location",
                                  Prefixicon: Icons.location_on),
                            ),
                            SizedBox(height: 40,),
                            Container(
                              child: defaultformfield(
                                  controller: brandname,
                                  type: TextInputType.text,
                                  validation: (value){
                                    if(value!.isEmpty)
                                    {
                                      return "please enter  brandname";

                                    }
                                    return null;

                                  },
                                  label: "brand name",
                                  Prefixicon: Icons.branding_watermark_sharp),
                            ),
                            SizedBox(height: 40,),
                            Container(
                              child: defaultformfield(
                                  controller: disccription,
                                  type: TextInputType.text,
                                  validation: (value){
                                    if(value!.isEmpty)
                                    {
                                      return "please enter  disccription";

                                    }
                                    return null;

                                  },
                                  label: "disccription ",
                                  Prefixicon: Icons.details),
                            ),
                            SizedBox(height: 40,),
                            Container(
                              child: defaultformfield(
                                  controller: minCharge,
                                  type: TextInputType.text,
                                  validation: (value){
                                    if(value!.isEmpty)
                                    {
                                      return "please enter  minCharge";

                                    }
                                    return null;

                                  },
                                  label: "min Charge ",
                                  Prefixicon: Icons.monetization_on),
                            ),
                            SizedBox(height: 40,),

                            Container(
                              child: loadingbutton(inputstate: state is!signup_loading_state,
                                  buttonname:"Signup",
                                  Function: (){
                                if(formkey.currentState!.validate()){
                                  if(confirmpasswordcontroller.text==passwordcontroller.text){
                                    SignupCubit.get(context).signupfunction(
                                        name: nameconttroller.text,
                                        phone: phone.text,
                                        email: emailconttroler.text,
                                        password: passwordcontroller.text,
                                        confirmPassword: confirmpasswordcontroller.text,
                                        location: location.text,
                                        brandName: brandname.text,
                                        minCharge: minCharge.text,
                                        disc: disccription.text);

                                  }
                                  else{
                                    showtoast(msg: "password dontmatch", color: Colors.red);

                                  }



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
                                    'I have account have an account? ',
                                    style: TextStyle(
                                      color: Color(0xFF7D8FAB),
                                      fontSize: 16,

                                      fontWeight: FontWeight.w400,
                                      height: 1.38,
                                    ),
                                  ),
                                  TextButton(onPressed: (){
                                    naviagtefinsh(context, Logincsreen());
                                  }, child:  Text(
                                    'Login ',
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
