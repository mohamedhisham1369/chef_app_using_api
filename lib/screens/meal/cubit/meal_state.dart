
import '../../../network/models/meals/mealsmodel.dart';

abstract class MealState {}

class MealInitial extends MealState {}

class meal_loading_state  extends MealState {}
class meal_success_state  extends MealState {
  mealsmodel? model;
  meal_success_state(this.model);
}
class meal_error_state  extends MealState {}
