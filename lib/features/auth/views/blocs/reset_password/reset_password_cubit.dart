import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';
import 'package:smart_soft/features/auth/views/screens/otp_screen.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  TextEditingController phoneNumberController = TextEditingController();

  onResetClick(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (_)=> const OtpScreen()));
  }


}
