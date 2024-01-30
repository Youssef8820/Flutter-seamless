import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:smart_soft/features/auth/views/screens/register_screen.dart';
import 'package:smart_soft/features/products/views/screens/products_screen.dart';

import '../../../../../core/views/widgets/custom_flush_bar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = true;

  onForgotPasswordClick(BuildContext context){
    navigateToRegisterScreen(context);
  }

  onLoginClick(BuildContext context){
    login(context);
  }

  onRegisterClick(BuildContext context){
    navigateToRegisterScreen(context);
  }

  login(BuildContext context){
    emit(LoginLoading());
    getIt<SignInUseCase>().call(emailController.text, passwordController.text).then(
      (value) => value.fold(
        (error) {
          emit(LoginError(error));
          showFlushBar(
            context,
            title: "Error ${error.failureCode}",
            message : error.message
          );
          emit(LoginInitial());
        },
        (user) {
          emit(LoginSuccess());
          navigateToProductsScreen(context);
          emit(LoginInitial());
        }
      )
    );
  }

  navigateToRegisterScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const RegisterScreen()));
  }

  navigateToProductsScreen(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const ProductsScreen()));
  }

}
