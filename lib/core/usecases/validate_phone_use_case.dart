import 'package:regexpattern/regexpattern.dart';

class ValidatePhoneUseCase {

  String? call(String text){
    if(text.trim().isEmpty){
      return "Please enter your phone number";
    } else if(!text.isPhone()) {
      return "Please enter a correct phone number";
    } else {
       return null;
    }
  }

}