import '../../../network/models/loginusermodel/loginusermodle.dart';


abstract class loginstates{}

class Login_Init_state extends loginstates{}

class Login_suffixicon_change_state extends loginstates{}

class Login_loading_state extends loginstates{}




class Login_success_state extends loginstates{
  late loginmodel? Login_model;
  Login_success_state(this.Login_model);

}

class Login_error_state extends loginstates{
  late String error;
  Login_error_state(this.error);

}


