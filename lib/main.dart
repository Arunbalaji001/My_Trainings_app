import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_trainings_app/cubits/filter_data_cubit/filter_data_cubit.dart';
import 'package:my_trainings_app/cubits/training_data_cubit/training_data_cubit.dart';
import 'package:my_trainings_app/screens/homepage_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
         BlocProvider(create: (context) => TrainingDataCubit(),lazy: false,),
         BlocProvider(create: (context) => FilterDataCubit()..extrapolateData(),lazy: false,),
       ],

      child: MaterialApp(
        title: 'My Trainings App',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomepageWidget(),
      ),
    );
  }
}

