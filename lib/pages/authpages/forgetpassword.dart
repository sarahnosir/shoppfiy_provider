import 'package:flutter/material.dart';
import 'package:shopify_app/widgets/auth_button.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            // color: Colors.red,
            child: const Padding(
          padding: EdgeInsets.fromLTRB(50, 40, 50, 20),
          child: Text(
              maxLines: 3,
              style: TextStyle(
                color: Color.fromARGB(255, 81, 92, 111),
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
              'Enter the email address you used to create your account and we will email you a link to reset your password'),
        )),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                padding: EdgeInsets.all(8),
                height: 70,
                child: const TextField(
                  decoration: InputDecoration(
                      label: Text(
                        'Email',
                        style:
                            TextStyle(color: Color.fromARGB(255, 81, 92, 111)),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Color.fromARGB(233, 114, 124, 142),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AuthCustomButton(text: "Send Email", onBtnPressed: () {})
            ],
          ),
        ),
      ],
    );
  }
}
