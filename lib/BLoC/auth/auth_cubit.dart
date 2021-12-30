import 'package:allerg/user_model.dart';
import 'package:bloc/bloc.dart';

class AuthCubit extends Cubit<UserModel> {
  AuthCubit() : super(UserModel().empty);

  @override
  void onChange(Change<UserModel> change) {
    // TODO: implement onChange
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
  }

  @override
  void emit(UserModel state) {
    // TODO: implement emit
    super.emit(state);
  }

  void signedIn() => emit(state);
}