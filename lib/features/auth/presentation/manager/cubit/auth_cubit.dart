import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_fb/features/auth/data/repos/auth_repo_impl.dart';
import 'package:notes_app_fb/features/auth/presentation/manager/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepoImpl authRepo = AuthRepoImpl();

  Future<void> createUser({
    required String email,
    required String password,
  }) async {
    emit(CreateUserLoading());
    final response = await authRepo.createUser(
      email: email,
      password: password,
    );

    response.fold(
      (errMessage) => emit(CreateUserFailure(errMessage: errMessage)),
      (user) => emit(CreateUserSuccess(user: user)),
    );
  }

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final response = await authRepo.login(email: email, password: password);

    response.fold(
      (errMessage) => emit(LoginFailure(errMessage: errMessage)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }

  Future<void> googleSignin() async {
    emit(GoogleSigninLoading());
    final response = await authRepo.googleSignin();

    response.fold(
      (errMessage) => emit(GoogleSigninFailure(errMessage: errMessage)),
      (user) => emit(GoogleSigninSuccess(user: user)),
    );
  }
}
