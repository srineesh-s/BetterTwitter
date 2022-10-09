import 'package:bettertwitter/screens/authentication/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this.authRepository) : super(AuthenticationInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        await authRepository.login(event.email, event.password);
        emit(AuthenticationSuccess());
      } catch (e) {
        emit(AuthenticationFailure(e.toString()));
      }
    });
    on<SignupEvent>((event, emit) async {
      emit(AuthenticationLoading());
      try {
        try {
          await authRepository.signup(event.email, event.password, event.name);
          emit(AuthenticationSuccess());
        } catch (e) {
          emit(AuthenticationFailure(e.toString()));
        }
      } catch (e) {
        emit(AuthenticationFailure(e.toString()));
      }
    });
  }

  AuthRepository authRepository;
}
