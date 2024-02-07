import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app_using_bloc/bloc/wallpaper_bloc.dart';
import 'package:wallpaper_app_using_bloc/data_source_api/remote/api_helper.dart';
import 'package:wallpaper_app_using_bloc/screens/home_screen.dart';
import 'package:wallpaper_app_using_bloc/screens/nab_bar.dart';
///test
void main() {

  runApp(
   BlocProvider<WallpaperBloc>(
       create: (context) => WallpaperBloc(apiHelper: ApiHelper()),
       child:  MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
