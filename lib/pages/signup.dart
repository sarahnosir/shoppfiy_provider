import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify_app/provider/auth_provider.dart';
import 'package:shopify_app/widgets/auth_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<AppAuthProvider>(context, listen: false).dispose();
    super.dispose();
  }

  bool obscureText = true;
  AppAuthProvider authProvider = AppAuthProvider();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppAuthProvider>(
      builder: (context, authProvider, child) {
        return Form(
          key: authProvider.formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: authProvider.emailController,
                          validator: (_) => authProvider.emailValdiation(),
                          decoration: const InputDecoration(
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
                          controller: authProvider.userNameController,
                          decoration: const InputDecoration(
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
                        TextFormField(
                          obscureText: authProvider.obscureText,
                          controller: authProvider.passwordController,
                          validator: (_) => authProvider.passwordValidation(),
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  authProvider.togglevisbilty();
                                },
                                child: authProvider.obscureText
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                              label: const Text(
                                'Password',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 81, 92, 111)),
                              ),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Color.fromARGB(233, 114, 124, 142),
                              ),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              border: InputBorder.none),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AuthCustomButton(
                    onBtnPressed: () async {
                      await authProvider.signUp(context);
                    },
                    text: 'SIGN UP',
                  ),
                  Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(children: [
                            TextSpan(
                                text:
                                    'By creating an account, you agree to our',
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
        );
      },
    );
  }
}
