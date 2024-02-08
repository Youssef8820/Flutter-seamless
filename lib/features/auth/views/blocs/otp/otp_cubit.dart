import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  String pinCode = "";

  onConfirmClick(BuildContext context) {

  }

  onPinChange(String pin){
    pinCode = pin;
  }

  onResendClick(){

  }


}
