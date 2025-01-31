part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

// ignore: must_be_immutable
class Authenticated extends AuthState {
  User? user;
  Authenticated(this.user);
}

class Unauthenticated extends AuthState {}

class AuthenticatedError extends AuthState {
  final String message;
  AuthenticatedError({required this.message});
}
