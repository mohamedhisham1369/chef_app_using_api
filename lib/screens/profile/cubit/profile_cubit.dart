import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/screens/profile/cubit/profile_state.dart';


class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
}
