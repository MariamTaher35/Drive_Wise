import 'package:flutter/material.dart';

typedef onButtonPressed = void Function();

Widget defaultTextFormField({
  required String labelText,
  required String hintText,
  bool obscure = false,
  required TextEditingController controller,
  required TextInputType inputType,
  required FormFieldValidator validate,
  required IconData prefix,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      validator: validate,
      keyboardType: inputType,
      obscureText: obscure,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          prefixIcon: Icon(
            prefix,
            color: Color.fromRGBO(79, 172, 254, 1),
          ),
          suffixIcon: suffix != null
              ? Icon(
                  suffix,
                  color: Color.fromRGBO(79, 172, 254, 1),
                )
              : null),
    );

Widget defaultButton({
  required String text,
  double width = 216.0,
  double height = 47.0,
  required onButtonPressed function,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color.fromRGBO(79, 172, 254, 1),
      ),
      width: width,
      height: height,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
      ),
    );
