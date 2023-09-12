import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constantas/componets.dart';
import 'package:flutter_application_1/screens/addmeal/cubit/addmeal_cubit.dart';
import 'package:flutter_application_1/screens/addmeal/cubit/addmeal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addmealscreen extends StatelessWidget {
  var namecontroller=TextEditingController();
  var pricecontroller=TextEditingController();
   var categorycontroller;
  var Descriptioncontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AddmealCubit(),
      child: BlocConsumer<AddmealCubit,AddmealState>(
        listener:(BuildContext context, Object? state) {   },
        builder:(BuildContext context, state){
          return   Scaffold (
            appBar: AppBar(
              title: Text("Add Meal"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Image.asset(
                          "images/Ellipse 31.png",
                          width: 148,
                          height: 151,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: defaultformfield(
                              controller: namecontroller,
                              type: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty){
                                  return "Name is required";
                                }
                                else{
                                  return null;
                              }},
                              label: "name"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: defaultformfield(
                              controller: pricecontroller,
                              type: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty){
                                  return "price is required";
                                }
                                else{
                                  return null;
                                }},
                              label: "price"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            decoration: BoxDecoration(


                              shape: BoxShape.rectangle,
                              color: Colors.white12,

                            ),
                            child: DropdownButtonFormField(
                              isExpanded: true,
                                value: AddmealCubit.get(context).categories[0],
                                items: AddmealCubit.get(context).categories.map((e) =>
                                    DropdownMenuItem( value: e,child: Text("${e}"))).toList(),

                                onChanged: (data){
                                  categorycontroller=data;
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: defaultformfield(
                              controller: Descriptioncontroller,
                              type: TextInputType.text,
                              validation: (value){
                                if(value!.isEmpty){
                                  return "Description is required";
                                }
                                else{
                                  return null;
                                }},
                              label: "Description"),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [


                                Radio(value: true, groupValue: AddmealCubit.get(context).showNumber, onChanged: (
                                    value){
                                  AddmealCubit.get(context).chageradiobutton(value);
                                }),

                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                      "Number",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      )
                                  ),
                                ),
                                Spacer(),
                                Radio(value: false, groupValue: AddmealCubit.get(context).showNumber,
                                    onChanged: (value){
                                      AddmealCubit.get(context).chageradiobutton(value);

                                    }),
                                Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                      "Quantity",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                  ),
                                )                          ],
                            ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                                loadingbutton(inputstate: state is! Addmeal_loading_state,
                                    buttonname: "Add Meal",
                                Function: (){
                                  if(formkey.currentState!.validate()){
                                    AddmealCubit.get(context).addmeal(
                                        name: namecontroller.text,
                                        price: pricecontroller.text,
                                        category: categorycontroller,
                                        decription: Descriptioncontroller.text);

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
