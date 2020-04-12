import 'package:flutter/material.dart';

class BannerFundation extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin:EdgeInsets.only(
        left:10,
        right: 10,
        top:30,
       
      ),
      width: MediaQuery.of(context).size.width,
      
      child: Column(
        children: <Widget>[
            RichText(
              textAlign: TextAlign.center,
            text: TextSpan(
              text: '',
              
              style:TextStyle(letterSpacing: 0.5,color: Colors.black),
              
              children: <TextSpan>[
                TextSpan(text: 'Adopta ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34)),
                TextSpan(text: 'No Compres\n',style: TextStyle(fontSize: 32,fontWeight:FontWeight.w300)),
                TextSpan(text: 'Fundacion Animal Salvando Vidas',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,wordSpacing: 0)),
                
              ],
            ),
          )
        ],
      ),
    );
  }


}