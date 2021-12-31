import 'package:allerg/BLoC/auth/auth_event.dart';
import 'package:allerg/BLoC/auth/auth_state.dart';
import 'package:allerg/repository/authgroup/auth_repository.dart';
import 'package:allerg/user_model.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthRepository _authRepository;

  // AuthBloc(this._authRepository) : super(null);

  AuthBloc({required AuthRepository authRepository, AuthState? initialState})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(initialState ?? UnInitializedState());



  @override
  AuthState get initialState => UnInitializedState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    switch (event.name()) {
      case AuthEvents.appStart:
        yield* mapAppStartToState();
        break;
      case AuthEvents.signUp:
        yield* mapSignUpToState(event);
        break;
    }
  }

  Stream<AuthState> mapAppStartToState() async* {
    try {
      final isAuthenticated = await _authRepository.isAuthenticated();

      if (isAuthenticated) {
        yield AuthenticatedState(await _authRepository.getUser());
      } else {
        yield UnAuthenticatedState();
      }
    } catch (_) {
      yield UnAuthenticatedState();
    }
  }

  Stream<AuthState> mapSignUpToState(AuthEvent event) async* {
   var res =  await _authRepository.signUp(
        (event as SignUpEmail).email,
        (event).password,
        (event).username,
        (event).userType,
        (event).imageUrl,
        (event).credential,
        (event).uid);

   if(res) yield AuthenticatedState(await _authRepository.getUser());

  }

}
