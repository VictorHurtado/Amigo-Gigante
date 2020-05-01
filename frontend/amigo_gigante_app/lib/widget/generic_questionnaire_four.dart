



import 'package:amigo_gigante_app/species/bloc/species_bloc.dart';
import 'package:amigo_gigante_app/widget/blue_circular_button.dart';
import 'package:amigo_gigante_app/widget/button_white.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class GenericQuestionnaireFour extends StatelessWidget{
  final String title;
  final String description;
  final List<String> answers;
  final List<int> weight;
  final VoidCallback onPressed;
  final VoidCallback onPressedBack;
  SpeciesBloc speciesBloc;
  

   GenericQuestionnaireFour({Key key,@required this.title,@required this.description,@required this.answers,this.onPressed,@required this.weight,this.onPressedBack});
  
  @override
  Widget build(BuildContext context) {
    speciesBloc=BlocProvider.of(context);
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
      height: 150,
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
      height: height-150,
      child: Column(
      children: <Widget>[
     
        questionTitle,
        questionDescription,
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
          children: <Widget>[
            
            ButtonWhite(text: answers[0],onPressed: (){
              onPressed();
              speciesBloc.saveQuestion(title,answers[0],weight[0]);
              
            },width:350),
            ButtonWhite(text: answers[1],onPressed: (){
              onPressed();
              speciesBloc.saveQuestion(title,answers[1],weight[1]);
              
            },width:350),
            ButtonWhite(text: answers[2],onPressed: (){
              onPressed();
              speciesBloc.saveQuestion(title,answers[2],weight[2]);
              
            },width:350),
            ButtonWhite(text: answers[3],onPressed: (){
              onPressed();
              speciesBloc.saveQuestion(title,answers[3],weight[3]);
 
            },width:350),
             BlueCircularButton(text: "atras", onPressed: (){
               onPressedBack();
             },width: 350,)
          ],
        ),
    
       ],
      )
    );

  }


}