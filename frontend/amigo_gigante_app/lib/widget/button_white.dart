import 'package:flutter/material.dart';

class ButtonWhite extends StatefulWidget{
  final String text;
  final double width;
  final VoidCallback onPressed;
 
   ButtonWhite({Key key, this.text, this.onPressed,this.width});

  @override
  State<StatefulWidget> createState() {
    
  
    // TODO: implement createState
    return _ButtonWhite();
  }


}

class _ButtonWhite extends State<ButtonWhite>{
  
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget.width,
      height: 50,
      margin: EdgeInsets.symmetric(
       
        vertical: 10
      ),
      
      child: RaisedButton(
        onPressed: widget.onPressed,
        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.white,

        
        child: Container(
          
            alignment: Alignment.centerLeft,
              
            child: Text(widget.text,textAlign: TextAlign.left,) 
            
        )
      )
    );
    
    // return MaterialButton(
    //   padding: EdgeInsets.symmetric(
    //     vertical:0,
    //     horizontal: 0, 
    //   ),
      

    //   onPressed: widget. onPressed,
    //   child: Container(
    //   width: 350,
    //   height: 50,
      
    //   padding: EdgeInsets.symmetric(
    //     horizontal: 10
    //   ),
    //   alignment: Alignment.centerLeft,
    //   decoration: BoxDecoration(
    //     color:Colors.white,
    //     borderRadius: BorderRadius.all(Radius.circular(50)),
    //     boxShadow: <BoxShadow>[
    //       BoxShadow(
    //         color: Colors.black26,
    //         blurRadius: 15.0,
    //         offset: Offset(0, -0.5)
    //       )
    //     ],
    //   ),     
    //   child: Text(widget.text,textAlign: TextAlign.left,) 
    
    // )
    // );
  }

}