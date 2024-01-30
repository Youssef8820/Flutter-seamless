import 'package:firebase_auth/firebase_auth.dart';

class UserModel {

  String? id;
  String? email;
  String? name;
  String? urlPhoto;
  String? phoneNumber;

  UserModel(this.id,this.email, this.name, this.urlPhoto, this.phoneNumber);

  UserModel.fromFirebase(User? user){
    id = user?.uid;
    email = user?.email ;
    name = user?.displayName;
    urlPhoto = user?.photoURL;
    phoneNumber = user?.phoneNumber;
  }



}