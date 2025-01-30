part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

class RegisterSuccess extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterFailure extends AuthState {
  final String errMessage;

  RegisterFailure({required this.errMessage});
}
