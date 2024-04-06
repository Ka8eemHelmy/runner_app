import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:run_app/view_model/cubits/counter_cubit/counter_cubit.dart';
import 'package:run_app/view_model/utils/app_colors.dart';
import 'view/screens/names/names.dart';
import 'view_model/cubits/names_cubit/names_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit(),),
        BlocProvider(create: (context) => NamesCubit(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: AppColors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            bodyLarge: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
            bodyMedium: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            bodySmall: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            titleLarge: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              color: AppColors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            titleSmall: TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
        ),
        home: NamesScreen(),
      ),
    );
  }
}
