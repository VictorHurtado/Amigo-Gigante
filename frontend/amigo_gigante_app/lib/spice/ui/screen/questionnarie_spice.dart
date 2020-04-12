
import 'package:amigo_gigante_app/spice/ui/widget/generic_questionnaire_four.dart';
import 'package:amigo_gigante_app/widget/banner_fundation.dart';
import 'package:amigo_gigante_app/widget/gradient_back.dart';
import 'package:flutter/material.dart';


class QuestionnarieSpice extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GradientBack(),
          Column(
            children: <Widget>[
              
              GenericQuestionnaireFour(title: "el pan", description: "te gusta el panhabilitar = falso; no despacha el evento onTap (). Lo quiero deshabilitado y no enfocable, pero no lo quiero muerto. Quiero tener control sobre eso. Aún debe dispararse en Tap () si está configurado. Ni siquiera si lo envuelve en un GestureDetector. Hombre, este aleteo puede ser decepcionante algunas veces ",answers: ["opcion 1", "opcion2","opcion 3","opcion 4"]),
              BannerFundation()
            ],
          )
         
          
        ],
      )
      
      
       
    );
  }


}