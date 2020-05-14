import 'package:amigo_gigante_app/animals/model/animal.dart';
import 'package:flutter/material.dart';

class AnimalCard extends StatelessWidget{
  Animal animal;
  AnimalCard({Key key, this.animal});
  @override
  Widget build(BuildContext context) {
    final  image= Container(
      
      height: 200,
      
      width:270,

      decoration: BoxDecoration(
       
        
        image: DecorationImage(
          
          image:NetworkImage(animal.getImg(),),
             fit: BoxFit.cover
          ),
        //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(300),bottomRight: Radius.circular(300)),

      ),
    );
    final  title= Container(
      height: 30,
      width:350,
      margin: EdgeInsets.only(top:10),
      decoration: BoxDecoration(
        
        color:Colors.white,
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
        
      ),
      child:Text("${animal.getName()}",style: TextStyle(fontSize: 17,color: Colors.black),textAlign: TextAlign.center),
    );

    // TODO: implement build
    return Container(
      width: 300,
      height: 280,
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.black,
            offset: Offset(0,1),
          )
        ],
        color:Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        
      ),
      child: Column(
      children: <Widget>[
        image,
        title,
       
      ],

    )
    );
  }




}