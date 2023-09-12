import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/editprofile/cubit/editprofile_cubit.dart';
import 'package:flutter_application_1/screens/editprofile/cubit/editprofile_state.dart';
import 'package:flutter_application_1/screens/loginscreen/loginscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/cahehelper.dart';
import '../../constantas/componets.dart';

class editprofile extends StatelessWidget {

  var name_controller=TextEditingController();
  var phone_controller=TextEditingController();
  var brand_name_controller=TextEditingController();
  var minimum_charge_controller=TextEditingController();
  var description_controller=TextEditingController();
  var location_controller=TextEditingController();
  var formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>EditprofileCubit(),
      child: BlocConsumer<EditprofileCubit,EditprofileState>(
        listener:(BuildContext context, Object? state) {   },
        builder:(BuildContext context, state){
          return   Scaffold (
            appBar: AppBar(
              title: Text("Edit profile"),
            ),
            body:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(radius: 30,

                          child: Image(
                            fit: BoxFit.fill ,
                            image: AssetImage("images/background_image 1.png",)
                            ,


                          )

                          ,),
                        SizedBox(height: 20,),
                        Container(
                          child: defaultformfield(
                              controller: name_controller,
                              type: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty)
                                {
                                  return "please enter your name";

                                }
                                return null;

                              },
                              label: 'Name',
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: defaultformfield(
                            controller: phone_controller,
                            type: TextInputType.number,
                            validation: (value){
                              if(value!.isEmpty)
                              {
                                return "please enter phone number";

                              }
                              return null;

                            },
                            label: 'Phone',
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: defaultformfield(
                            controller: brand_name_controller,
                            type: TextInputType.text,
                            validation: (value){
                              if(value!.isEmpty)
                              {
                                return "please enter brand name";

                              }
                              return null;

                            },
                            label: 'brand name',
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: defaultformfield(
                            controller: minimum_charge_controller,
                            type: TextInputType.number,
                            validation: (value){
                              if(value!.isEmpty)
                              {
                                return "please enter minimumcharge";

                              }
                              return null;

                            },
                            label: 'minimum_charge',
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: defaultformfield(
                            controller: description_controller,
                            type: TextInputType.text,
                            validation: (value){
                              if(value!.isEmpty)
                              {
                                return "please enter description";

                              }
                              return null;

                            },
                            label: 'description',
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: defaultformfield(
                            controller: location_controller,
                            type: TextInputType.text,
                            validation: (value){
                              if(value!.isEmpty)
                              {
                                return "please enter location";

                              }
                              return null;

                            },
                            label: 'location',
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: loadingbutton(
                              inputstate: state is! Editprofile_loading_state,
                              buttonname: "update ",
                            Function: (){

                                if(formkey.currentState!.validate()){
                                  EditprofileCubit.get(context).
                                  editprofile(
                                      name: name_controller.text,
                                      phone: phone_controller.text,
                                      brandname: brand_name_controller.text,
                                      minimumcharge: minimum_charge_controller.text,
                                      description: description_controller.text,
                                      location: location_controller.text );

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
