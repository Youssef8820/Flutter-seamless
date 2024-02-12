import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/core/infrastructure/services/image_picker_service.dart';
import 'package:smart_soft/core/usecases/validate_username_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/register_use_case.dart';
import 'package:smart_soft/features/auth/domain/usecases/send_otp_use_case.dart';
import 'package:smart_soft/features/auth/views/screens/00_auth_methods_screen.dart';
import 'package:smart_soft/features/auth/views/screens/01_login_screen.dart';
import 'package:smart_soft/features/auth/views/screens/04_otp_screen.dart';
import 'package:smart_soft/features/auth/views/screens/05_message_screen.dart';

import '../../../../../core/di/app_module.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecases/validate_password_use_case.dart';
import '../../../../../core/usecases/validate_phone_use_case.dart';
import '../../../../../core/views/widgets/custom_flush_bar.dart';
import '../../../../../generated/locale_keys.g.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController tradeRegisterController = TextEditingController();
  TextEditingController taxIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  XFile? file;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  String? validateUsername(){
    return getIt<ValidateUsernameUseCase>().call(usernameController.text);
  }

  String? validatePhone(){
    return getIt<ValidatePhoneUseCase>().call(phoneNumberController.text);
  }

  String? validateTradeRegister(){
    if(tradeRegisterController.text.trim().isEmpty){
      return "Please Enter your trade register";
    } else {
      return null;
    }
  }

  String? validateTaxId(){
    if(taxIdController.text.trim().isEmpty){
      return "Please Enter your Tax Id";
    } else {
      return null;
    }
  }

  String? validatePassword(){
    return getIt<ValidatePasswordUseCase>().call(passwordController.text);
  }


  onRegisterClick(BuildContext context){
    if(formKey.currentState!.validate()){
      sendOtp(context);
    }
  }

  onLoginClick(BuildContext context){
    navigateToLoginScreen(context);
  }

  onDoneClick(BuildContext context){
    navigateToAuthMethodsScreen(context);
  }

  onUploadClick(){
    pickPhoto();
  }

  pickPhoto() async {
    emit(RegisterPickPhoto());
    file = await getIt<ImagePickerService>().pickImageFromGallery();
    emit(RegisterInitial());
  }

  register(BuildContext context){
    emit(RegisterLoading());
    getIt<RegisterUseCase>().call(phoneNumberController.text,passwordController.text)
    .then((value) => value.fold(
      (error) {
        emit(RegisterError(error));
        showFlushBar(
            context,
            title: "Error ${error.failureCode}",
            message : error.message
        );
        emit(RegisterInitial());
      },
      (success) {
        emit(RegisterSuccess());
        navigateToRegisterMessageScreen(context);
        emit(RegisterInitial());
      }
    ));
  }

  sendOtp(BuildContext context){
    emit(RegisterLoading());
    getIt<SendOtpUseCase>().call(phoneNumberController.text)
        .then((value) => value.fold(
          (error) {
            emit(RegisterError(error));
            showFlushBar(
                context,
                title: "Error ${error.failureCode}",
                message : error.message
            );
            emit(RegisterInitial());
          },
          (success) {
            emit(RegisterSuccess());
            navigateToOtpScreen(context);
            emit(RegisterInitial());
          }
    ));

  }

  navigateToLoginScreen(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const LoginScreen()));
  }


  navigateToRegisterMessageScreen(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (_)=> MessageScreen(
      title: LocaleKeys.all_done.tr(),
      description: LocaleKeys.all_done_description.tr(),
    )));
  }

  navigateToAuthMethodsScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (_)=> const AuthMethodsScreen()), (route) => false);
  }

  navigateToOtpScreen(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (_)=> OtpScreen(phoneNumber: phoneNumberController.text,)));
  }

}
