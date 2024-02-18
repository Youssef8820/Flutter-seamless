import 'package:regexpattern/regexpattern.dart';

class ValidateEmailUseCase {

  String? call(String text){
    if(text.trim().isEmpty){
      return "Please enter your email";
    } else if(!text.isEmail()) {
      return "Please enter a correct email";
    } else {
       return null;
    }
  }

}