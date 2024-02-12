import 'package:regexpattern/regexpattern.dart';

class ValidatePasswordUseCase {

  String? call(String text){
    if(text.trim().isEmpty){
      return "Please enter your password";
    } else if(!text.isPasswordEasy()) {
      return "Please enter a correct password form";
    } else {
      return null;
    }
  }

}