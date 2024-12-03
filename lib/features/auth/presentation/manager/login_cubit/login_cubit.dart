import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_lang_app/core/errors/failure.dart';
import 'package:sign_lang_app/core/utils/api_service.dart';
import 'package:sign_lang_app/core/utils/constants.dart';
import 'package:sign_lang_app/core/utils/sharedprefrence.dart';
import 'package:sign_lang_app/core/widgets/custom_button_animation.dart';
import 'package:sign_lang_app/features/auth/data/models/signIn_response.dart';
import 'package:sign_lang_app/features/auth/data/models/signin_req.dart';
import 'package:sign_lang_app/features/auth/domain/usecases/signin_usecase.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final DioClient dioClient; // Add DioClient as a dependency

  // Constructor with DioClient injection
  LoginCubit({required this.dioClient}) : super(LoginInitial());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final GlobalKey<CustomButtonState> btnKey = GlobalKey();

  void execute(
      {required SigninReqParams params, required SignInUsecase usecase}) async {
    emit(LoginLoading());
    btnKey.currentState!.animateForward();
    try {
      final Either<Failure, LoginResponse> result = await usecase.call(params);

      result.fold(
        (error) {
          print('Login error: ${error.message}'); // Log the error message
          emit(LoginFailure(errorMessage: error.message));
          btnKey.currentState!.animateReverse();
        },
        (data) async {
          await saveUserToken(data.token);
          await saveUserdata(data.user!.email, data.user!.name, data.user!.id);

          // Save email and username
          print('Login successful: ${data.token}'); // Log success message
          emit(LoginSuccess(
            message: data.message,
            userName: data.user!.name,
            userEmail: data.user!.email,
            id: data.user!.id,
          )); // Ensure you pass the user's name if available
          btnKey.currentState!.animateReverse();
        },
      );
    } catch (e) {
      print('Exception occurred: $e'); // Log the exception
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }

  Future<void> saveUserToken(String token) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userToken, token);
    dioClient.setTokenIntoHeaderAfterLogin(
        token); // Use the injected DioClient instance
  }

  Future<void> saveUserdata(String email, String name, String id) async {
    await SharedPrefHelper.setData(SharedPrefKeys.userEmail, email);
    await SharedPrefHelper.setData(SharedPrefKeys.username, name);
    await SharedPrefHelper.setData(SharedPrefKeys.userid, id);
  }
}
