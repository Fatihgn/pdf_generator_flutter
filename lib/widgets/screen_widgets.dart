import 'package:flutter/material.dart';

class CommonWidgets {
  static Widget my_text(String text, FontWeight weight, Color color) {
    return Text(
      text,
      style: TextStyle(fontSize: 21, fontWeight: weight, color: color),
    );
  }

  static Widget my_form(String hintText, Icon icon,
      TextEditingController controller, TextInputType inputType) {
    return TextFormField(
      controller: controller,
      validator: (tfgirdisi) {
        if (tfgirdisi!.isEmpty) {
          return 'Burası Boş Bırakılamaz';
        }
        return null;
      },
      style: const TextStyle(fontSize: 21),
      keyboardType: inputType,
      decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontSize: 21,
          ),
          contentPadding: const EdgeInsets.all(16),
          suffixIcon: icon,
          fillColor: const Color.fromARGB(113, 221, 220, 220),
          filled: true,
          hintText: hintText,
          border: InputBorder.none),
    );
  }
}
