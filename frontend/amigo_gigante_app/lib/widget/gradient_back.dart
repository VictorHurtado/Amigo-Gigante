import 'dart:math';

import 'package:amigo_gigante_app/widget/banner_fundation.dart';
import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {


  
  double height=0.0;
  

  GradientBack({Key key,this.height});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    if(height==null){
      height=screenHeight;
      
    }
    return Container(
      height:height,
      width: screenWidth,
      color: Color.fromRGBO(45, 235, 237, 1),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //       colors: [
      //         Color.fromRGBO(45, 235, 247 , 1),
      //         Color.fromRGBO(45, , 219 , 1)
      //       ],
      //     begin: FractionalOffset(0.2, 0.0),
      //     end: FractionalOffset(1.0, 0.6),
      //       stops: [0.0, 0.6],
      //       tileMode: TileMode.clamp
      //   )
      // ),
      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment(0.0020,1.5),
        child: Stack(
          children: <Widget>[
            Transform.rotate(
              angle: pi/5,
              child: Container(
              
              width: screenHeight,
              height: screenHeight/2,
              decoration: BoxDecoration(
                color:Color.fromRGBO(230, 255, 255, 0.5)
              ),
            ),
            ),
            Transform.rotate(
              angle: -pi/5,
              child: Container(
              width: screenHeight,
              height: screenHeight/2,
              decoration: BoxDecoration(
                color:Color.fromRGBO(230, 255, 255, 0.5)
              ),
            ),
            ),
          
            
          ],
        ),
      ),

    );
  }

}