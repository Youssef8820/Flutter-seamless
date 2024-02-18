import 'package:dartz/dartz.dart';
import '/core/errors/failure.dart';
import '/features/auth/domain/model/user_model.dart';

abstract class AuthRepo {

  Future<Either<Failure,UserModel>> login({required String email,required String password});

  Future<Either<Failure,UserModel>> register({required String username,required String email,required String password});



}