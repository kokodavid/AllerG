import 'package:allerg/user_model.dart';
import 'package:equatable/equatable.dart';

enum AuthEvents{ appStart, signUp}

abstract class AuthEvent extends Equatable{

  const AuthEvent();

  @override
  List<Object> get props => [];

  dynamic name();

}

class AppStart extends AuthEvent{
  @override
  name() {
    return AuthEvents.appStart;
  }

}

class SignUpEmail extends AuthEvent {

  String? email;
  String? username;
  String? password;
  String? userType;
  String? credential;
  String? imageUrl;
  String? uid;
  DateTime? createdAt;


  SignUpEmail(this.email, this.username, this.password, this.userType,
      this.credential, this.imageUrl, this.uid, this.createdAt);

  @override
  name() {
    return AuthEvents.signUp;
  }

}