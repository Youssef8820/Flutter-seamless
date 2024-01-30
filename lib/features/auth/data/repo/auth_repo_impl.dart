import 'package:dartz/dartz.dart';
import 'package:smart_soft/core/di/app_module.dart';
import 'package:smart_soft/core/errors/failure.dart';
import 'package:smart_soft/core/infrastructure/services/network_service.dart';
import 'package:smart_soft/features/auth/data/data_source/remote_data_source/firebase_service.dart';
import 'package:smart_soft/features/auth/domain/model/user_model.dart';
import 'package:smart_soft/features/auth/domain/repo/auth_repo.dart';

import '../../../../core/errors/exception.dart';

class AuthRepoImpl implements AuthRepo {

  NetworkService networkService = getIt<NetworkService>();
  FirebaseService remoteDataSource = getIt<FirebaseService>();


  @override
  Future<Either<Failure,UserModel>> register({required String email, required String password}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      UserModel user = await remoteDataSource.signUpWithEmailAndPassword(email: email, password: password);

      if(user.id == null){
        return left(RemoteDataFailure(
            "Failed to sign up, please try again later",
            failureCode: 1
        ));
      }

      return right(user);

    } on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }
  }

  @override
  Future<Either<Failure,UserModel>> signIn({required String email, required String password}) async {
    try{

      if(!await networkService.isConnected){
        return left(ServiceFailure(
            "Please check your internet connection",
            failureCode: 0
        ));
      }

      UserModel user = await remoteDataSource.signInWithEmailAndPassword(email:email, password:password);

      if(user.id == null){
        return left(RemoteDataFailure(
            "Failed to sign in, please try again later",
            failureCode: 1
        ));
      }

      return right(user);

    }on RemoteDataException catch (e){
      return left(RemoteDataFailure(e.message, failureCode: 2));

    } on ServiceException catch (e){
      return left(ServiceFailure(e.message,failureCode: 3));

    } catch (e) {
      return left(InternalFailure(e.toString(),failureCode: 4));
    }

  }
}