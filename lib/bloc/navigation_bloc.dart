import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';

class NavigationBloc extends Bloc<NavigationEvent, int> {
  NavigationBloc() : super(0) {
    // Register event handlers
    on<NavigateToPage1>((event, emit) => emit(1));
    on<NavigateToPage2>((event, emit) => emit(2));
    on<NavigateToPage3>((event, emit) => emit(3));
  }
}