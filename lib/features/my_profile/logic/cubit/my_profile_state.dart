// import 'package:equatable/equatable.dart';
// import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';
// import 'package:flutter_project/features/home/models/article_model.dart';

// abstract class MyProfileState extends Equatable {
//   const MyProfileState();

//   @override
//   List<Object?> get props => [];
// }

// class MyprofileInit extends MyProfileState {
//   const MyprofileInit();
// }

// class LoadingState extends MyProfileState {
//   const LoadingState();
// }

// class SuccessState extends MyProfileState {
//   final User user;

//   const SuccessState(this.user, );
//   @override
//   List<Object?> get props => [user];
// }
// class GetArticalsSuccessState extends MyProfileState {
//   final ArticleModel articles;

//   const GetArticalsSuccessState(this.articles, );
//   @override
//   List<Object?> get props => [articles];
// }

// class FailureState extends MyProfileState {
//   final String errorMessage;
//   const FailureState(this.errorMessage);
//   @override
//   List<Object?> get props => [errorMessage];
// }
import 'package:equatable/equatable.dart';
import 'package:flutter_project/features/auth/data/model/signup_model/register_response.dart';
import 'package:flutter_project/features/home/models/article_model.dart';

abstract class MyProfileState extends Equatable {
  const MyProfileState();

  @override
  List<Object?> get props => [];
}

class MyProfileInitial extends MyProfileState {
  const MyProfileInitial();
}

class MyProfileLoading extends MyProfileState {
  const MyProfileLoading();
}

class MyProfileLoaded extends MyProfileState {
  final User user;
  final List<ArticleModel> articles;

  const MyProfileLoaded({required this.user, required this.articles});

  MyProfileLoaded copyWith({User? user, List<ArticleModel>? articles}) {
    return MyProfileLoaded(
      user: user ?? this.user,
      articles: articles ?? this.articles,
    );
  }

  @override
  List<Object?> get props => [user, articles];
}

class MyProfileFailure extends MyProfileState {
  final String errorMessage;

  const MyProfileFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
