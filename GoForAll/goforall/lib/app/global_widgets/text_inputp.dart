import 'package:flutter/material.dart';

class TextInputP extends StatefulWidget{
  int maxLines = 1;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;  
  final IconData iconData;
  final bool isPassword;
  TextInputP({
    Key? key, 
    required this.hintText, 
    required this.inputType, 
    required this.controller, 
    required this.iconData,
    required this.isPassword
  });

  @override
  State<StatefulWidget> createState() {
    return _TextInputP();
  }

}

class _TextInputP extends State<TextInputP>{

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
       FocusScope.of(context).requestFocus(FocusNode());
      },
      child:  Container(
          padding: EdgeInsets.only(
            right: 60,
            left: 60
          ),
          child: TextFormField(
            obscureText: widget.isPassword,
            controller: widget.controller,
            keyboardType: widget.inputType,
            validator: (value) => value == "" ? "No puedes dejar este campo vacio" : null,
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Roboto",
              color: Colors.grey,
              fontWeight: FontWeight.normal
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 15.0, color: Colors.black26),
              suffixIcon: Icon(widget.iconData),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade300
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.greenAccent
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red
                ),
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            ),
          ),
        )
      );
  }

}