import 'package:amigo_gigante_app/animals/bloc/animals_bloc.dart';
import 'package:amigo_gigante_app/animals/ui/screens/questionnaire_birds.dart';
import 'package:amigo_gigante_app/animals/ui/screens/questionnaire_cats.dart';
import 'package:amigo_gigante_app/animals/ui/screens/questionnaire_dogs.dart';
import 'package:amigo_gigante_app/animals/ui/screens/questionnaire_reptiles.dart';
import 'package:amigo_gigante_app/species/model/question.dart';
import 'package:amigo_gigante_app/widget/banner_fundation.dart';
import 'package:amigo_gigante_app/widget/blue_button.dart';
import 'package:amigo_gigante_app/widget/gradient_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AnimalsMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimalsMenu();
  }

}
class _AnimalsMenu extends State<AnimalsMenu>{
  List<Question> questions=List<Question>();
  AnimalBloc animalBloc;
 
  @override
  Widget build(BuildContext context) {
    animalBloc=BlocProvider.of(context);
    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text("Bienvenido",style: TextStyle(color: Colors.black,fontFamily: "Lato",fontWeight: FontWeight.w500,fontSize: 50),),
              ),
              Container(
                width: 300,
                height: 300,
                child: Image(image: AssetImage('assets/images/Logo1.png')),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
                child: Text("¿Conoces con que tipo de amigo eres compatible? Por favor seleccionalo!",style: TextStyle(color: Colors.black,fontFamily: "Lato",fontWeight: FontWeight.w500,fontSize: 17),textAlign: TextAlign.center,),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(                    
                      children: <Widget>[
                          BlueButtonInk(text: "Perros", width: 150,onPressed: (){
                            showDialog(context: context,
                              builder: (BuildContext context)=>CupertinoAlertDialog(
                            
                                title: Text("Bienvenido"),
                                content: Text("¡Hola! Antes de iniciar el cuestionario, te queremos recordar que debes responder a las preguntas de la forma más honesta posible, para así, aconsejarte de la mejor manera... \n Gracias"),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                      
                                  child: Text("Entendido"),
                                  isDefaultAction: true,
                                  onPressed: (){
                                      questions=[];
                                      setState(() {
                                        animalBloc.createdQuestionsDogs().then((value){
                                          print(value);
                                          questions.addAll(value);
                                        });
                                      });
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>QuestionnaireDog(questions: questions,)));
                                  },
                                  )
                                ],
                              )
                            );
                            
                          }),
                          BlueButtonInk(text: "Gatos", width: 150, onPressed: (){
                            showDialog(context: context,
                              builder: (BuildContext context)=>CupertinoAlertDialog(
                            
                                title: Text("Bienvenido"),
                                content: Text("¡Hola! Antes de iniciar el cuestionario, te queremos recordar que debes responder a las preguntas de la forma más honesta posible, para así, aconsejarte de la mejor manera... \n Gracias"),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                      
                                  child: Text("Entendido"),
                                  isDefaultAction: true,
                                  onPressed: (){
                                      questions=[];
                                     setState(() {
                                        animalBloc.createdQuestionsCats().then((value){
                                          print(value);
                                          questions.addAll(value);
                                        });
                                      });
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>QuestionnaireCat(questions: questions,)));
                                  },
                                  )
                                ],
                              )
                            );
                            
                          }),
                      ],
                    ),
                    Column(                   
                      children: <Widget>[
                        BlueButtonInk(text: "Aves", width: 150, onPressed: (){
                            showDialog(context: context,
                              builder: (BuildContext context)=>CupertinoAlertDialog(
                            
                                title: Text("Bienvenido"),
                                content: Text("¡Hola! Antes de iniciar el cuestionario, te queremos recordar que debes responder a las preguntas de la forma más honesta posible, para así, aconsejarte de la mejor manera... \n Gracias"),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                      
                                  child: Text("Entendido"),
                                  isDefaultAction: true,
                                  onPressed: (){
                                      questions=[];
                                     setState(() {
                                        animalBloc.createdQuestionsBirds().then((value){
                                          print(value);
                                          questions.addAll(value);
                                        });
                                      });
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>QuestionnaireBird(questions: questions,)));
                                  },
                                  )
                                ],
                              )
                            );
                            
                          }),
                        BlueButtonInk(text: "Reptiles", width: 150, onPressed: (){
                            showDialog(context: context,
                              builder: (BuildContext context)=>CupertinoAlertDialog(
                            
                                title: Text("Bienvenido"),
                                content: Text("¡Hola! Antes de iniciar el cuestionario, te queremos recordar que debes responder a las preguntas de la forma más honesta posible, para así, aconsejarte de la mejor manera... \n Gracias"),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                      
                                  child: Text("Entendido"),
                                  isDefaultAction: true,
                                  onPressed: (){
                                      questions=[];
                                     setState(() {
                                        animalBloc.createdQuestionsReptiles().then((value){
                                          print(value);
                                          questions.addAll(value);
                                        });
                                      });
                                      Navigator.pop(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>QuestionnaireReptile(questions: questions,)));
                                  },
                                  )
                                ],
                              )
                            );
                            
                          })
                      ],
                    )
                  ],
                ),
              ),
              BannerFundation()
            ],
          ),
          
        ],
      ),
    );
  }
}