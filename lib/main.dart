import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/routing/app_route.dart';
import 'package:flutter_project/features/my_profile/logic/cubit/my_profile_cubit.dart';
import 'package:flutter_project/features/my_profile/repo/my_profile_repo.dart';
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
        BlocProvider(
          create: (_) =>
              MyProfileCubit(MyProfileRepo(apiServices: ApiServices()))
                ..loadMyProfile(),
        ),
      ],
      child: MyApp(appRoute: AppRoute()),
    ),
  );
}
