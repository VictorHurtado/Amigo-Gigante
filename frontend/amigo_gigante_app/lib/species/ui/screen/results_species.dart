import 'dart:convert';

import 'package:amigo_gigante_app/species/bloc/species_bloc.dart';
import 'package:amigo_gigante_app/species/ui/widget/circular_chart.dart';
import 'package:amigo_gigante_app/widget/gradient_back.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ResultsSpecies extends StatelessWidget{
  final String title;

  const ResultsSpecies({Key key, this.title});

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    double height= MediaQuery.of(context).size.height;
    SpeciesBloc speciesBloc = BlocProvider.of(context);
    List<num> porcents;
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
                    margin: EdgeInsets.only(),
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
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          padding: EdgeInsets.only(
                            left: 80,
                            right: 20,
                            top: 80

                          ),
                          child: Text(
                          "Luego de analizar las distintas respuestas que nos proporcionaste, podemos decir que eres compatible con...",
                          style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w100,color:Colors.black,fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 300,
                          child: DonnutChart(porcents: porcents,),
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