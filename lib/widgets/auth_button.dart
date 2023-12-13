import 'package:flutter/material.dart';

class AuthCustomButton extends StatelessWidget {
  const AuthCustomButton(
      {required this.text, required this.onBtnPressed, super.key});

  final String text;
  final void Function()? onBtnPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onBtnPressed,
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          //elevation: 20,
          backgroundColor: Color.fromARGB(255, 255, 105, 105),
          shadowColor: Theme.of(context).primaryColor,
          minimumSize: const Size(400, 60)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        // Spacer(),
        Container(
          width: 30,
          height: 30,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.red,
            size: 24.0,
          ),
        ),
      ]),
    );
  }
}
