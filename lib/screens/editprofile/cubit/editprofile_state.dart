
abstract class EditprofileState {}

class EditprofileInitial extends EditprofileState {}

class Editprofile_loading_state extends EditprofileState {}
class Editprofile_success_state extends EditprofileState {}
class Editprofile_error_state extends EditprofileState {
  var massage;
  Editprofile_error_state(this.massage);

}
