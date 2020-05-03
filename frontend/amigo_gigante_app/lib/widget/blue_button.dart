import 'package:flutter/material.dart';

class BlueButtonInk extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final double width;
  BlueButtonInk({Key key,@required this.text,@required this.onPressed,@required this.width});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
     onTap: onPressed,
     child: Container(
       margin: EdgeInsets.only(
         left: 10,
         right: 10,
         top: 20,
         
       ),
       height: 70,
       width: width,
       decoration: BoxDecoration(
         color: Color.fromRGBO(45, 235, 237, 1),
         borderRadius: BorderRadius.all(Radius.circular(10)),
         boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15.0,
              offset: Offset(0.0, 9.0)
            ),
          ],
       ),
       child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Lato",
              color: Colors.black
            ),

          ),
        ),
     ),
    );
  }

}