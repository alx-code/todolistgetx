import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget{
  Color colorPrincipal;
  Color colorSecundary;
  GradientBack({Key? key, required this.colorPrincipal, required this.colorSecundary });
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    var height = screenHeight;

    final gradient = Container(
      width: screenWidth,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.2, 0.0),
          end: FractionalOffset(0.2, 1),
          colors: [
            colorPrincipal,
            colorSecundary
          ],
          stops: [0.0, 1],
          tileMode: TileMode.clamp
        ),
      ),
     child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(-1.5, -0.8),
        child: Container(
          width: screenHeight,
          height: screenHeight,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            borderRadius: BorderRadius.circular(screenHeight / 2),
          ),
        ),
      ),
    );
    return gradient;
  }
}