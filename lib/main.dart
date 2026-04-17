import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/routing/app_route.dart';
import 'package:flutter_project/my_app.dart';
import 'package:flutter_project/features/home/cubit/home_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
        // إذا عندك Cubits ثانية ضيفها هون
      ],
      child: MyApp(appRoute: AppRoute()),
    ),
  );
}
