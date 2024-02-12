import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/features/auth/domain/model/user_model.dart';

abstract class AuthRepo {

  Future<Either<Failure,UserModel>> signIn({required String email,required String password});

  Future<Either<Failure,UserModel>> register({required String email,required String password});

  Future<Either<Failure,void>> sendOtp({required String phoneNumber});

  Future<Either<Failure,void>> confirmOtp({required String otp});


}