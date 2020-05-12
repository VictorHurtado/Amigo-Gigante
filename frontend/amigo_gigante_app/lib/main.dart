
import 'package:amigo_gigante_app/animals/bloc/animals_bloc.dart';
import 'package:amigo_gigante_app/animals/ui/screens/animals_menu.dart';
import 'package:amigo_gigante_app/animals/ui/screens/questionnaire_dogs.dart';
import 'package:amigo_gigante_app/animals/ui/screens/results_animals.dart';
import 'package:amigo_gigante_app/species/bloc/species_bloc.dart';
import 'package:amigo_gigante_app/species/ui/screen/questionnaire_species.dart';
import 'package:amigo_gigante_app/species/ui/screen/results_species.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'home_page_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child:  BlocProvider(child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amigo Gigante',
      home: HomePageApp(),
      routes: <String, WidgetBuilder> {
        '/questionnaireSpecies': (BuildContext context) => QuestionnaireSpecies([]),
        '/resultsSpecies' : (BuildContext context) => ResultsSpecies(title:"Resultados"),
        '/animalMenu': (BuildContext context) => AnimalsMenu(),
        '/questionnaire_dogs':(BuildContext context)=> QuestionnaireDog(),
        '/resultsDogs' :(BuildContext context)=> ResultsAnimals(title: "Perros",type: "dogs",),
        '/resultsCats' :(BuildContext context)=> ResultsAnimals(title: "Gatos",type: "cats",),
        '/resultsBirds' :(BuildContext context)=> ResultsAnimals(title: "Aves",type: "birds",),
        '/resultsReptiles' :(BuildContext context)=> ResultsAnimals(title: "Reptiles",type: "reptiles",),
      },
      ), bloc: AnimalBloc()),
      bloc: SpeciesBloc(),
    );
  }
}


