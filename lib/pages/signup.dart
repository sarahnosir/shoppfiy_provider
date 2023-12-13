import 'package:flutter/material.dart';
import 'package:shopify_app/widgets/auth_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            label: Text(
                              'Email',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 81, 92, 111)),
                            ),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color.fromARGB(233, 114, 124, 142),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            border: InputBorder.none),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            label: Text(
                              'Username',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 81, 92, 111)),
                            ),
                            prefixIcon: Icon(
                              Icons.account_box_outlined,
                              color: Color.fromARGB(233, 114, 124, 142),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            border: InputBorder.none),
                      ),
                      TextField(
                        obscuringCharacter: "*",
                        obscureText: true,
                        decoration: InputDecoration(
                            label: Text(
                              'Password',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 81, 92, 111)),
                            ),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromARGB(233, 114, 124, 142),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 255, 255, 255),
                            border: InputBorder.none),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                AuthCustomButton(text: 'SIGN UP', onBtnPressed: () {}),
                Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'By creating an account, you agree to our',
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          TextSpan(
                              text: ' Terms of Service ',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 255, 105, 105))),
                          TextSpan(
                              text: 'and',
                              style: TextStyle(
                                fontSize: 12,
                              )),
                          TextSpan(
                              text: ' Privacy Policy',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 255, 105, 105)))
                        ])))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
