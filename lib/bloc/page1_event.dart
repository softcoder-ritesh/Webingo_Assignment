abstract class UserPlanEvent {}

class FetchUserPlans extends UserPlanEvent {
  final String date;

  FetchUserPlans(this.date);
}

class UpdateUserPlans extends UserPlanEvent {
  final String date;
  final List<Map<String, dynamic>> plans;

  UpdateUserPlans(this.date, this.plans);
}