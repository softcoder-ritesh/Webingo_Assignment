import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/navigation_bloc.dart';
import 'pages/home_page.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug banner turned off
      home: BlocProvider(
        create: (context) => NavigationBloc(),
        child: BlocBuilder<NavigationBloc, int>(
          builder: (context, state) {
            if (state == 1) {
              return FirstPage();
            } else if (state == 2) {
              return PageTwo();
            } else if (state == 3) {
              return PageThree();
            }
            else {
              return HomePage();
            }
          },
        ),
      ),
    );
  }
}
