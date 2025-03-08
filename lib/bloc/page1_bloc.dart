import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webingo_assignment/api_service.dart';
import 'package:webingo_assignment/bloc/page1_bloc.dart';
import 'package:webingo_assignment/bloc/page1_event.dart';
import 'package:webingo_assignment/bloc/page1_state.dart';



class UserPlanBloc extends Bloc<UserPlanEvent, UserPlanState> {
  final FitnessApiService apiService;

  UserPlanBloc(this.apiService) : super(UserPlanInitial()) {
    // Register event handlers
    on<FetchUserPlans>(_onFetchUserPlans);
    on<UpdateUserPlans>(_onUpdateUserPlans);
  }

  Future<void> _onFetchUserPlans(FetchUserPlans event, Emitter<UserPlanState> emit) async {
    emit(UserPlanLoading());
    try {
      final userPlans = await apiService.fetchUserPlans(event.date);
      // Always emit UserPlanLoaded, even if the data is empty
      emit(UserPlanLoaded(userPlans));
    } catch (e) {
      emit(UserPlanError(e.toString()));
    }
  }

  Future<void> _onUpdateUserPlans(UpdateUserPlans event, Emitter<UserPlanState> emit) async {
    emit(UserPlanLoading());
    try {
      if (event.plans.isEmpty) {
        emit(UserPlanError("No plans provided for update."));
      } else {
        final response = await apiService.updateUserPlans(event.date, event.plans);
        emit(UserPlanUpdated(response['message']));
        add(FetchUserPlans(event.date)); // Fetch updated plans
      }
    } catch (e) {
      emit(UserPlanError(e.toString()));
    }
  }
}