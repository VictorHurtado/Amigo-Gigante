


import 'package:amigo_gigante_app/spice/ui/widget/button_white.dart';
import 'package:flutter/material.dart';

class GenericQuestionnaireFour extends StatelessWidget{
  final String title;
  final String description;
  final List<String> answers;
 

  const GenericQuestionnaireFour({Key key,@required this.title,@required this.description,@required this.answers});
  @override
  Widget build(BuildContext context) {
    double  height=MediaQuery.of(context).size.height;
    double  width=MediaQuery.of(context).size.width;
 
    // TODO: implement build
    final questionTitle=Container(
      height: 100,
      width:  width,
      padding: EdgeInsets.only(
        top: 50,
        right: 50,
        left:40,
      ),
      child: Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black,),
        ),
    );
    final questionDescription= Container(
      height: 200,
      width: width,
      
      child: Container(
        padding: EdgeInsets.only(
          bottom: 20,
          left: 40,
          right: 40,
          
          
        ),
        child: ListView(
          children: <Widget>[
            Text(
              description,
              maxLines: 9,
              style: TextStyle(
              fontSize:20.0,
              fontFamily: "Lato",
              color: Colors.black,
              fontWeight: FontWeight.w400 ,
             ),
            )
          ],
        ),
      ),
     

    );
    return Container(
      margin: EdgeInsets.only(
        top:50,
      ),
      height: height-190,
      child: Column(
      children: <Widget>[
     
        questionTitle,
        questionDescription,
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
          children: <Widget>[
            ButtonWhite(text: answers[0],onPressed: ()=>{print("option 1")},),
            ButtonWhite(text: answers[1],onPressed:()=>{print("option 2")}),
            ButtonWhite(text: answers[2],onPressed:()=>{print("option 3")}),
            ButtonWhite(text: answers[3],onPressed:()=>{print("option 4")}),
            
          ],
        ),
        
      ],
      )
    );

  }

}