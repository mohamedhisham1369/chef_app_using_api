import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/network/diohelper/diohelper.dart';
import 'package:flutter_application_1/screens/sendcode/cubit/sendcode_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../network/diohelper/endpoints.dart';


class SendcodeCubit extends Cubit<SendcodeState> {
  SendcodeCubit() : super(SendcodeInitial());

  static SendcodeCubit get(context)=>BlocProvider.of(context);


  void sendcode(email){
      emit(Sendcode_loading_state());
    diohelper.postdata(url:chef_send_code , data: {"email": email})
        .then((value) {

      print(value.data);
      emit(Sendcode_success_state());


    })
        .catchError((error){
          print(error.toString());
      emit(Sendcode_error_state());
    }

    );


  }



}
