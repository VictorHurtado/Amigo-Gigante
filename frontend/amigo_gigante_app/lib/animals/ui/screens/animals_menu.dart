import 'package:amigo_gigante_app/widget/banner_fundation.dart';
import 'package:amigo_gigante_app/widget/blue_button.dart';
import 'package:amigo_gigante_app/widget/gradient_back.dart';
import 'package:flutter/material.dart';


class AnimalsMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
                child: Text("¿ya conoces con que tipo de amigo eres compatible? porfavor seleccionalo!",style: TextStyle(color: Colors.black,fontFamily: "Lato",fontWeight: FontWeight.w500,fontSize: 17),textAlign: TextAlign.center,),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                    
                      children: <Widget>[
                          BlueButtonInk(text: "Perros", width: 150,onPressed: ()=>{}),
                           BlueButtonInk(text: "Gatos", width: 150, onPressed: ()=>{}),
                      ],
                    ),
                    Column(
                   
                      children: <Widget>[
                         BlueButtonInk(text: "Aves", width: 150, onPressed: ()=>{}),
                          BlueButtonInk(text: "Reptiles", width: 150, onPressed: ()=>{})
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