import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/routing/app_route.dart';
import 'package:flutter_project/my_app.dart';
import 'package:flutter_project/features/home/cubit/home_cubit.dart';
import 'package:flutter_project/features/saved/logic/cubit/saved_articals_cubit.dart';
import 'package:flutter_project/features/saved/repo/saved_articals_repo.dart';
import 'package:flutter_project/core/services/api/api_services.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
        BlocProvider<SavedArticalsCubit>(
          create: (_) =>
              SavedArticalsCubit(SavedArticalsRepo(api: ApiServices())),
        ),
      ],
      child: MyApp(appRoute: AppRoute()),
    ),
  );
}
