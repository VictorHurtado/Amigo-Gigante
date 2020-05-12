

import 'package:amigo_gigante_app/animals/model/dog.dart';


import 'package:flutter/material.dart';
class DogCard extends StatefulWidget{
  final Dog dog;

  DogCard( {Key key, this.dog}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DogCard(dog: dog);
  }

}

class _DogCard extends State<DogCard>{
  final Dog dog;
 

  _DogCard({Key key, this.dog});
 
  @override
  Widget build(BuildContext context) {
     

    final star_border = Container (
     
      child: Icon(
        Icons.star_border,
        color:  Color(0xFFf2C611),
        size: 14,
      ),
    );

    final star = Container (
   
      child: Icon(
        Icons.star,
        color:  Color(0xFFf2C611),
        size: 14,
      ),
    );

 
    final cardImage=Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.black,
            offset: Offset(0,1),
          )
          
        ],
        image: DecorationImage(image: NetworkImage(dog.img),fit: BoxFit.cover),

      ),
    );
   
    final descriptionContainer=Container(
      
      width: 180,
      height: 250,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.black,
            offset: Offset(0,1),
          )
        ]
      ),

      child:Column(
        
        children: <Widget>[
           Container(
             width: 350,
             padding:EdgeInsets.only(left:20,top: 20) ,
             margin: EdgeInsets.only(bottom:10),
            
             child:Text(dog.name,style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w600,fontSize: 24,),textAlign: TextAlign.start,)
          ),
           Container(
            padding:EdgeInsets.only(left: 20,right: 20),
             width:350,
             child:Text("Pelaje:  ${dog.fur}",style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w100,fontSize: 12,color: Colors.black54),textAlign: TextAlign.start,),),
           Container(
             padding:EdgeInsets.only(left: 20,right: 20),
             width:350,
             child:Text("Docilidad: ${dog.docility}",style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w100,fontSize: 12,color: Colors.black54),textAlign: TextAlign.start,),),
           
           Container(
             padding:EdgeInsets.only(left: 20,right: 20),
             width:350,
             child:Text("energia: ${dog.energy==true?"energico":"tranquilo"}",style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w100,fontSize: 12,color: Colors.black54),textAlign: TextAlign.start,),),
           Container(
             padding:EdgeInsets.only(left: 20,right: 20),
             width:350,
             child:Text("raza: ${dog.raza}",style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w100,fontSize: 12,color: Colors.black54),textAlign: TextAlign.start,),),
          Container(
             padding:EdgeInsets.only(left: 20,right: 20),
             width:350,
             child:Text("Numero de Matchs: ",style: TextStyle(fontFamily: "Lato",fontWeight: FontWeight.w600,fontSize: 12,color: Colors.black54),textAlign: TextAlign.start,),),
         
          Expanded(
            
            child:SizedBox(
              
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left:20),
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (BuildContext context,index){
                  if(index<dog.nMatch){
                    return star;
                  }else{
                    return star_border;
                  }

                }
              ),
            )
          )
        ],
      )
    );
    

    // TODO: implement build
    return 
       Stack(
         alignment: Alignment(0.8, 0),
       
        children: <Widget>[
          
            cardImage,
            Positioned(
              left: 14,
              bottom: 20,
              child: descriptionContainer,
              ) 
            
           
             
        ],
      );
  }
}
