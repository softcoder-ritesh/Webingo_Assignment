abstract class UserPlanState {}

class UserPlanInitial extends UserPlanState {}

class UserPlanLoading extends UserPlanState {}

class UserPlanLoaded extends UserPlanState {
  final Map<String, dynamic> userPlans;

  UserPlanLoaded(this.userPlans);
}

class UserPlanError extends UserPlanState {
  final String message;
  final bool isEmptyData; // Add this property

  // Update the constructor to include isEmptyData
  UserPlanError(this.message, {this.isEmptyData = false});

  @override
  List<Object> get props => [message, isEmptyData];
}

class UserPlanUpdated extends UserPlanState {
  final String message;

  UserPlanUpdated(this.message);
}