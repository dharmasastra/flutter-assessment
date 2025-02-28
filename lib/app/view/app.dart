import 'package:flutter/material.dart';
import 'package:flutter_app1/home/bloc/bloc_bloc.dart';
import 'package:flutter_app1/home/views/home_page.dart';
import 'package:flutter_app1/profile/bloc/profile_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc()..add(FetchFeaturedProducts()),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc()..add(FetchFeaturedProfile()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
