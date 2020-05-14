import 'dart:convert';

import 'package:amigo_gigante_app/species/bloc/species_bloc.dart';
import 'package:amigo_gigante_app/species/ui/widget/circular_chart.dart';
import 'package:amigo_gigante_app/widget/gradient_back.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ResultsSpecies extends StatelessWidget{
  final String title;
  String textDogs='''De acuerdo con el sistema, eres muy compatible con los caninos.
  Nos alegramos mucho de que puedas ser parte de este proyecto y que la especie que mejor
  se lleve contigo sean los perros. Esperamos puedas encontrar uno de estos amiguitos y lo lleves contigo a casa.
  
  Eres una persona que aprecia más un amigo amoroso, el cual que pueda ser fiel siempre a ti y a tu familia. 
  Al ser una mascota tan dependiente, deberás disponer de espacio y tiempo para pasar con tu amigo,
  ya que eso es totalmente indispensable para tener un acompañante como lo es un canino. Ya que siempre debes
  sacarlo a pasear, jugar con él, entre otras cosas.

  ¡Gracias por usar nuestra aplicación y ser parte de las personas que somos amigos de los animales!''';
  
  String textCats='''Gato: De acuerdo con el sistema, eres muy compatible con los felinos puesto que eres
  adecuado para recibir de la compañía de estos amigos, junto con todo el afecto que brindan. Nos alegramos
  mucho que tengas el espacio para adoptar uno de estos amiguitos, y puedas recibir la compañía de ellos.

  Si eres una persona muy ocupada, no te preocupes puesto que estos amiguitos son totalmente autónomos y 
  muy aseados, aunque recuerda que al principio deberás jugar mucho con ellos. Aún así, trata de pasar el 
  mayor tiempo que puedas con estos felinos.

 ¡Gracias por usar nuestra aplicación y ser parte de las personas que somos amigos de los animales!
  ''';
  String textBirds='''
  De acuerdo con el sistema, eres muy compatible con las aves. Aprecias de un amigo bastante inteligente y
   que sea super independiente, sino tienes espacio para tener una mascota no te preocupes. Puesto que las
    aves son totalmente independientes, aunque obviamente deberás alimentarlas varias veces al día.

  Además, la mayoría de aves tienen el tamaño adecuado para ti. Y si tienes planes a corto plazo, no te preocupes,
  siempre podrás dejarlos libres. 

  ¡Gracias por usar nuestra aplicación y ser parte de las personas que somos amigos de los animales!
  ''';
  String textReptiles='''
  De acuerdo con el sistema, eres muy compatible con los reptiles. Busca en tu compañero una belleza y excentricidad
  mayor que en otros animales. Si no ocupas de mucho espacio no te preocupes,  puesto que estos animales con tener
  un hábitat propia bastará.

  El tamaño de estos animales son adecuados para ti, puesto que no son muy grandes a excepción de la iguana. A Pesar
  de que son unos animales a los cuales no deberás dedicarle gran cantidad de horas, sí debes darle el alimento tu mismo.

  ¡Gracias por usar nuestra aplicación y ser parte de las personas que somos amigos de los 
  ''';

  ResultsSpecies({Key key, this.title});

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    SpeciesBloc speciesBloc = BlocProvider.of(context);
    List<num> porcents;
    double mayor=0;
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
           GradientBack(),
           FutureBuilder(
            future: speciesBloc.recomendSpecies(),
            builder: (context,AsyncSnapshot<String> snapshot){
              if(snapshot.hasError){
                return Center(child: Text('Ocurrio Algo inesperado porfavor, intentelo de nuevo'));
              }
              if(!snapshot.hasData){
                return Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Image(image: AssetImage("assets/images/LOGO2.png")),
                            ),
                            
                            SizedBox(
                                height: 200,
                                width: 200,
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
                      child: Text("Estamos Analizando Tus Respuestas, Esto podria tardar unos minutos",style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                    )
                  ],
                ));
              }
              porcents=speciesBloc.toDouble(snapshot.data);
              for (var item in porcents) {item>mayor?mayor=(item.toDouble()):mayor=mayor;}
              return Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 15,left: 15,right: 15,top:5),
                          
                         
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                              color: Colors.black26,
                              blurRadius: 30.0,
                              offset: Offset(0.0, 0.0)
                              ),
                            ]

                          ),
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            
                            child: IconButton(
                              alignment: Alignment.center,
                              icon: Icon(Icons.keyboard_arrow_left,size: 50,color:Colors.white,), 
                              onPressed: (){
                                Navigator.pop(context);
                              }
                              ),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: 300,
                          
                          alignment: Alignment.bottomRight,
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w800,color:Colors.white,fontSize: 50),
                          ),
                        ),
                      ],
                  ),
                  Container(
                    width: width,
                    height: height-200,
                    padding: EdgeInsets.only(top:50),
                    decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(150)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                        color: Colors.black26,
                        blurRadius: 30.0,
                        offset: Offset(0.0, 0.0)
                        ),
                      ]
                    ),
                    child: ListView(
                      
                      children: <Widget>[
                        Container(
                          height: 200,
                          padding: EdgeInsets.only(
                            left: 50,
                            right: 30,
                            top: 10

                          ),
                          child: Text(
                          "Luego de analizar las distintas respuestas que nos proporcionaste, podemos decir que eres compatible con...",
                          style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w100,color:Colors.black,fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 300,
                          padding: EdgeInsets.only(
                            left: 50,
                            right: 60,
                          

                          ),
             
                          child: DonnutChart(porcents: porcents,),
                        ),
                        
                        Container(
                          width: 300,
                           padding: EdgeInsets.only(
                              left: 50,
                              right: 30,
                              top: 80,
                              bottom: 50


                          ),
                          child: Text(
                            porcents.indexOf(mayor)==0?textDogs:porcents.indexOf(mayor)==1?textCats:porcents.indexOf(mayor)==2?textBirds:porcents.indexOf(mayor)==1?textReptiles:'',
                            style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w100,color:Colors.black,fontSize: 18),
                            textAlign: TextAlign.justify,
                          ),
                        )

                        
                      ], 
                    )
                  )
                ],
              );
            }
           
           
           )
        ],
      ),
    );
  }

  




}