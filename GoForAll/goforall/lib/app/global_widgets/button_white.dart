import 'package:flutter/material.dart';

class ButtonWhite extends StatefulWidget{
  final String buttonText;
  double width;
  double height;
  final VoidCallback onPressed;

  ButtonWhite({Key? key, required this.buttonText, required this.onPressed, required this.height, required this.width });

  @override
  State createState() {
    return _ButtonWhite();
  }

}

class _ButtonWhite extends State<ButtonWhite>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20
        ),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              offset: Offset(0,7)
            )
          ]
        ),
        child: Center(
          child:  
            Text(
              widget.buttonText,
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
                color: Color.fromRGBO(54, 65, 107, 42),
              )
            ),
          ),
      ),
    );
  }
}