import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webingo_assignment/api_service.dart';
import 'package:webingo_assignment/bloc/navigation_bloc.dart';
import 'package:webingo_assignment/bloc/page1_bloc.dart';
import 'package:webingo_assignment/pages/home_page.dart';
import 'package:webingo_assignment/pages/page1.dart';
import 'package:webingo_assignment/pages/page2.dart';
import 'package:webingo_assignment/pages/page3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationBloc()),
        BlocProvider(
          create: (context) => UserPlanBloc(FitnessApiService()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppNavigator(), // Use a separate widget for navigation
      ),
    );
  }
}

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, int>(
      builder: (context, state) {
        if (state == 1) {
          return FirstPage();
        } else if (state == 2) {
          return PageTwo();
        } else if (state == 3) {
          return PageThree();
        } else {
          return HomePage();
        }
      },
    );
  }
}