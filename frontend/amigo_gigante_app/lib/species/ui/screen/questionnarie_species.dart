


import 'package:amigo_gigante_app/species/bloc/species_bloc.dart';
import 'package:amigo_gigante_app/species/model/question.dart';
import 'package:amigo_gigante_app/widget/banner_fundation.dart';
import 'package:amigo_gigante_app/widget/blue_circular_button.dart';
import 'package:amigo_gigante_app/widget/generic_questionnaire_four.dart';
import 'package:amigo_gigante_app/widget/generic_questionnaire_two.dart';
import 'package:amigo_gigante_app/widget/gradient_back.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';



class QuestionnarieSpecies extends StatefulWidget{
  List<Question> questions;
  QuestionnarieSpecies(this.questions);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuestionnarieSpice(questions);
  }
}
class _QuestionnarieSpice extends State<QuestionnarieSpecies>{
   List<Question> questions;
   int index=0;
   
  _QuestionnarieSpice(this.questions);
  void next(){
    setState(() {
      if(questions.length>1 && index<questions.length){   
        index++;
        print(index);
      }
    });
  }

  void back(){
    setState(() {
      if(questions.length>1 && index>0){
        index--;     
      }  
    });
  }

  @override
  Widget build(BuildContext context) {
    SpeciesBloc spiceBloc=BlocProvider.of(context);
    double  width=MediaQuery.of(context).size.width;
    
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(),
          Column(
            children: <Widget>[
              index<questions.length? 
              questions[index].answers.length>3?GenericQuestionnaireFour(
                title: questions[index].title,
                 description: questions[index].description,
                 answers: questions[index].answers,
                 weight: questions[index].weight,
                 onPressed: (){
              
                  next();
                },
                onPressedBack: (){
                  back();
                },
              ):GenericQuestionnaireTwo(title: questions[index].title,
               description: questions[index].description,
               answers: questions[index].answers,
               weight: questions[index].weight,
               onPressed: (){
     
                  next();
                },
               onPressedBack: (){
                  back();
                },
              )

              :index==questions.length?
                Container(
                width: width-40,
                margin: EdgeInsets.only(top: 240, bottom: 150),
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 17.0,
                            offset: Offset(0, -0.5)
                          )
                        ],
                      ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                    
                      padding: EdgeInsets.all(30),
                      
                      child: Text("Terminaste el cuestionario si estas seguro de pulsa terminar",style:TextStyle(fontFamily: "Lato",fontSize: 23,),textAlign:TextAlign.center),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BlueCircularButton(text: "atras", onPressed: (){
                        back();
                        
                        },width: 130,),
                        BlueCircularButton(text: "Terminar", onPressed: (){
                        spiceBloc.recomendSpecies();
                        
                        },width: 130,),
                      ],
                    ),
                  ],
                )
              ):
              Container(
               
              ),
              
              BannerFundation()
            ],
          )
         
          
        ],
      )
      
      
       
    );
  }


} 