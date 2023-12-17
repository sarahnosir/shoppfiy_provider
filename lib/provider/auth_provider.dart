import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../pages/master_page.dart';

class AppAuthProvider extends ChangeNotifier {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController userNameController;
  late GlobalKey<FormState> formKey;
  bool obscureText = true;

  void init() {
    formKey = GlobalKey();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
  }

  void providerdispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
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
    if (!EmailValidator.validate(value) &&
        value.split('@').last.contains('gmail')) {
      return 'Enter Valid Gmail';
    }

    return null;
  }

  void togglevisbilty() {
    obscureText = !obscureText;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    if ((formKey.currentState?.validate() ?? false)) {
      try {
        var credintials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        if (credintials.user != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const MasterPage()));
        } else {}
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Sorry, user not found',
          );
        } else if (e.code == 'wrong-password') {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Sorry, Worng Password',
          );
        }
      } catch (e) {}
    }
  }

  Future<void> signUp(BuildContext context) async {
    if ((formKey.currentState?.validate() ?? false)) {
      try {
        var credintials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          title: '',
          text: 'Sorry, use a different email',
        );
        if (credintials.user != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const MasterPage()));
        } else {}
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: 'Oops...',
            text: 'Sorry, use a different email',
          );
        } else if (e.code == 'weak-password') {}
      } catch (e) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          text: 'Weak Password',
        );
      }
    }
  }
}
