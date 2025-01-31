part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class CheckLoginStatusEvent extends AuthEvent {}

//Login Event
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}

// Signup
class SignupEvent extends AuthEvent {
  final Usermodel user;
  SignupEvent({required this.user});
}

class LogoutEvent extends AuthEvent {}
