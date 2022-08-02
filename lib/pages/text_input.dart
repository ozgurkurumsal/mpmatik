import 'package:flutter/material.dart';
import 'package:mpmatik/pages/palette.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {Key? key,
      @required this.icon,
      @required this.hint,
      this.inputType,
      this.inputAction,
      this.emailcontroller})
      : super(key: key);

  final IconData? icon;
  final String? hint;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final TextEditingController? emailcontroller;

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
            controller: emailcontroller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 11),
              border: InputBorder.none,
              hintText: hint,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  icon,
                  color: Colors.green,
                  size: 25,
                ),
              ),
              hintStyle: kBodyText,
            ),
            style: kBodyText,
            keyboardType: inputType,
            textInputAction: inputAction),
      ),
    );
  }
}
