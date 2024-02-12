import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_soft/core/errors/exception.dart';

abstract class AuthRemoteDataSource {

  Future login({required String phoneNumber, required String password});

  Future registerSeller({required String username,required String phoneNumber,required String tradeRegister,required String taxId,required String password});

  Future registerBuyer({required String username,required String phoneNumber,required String password});

  Future<void> sendOtp({required String phoneNumber});

  Future<void> confirmOtp({required String otp});

}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {


  final _auth = FirebaseAuth.instance;
  String _verificationId = '';

  @override
  Future login({required String phoneNumber, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future registerBuyer({required String username, required String phoneNumber, required String password}) {
    // TODO: implement registerBuyer
    throw UnimplementedError();
  }

  @override
  Future registerSeller({required String username, required String phoneNumber, required String tradeRegister, required String taxId, required String password}) {
    // TODO: implement registerSeller
    throw UnimplementedError();
  }

  @override
  Future<void> sendOtp({required String phoneNumber}) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {

        },
        verificationFailed: (FirebaseAuthException e) {
          throw RemoteDataException(e.message ?? "Unknown Error happened");
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          return;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
          return;
        },
      );
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  @override
  Future<void> confirmOtp({required String otp}) async {
    try {
      print(1);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: otp);
      print(2);
      await _auth.signInWithCredential(credential);
      print(3);

      return ;
    } catch (e) {
      throw RemoteDataException(e.toString());
    }

  }


}