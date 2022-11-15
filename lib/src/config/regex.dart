
import 'package:agora_test/src/config/validator.dart';

class EmailEditingRegexValidator extends RegexValidator {
  EmailEditingRegexValidator({required String regexSource}) : super(regexSource: regexSource);


  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{0,11}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}

class EmailEditingRegexValidatorSubmit extends RegexValidator {
  EmailEditingRegexValidatorSubmit({required String regexSource}) : super(regexSource: regexSource);


  String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{0,11}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }
}