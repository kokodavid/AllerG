import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_event.dart';

enum AuthStates {unInitializedState, authenticatedState, unAuthenticatedState }

abstract class AuthState extends Equatable {

  const AuthState() : super();

  @override
  List<Object> get props => [];
  dynamic name();
}

class AuthenticatedState extends AuthState{
  User? user;

  AuthenticatedState(this.user);

  @override
  name() {
   return AuthStates.authenticatedState;
  }

}

class UnInitializedState extends AuthState{
  @override
  name() {
    return AuthStates.unInitializedState;
  }


}

class UnAuthenticatedState extends AuthState{
  @override
  name() {
   return AuthStates.unAuthenticatedState;
  }

}


