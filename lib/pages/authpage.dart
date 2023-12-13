import 'package:flutter/material.dart';

import 'forgetpassword.dart';
import 'login.dart';
import 'signup.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  List<String> _buttonTitles = [
    "Sign Up",
    "Log in",
    "Forget Password",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buttonTitles
                  .asMap()
                  .entries
                  .map(
                    (entry) => Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 30, 20),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _moveSelectedButton(entry.key);
                          });
                        },
                        child: Text(
                          entry.value,
                          style: TextStyle(
                              fontSize: 30,
                              color: entry.key == 0
                                  ? const Color.fromARGB(255, 81, 92, 111)
                                  : Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: Container(
              child: _buildSelectedWidget(),
            ),
          ),
        ],
      ),
    );
  }

  void _moveSelectedButton(int index) {
    if (index != 0) {
      String selectedButton = _buttonTitles[index];
      _buttonTitles.removeAt(index);
      _buttonTitles.insert(0, selectedButton);
    }
  }

  Widget _buildSelectedWidget() {
    String selectedButton = _buttonTitles[0];
    // Return the widget based on the selected button
    switch (selectedButton) {
      case "Sign Up":
        return SignUpPage();
      case "Log in":
        return LoginPage();

      case "Forget Password":
        return ForgetPasswordPage();
      default:
        return Container();
    }
  }
}
