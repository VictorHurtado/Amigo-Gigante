import 'package:flutter/material.dart';


class BlueCircularButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;
  final double width;

  const BlueCircularButton({Key key, @required this.text,@required this.onPressed,@required this.width}) ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: onPressed,
      child: Container(
      
        width: width,
        height: 50,
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(45, 235, 237, 1),
          borderRadius: BorderRadius.all(Radius.circular(40)),
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