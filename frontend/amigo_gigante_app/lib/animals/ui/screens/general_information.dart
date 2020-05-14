import 'package:amigo_gigante_app/animals/bloc/animals_bloc.dart';
import 'package:amigo_gigante_app/animals/model/animal.dart';
import 'package:amigo_gigante_app/animals/ui/widgets/animal_card.dart';
import 'package:amigo_gigante_app/widget/gradient_back.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class GeneralInformation extends StatelessWidget{
  AnimalBloc animalBloc;


  String text=''' ¡Hola! Gracias por usar nuestra aplicación, Amigo Gigante. 
  
  Somos dos estudiantes que tomaron la decisión de encontrar una forma de fomentar la adopción de animales y ayudar a las personas qué animal o especie deberían adoptar según su personalidad, situación, planes a futuro, entre otras cosas. Esto se debe  a que muchas personas quieren adoptar un amiguito, pero no saben qué animal, o qué tipo especie de animal.
  
  Bueno, en esta aplicación encontrarás el cuestionario indicado  para ti, el cual trabajara con tus respuestas para brindarte la mejor decisión posible.  La forma de usarlo es muy sencilla; debes seleccionar el cuestionario según tu necesidad, es decir, si no sabes que especie adoptar (reptiles, aves, perros y gatos), selecciona cuestionario por especie.
  
  Si no sabes qué animal deseas adoptar ya sea por raza, tamaño, color, etc. Deberás seleccionar cuestionario por animal. Deberás seleccionar las respuestas que mejor se acoplen a tus necesidades, gustos, entre otras cosas.  Así el sistema podrá brindarte una mejor respuesta.
  
  ¡Gracias nuevamente por usar nuestra aplicación y ser parte de las personas que somos amigos de los animales!''';
  @override
  Widget build(BuildContext context) {
    animalBloc=BlocProvider.of(context);
    // TODO: implement build
   
   return Scaffold(
     body: Stack(
      children: <Widget>[
        GradientBack(),
        Scrollbar(

          child: ListView(
            padding: EdgeInsets.only(top:50),
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                    child: Text("¿Amigo Gigante?",style: TextStyle(fontSize: 30,fontFamily: "Lato",fontWeight: FontWeight.w700,color: Colors.white),textAlign: TextAlign.justify,),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 50),
                    child: Text(text,style: TextStyle(fontSize: 17,fontFamily: "Lato",fontWeight: FontWeight.w100),textAlign: TextAlign.justify,),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                    child: Text("Animales",style: TextStyle(fontSize: 30,fontFamily: "Lato",fontWeight: FontWeight.w700,color: Colors.white),textAlign: TextAlign.justify,),
              ),
              Container(
                
                padding: EdgeInsets.only(top:80,right: 20,left: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(0,1),
                    )
                  ],
                ),
                child: FutureBuilder(
                future: animalBloc.extractAnimals(),
                builder: (context,AsyncSnapshot<List<Animal>> snapshot){
                       if(snapshot.hasError){
                          return Center(child: Text('Ocurrio algo inesperado, por favor intentelo de nuevo'));
                        }
                        if(!snapshot.hasData){
                          return Center(child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                      SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: Image(image: AssetImage("assets/images/LOGO2.png")),
                                      ),
                                      
                                      SizedBox(
                                        
                                          height: 100,
                                          width: 100,
                                          child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
                                          backgroundColor: Colors.white24,
                                          strokeWidth: 20,
                                          
                                        ),
                                      )
                                  ],
                                ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 30,
                                  horizontal: 30
                                ),
                                child: Text("Cargando los animales ",style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                              )
                            ],
                          ));
                        }
               
                      
                      return  ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index){
                              return 
                                
                                
                                 AnimalCard(animal: snapshot.data[index],);
                            },
                            itemCount: snapshot.data.length,
                              
                            );
                 
                }
                ),
              ),
                
            ],
          )
        )
      ], 
     ),

   );
  }

  
}