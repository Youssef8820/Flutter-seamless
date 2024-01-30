import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_soft/core/errors/exception.dart';
import '../../../domain/model/user_model.dart';

class FirebaseService {

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> signInWithEmailAndPassword(
      {required String email,required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebase(userCredential.user);
    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if(userCredential.user != null && !userCredential.user!.emailVerified){
        // Send email verification
        await userCredential.user?.sendEmailVerification();
      }

      return UserModel.fromFirebase(userCredential.user);

    } catch (e) {
      throw RemoteDataException(e.toString());
    }
  }

}