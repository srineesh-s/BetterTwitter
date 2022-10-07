import 'package:bettertwitter/screens/authentication/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this.authRepository) : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {});
  }

  AuthRepository authRepository;
}
