import 'package:allerg/BLoC/auth/auth_event.dart';
import 'package:allerg/repository/auth_repository.dart';
import 'package:allerg/user_model.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, UserModel>{



  final AuthRepository authRepository = AuthRepository();

  AuthBloc(this.authRepository) {
    on<AppStarted>((event, emit){
      try{

      }catch(error){
        emit(Failure(error));
      }
    });
  }
}