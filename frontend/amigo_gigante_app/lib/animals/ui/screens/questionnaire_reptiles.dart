import 'package:amigo_gigante_app/animals/bloc/animals_bloc.dart';
import 'package:amigo_gigante_app/widget/banner_fundation.dart';
import 'package:amigo_gigante_app/widget/blue_circular_button.dart';
import 'package:amigo_gigante_app/widget/generic_questionnaire_four.dart';
import 'package:amigo_gigante_app/widget/generic_questionnaire_two.dart';
import 'package:amigo_gigante_app/widget/gradient_back.dart';
import 'package:flutter/material.dart';
import 'package:amigo_gigante_app/species/model/question.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class QuestionnaireReptile extends StatefulWidget{
  final List<Question> questions;
  
    const QuestionnaireReptile({Key key, this.questions});
    @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return _QuestionnaireReptile(questions);
    }
  
  }
  

class _QuestionnaireReptile extends State<QuestionnaireReptile>{
  final List<Question> questions;
  AnimalBloc animalBloc;
  int index=0;
  _QuestionnaireReptile(this.questions);

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
    double  width=MediaQuery.of(context).size.width;
    animalBloc=BlocProvider.of(context);
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
                 type: "reptiles",
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
               type: "reptiles",
               onPressed: (){
     
                  next();
                },
               onPressedBack: (){
                  back();
                },
              )

              :index==questions.length && questions != null?
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
                          // Navigator.push(context,MaterialPageRoute(builder: (BuildContext context )=>ResultsSpecies(title:"Resultados")));
                           Navigator.popAndPushNamed(context, '/resultsReptiles');
                          
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