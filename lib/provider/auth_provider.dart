import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController userNameController;
  late GlobalKey<FormState> formKey;
  bool obscureText = true;
  AuthProvider() {
    formKey = GlobalKey();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
  }
  String? passwordValidation() {
    String value = passwordController.text;
    if (value == '') {
      return 'password is required';
    }
    if (value.length < 8) {
      return 'Password length must be 8';
    }
    return null;
  }

  String? emailValdiation() {
    String value = emailController.text;
    if (value == '') {
      return 'email is required';
    }
    if (!EmailValidator.validate(value)) {
      return 'Enter Valid Email';
    }
    return null;
  }

  bool togglevisbilty() {
    return obscureText = !obscureText;
  }

  void togglevisbiltyIcon() {
    IconData icon;
    if (obscureText == true) {
      icon = Icons.visibility_off;
    } else {
      icon = Icons.visibility;
    }
    notifyListeners();
  }
}
