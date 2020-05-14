import 'package:amigo_gigante_app/animals/bloc/animals_bloc.dart';
import 'package:amigo_gigante_app/animals/model/animal.dart';
import 'package:amigo_gigante_app/animals/ui/widgets/view_result_birds.dart';
import 'package:amigo_gigante_app/animals/ui/widgets/view_result_cats.dart';

import 'package:amigo_gigante_app/animals/ui/widgets/view_result_dogs.dart';
import 'package:amigo_gigante_app/animals/ui/widgets/view_result_reptiles.dart';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class ResultsAnimals extends StatelessWidget{
  final String title;
  final String type;
  List<Animal> animals;
  AnimalBloc animalBloc;
  ResultsAnimals({Key key, this.title, this.type});
  
  @override
  Widget build(BuildContext context) {
    animalBloc=BlocProvider.of(context);
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
         
          FutureBuilder(
            future: type=="dogs"? animalBloc.recomendDog():type=="cats"?animalBloc.recomendCat():type=="birds"?animalBloc.recomendBird():type=="reptiles"?animalBloc.recomendReptile():'',
            builder:(context,AsyncSnapshot<String> snapshot){
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
                      child: Text("Estamos analizando tus respuestas, esto podria tardar unos minutos",style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
                    )
                  ],
                ));
              }
              print(type);
              animals= type=="dogs"? animalBloc.convertToDogs(snapshot.data):type=="cats"?animalBloc.convertToCats(snapshot.data):type=="birds"?animalBloc.convertToBird(snapshot.data):type=="reptiles"?animalBloc.convertToReptile(snapshot.data):'';
              print(animals);
              if(type=="dogs"){
                   return ViewResultsDogs(animals: animals,);
              }else if(type=="cats"){
                 return ViewResultsCats(animals:animals);
              }else if(type=="birds"){
                return ViewResultsBirds(animals: animals);
              }else if(type=="reptiles"){
                return ViewResultsReptiles(animals: animals);
              }
             
            }, 
          ),
        ],
      ),

    );
  }


}