import 'package:flutter/material.dart';
import 'package:mpmatik/pages/palette.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput(
      {Key? key,
      @required this.icon,
      @required this.hint,
      @required this.inputAction,
      this.passwordcontroller})
      : super(key: key);

  final IconData? icon;
  final String? hint;
  final TextInputAction? inputAction;
  final TextEditingController? passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          controller: passwordcontroller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 11),
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 50,
                margin: const EdgeInsets.only(right: 5),
                decoration: const BoxDecoration(
                  border: Border(right: BorderSide(color: Colors.green)),
                ),
                child: Icon(
                  icon,
                  color: Colors.green,
                  size: 25,
                ),
              ),
            ),
            hintStyle: kBodyText,
          ),
          obscureText: true,
          style: kBodyText,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}
