
import 'package:amigo_gigante_app/animals/ui/screens/animals_menu.dart';
import 'package:amigo_gigante_app/animals/ui/screens/general_information.dart';

import 'package:amigo_gigante_app/species/bloc/species_bloc.dart';
import 'package:amigo_gigante_app/species/model/question.dart';
import 'package:amigo_gigante_app/species/ui/screen/questionnaire_species.dart';

import 'package:amigo_gigante_app/widget/banner_fundation.dart';
import 'package:amigo_gigante_app/widget/blue_button.dart';
import 'package:amigo_gigante_app/widget/gradient_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class HomePageApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageApp();
  }


}
class _HomePageApp extends State<HomePageApp>{
  SpeciesBloc speciesBloc;
  List<Question> questions= List<Question>();

  void onPressedState(){
    setState(() {
      speciesBloc.createdQuestions().then((value){
        print(value);      
        questions.addAll(value);
      });
                    
    });
  }

  @override
  Widget build(BuildContext context) {
    speciesBloc=BlocProvider.of(context);
    
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(),

          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top:100,
                      bottom: 50,
                    ),
                    height: 250,
                    width: 250,
                    child: Image(
                      image: AssetImage("assets/images/LOGO2.png"),
                    ),
                  ),
                  BlueButtonInk(text: "Cuestionario Especie",width: 250, onPressed: ()=>{
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
                                onPressedState();
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context )=>QuestionnaireSpecies(questions)));
                             },
                             )
                          ],
                      )
                    ),
                    
                  }),
                  BlueButtonInk(text: "Cuestionario Animal",width: 250, onPressed: ()=>{
                    
                      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>AnimalsMenu()) ),
                  
                  }),
                  BlueButtonInk(text: "Consulta de Informacion", onPressed: ()=>{
                    
                      Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=>GeneralInformation()) ),
                  
                  },width: 250,),
                  BannerFundation(),

              ],
            ),
          ),
        ],
      ),


    );
  }

}



