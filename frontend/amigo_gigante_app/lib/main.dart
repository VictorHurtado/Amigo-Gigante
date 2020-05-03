
import 'package:amigo_gigante_app/animals/ui/screens/animals_menu.dart';
import 'package:amigo_gigante_app/species/bloc/species_bloc.dart';
import 'package:amigo_gigante_app/species/ui/screen/questionnarie_species.dart';
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
      child:  MaterialApp(
      title: 'Amigo Gigante',
      home: HomePageApp(),
      routes: <String, WidgetBuilder> {
        '/questionnaireSpecies': (BuildContext context) => QuestionnarieSpecies([]),
        '/resultsSpecies' : (BuildContext context) => ResultsSpecies(title:"Resultados"),
        '/animalMenu': (BuildContext context) => AnimalsMenu(),
        
      },
      ),
      bloc: SpeciesBloc(),
    );
  }
}


