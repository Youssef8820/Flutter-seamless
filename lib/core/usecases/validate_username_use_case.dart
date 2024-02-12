import 'package:regexpattern/regexpattern.dart';

class ValidateUsernameUseCase {

  String? call(String text){
    if(text.trim().isEmpty){
      return "Please enter your password";
    } else if(!text.isUsername()) {
      return "Please enter a correct password form";
    } else {
      return null;
    }
  }

}