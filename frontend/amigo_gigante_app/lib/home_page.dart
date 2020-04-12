import 'package:amigo_gigante_app/spice/ui/screen/questionnarie_spice.dart';

import 'package:amigo_gigante_app/widget/banner_fundation.dart';
import 'package:amigo_gigante_app/widget/blue_button.dart';
import 'package:amigo_gigante_app/widget/gradient_back.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
                  BlueButtonInk(text: "Cuestionario Especie", onPressed: ()=>{
                    showDialog(context: context,
                      builder: (BuildContext context)=>CupertinoAlertDialog(
                          
                          title: Text("Bienvenido"),
                          content: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                          actions: <Widget>[
                            CupertinoDialogAction(
                
                             child: Text("Entendido"),
                             isDefaultAction: true,
                             onPressed: (){
                               
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (BuildContext context )=>QuestionnarieSpice()));
                             },
                             )
                          ],
                      )
                    ),
                    
                  }),
                  BlueButtonInk(text: "Cuestionario Animal", onPressed: ()=>{}),
                  BlueButtonInk(text: "Consulta Informacion", onPressed: ()=>{}),
                  BannerFundation(),

              ],
            ),
          ),
        ],
      ),


    );
  }
}