import 'package:amigo_gigante_app/animals/model/animal.dart';
import 'package:amigo_gigante_app/animals/ui/widgets/cat_card.dart';
import 'package:amigo_gigante_app/animals/ui/widgets/dog_card.dart';
import 'package:flutter/material.dart';

class ViewResultsCats extends StatelessWidget{
  final List<Animal> animals;

  const ViewResultsCats({Key key, this.animals}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar( 
                    pinned: true,

                    expandedHeight: 130,
                    title:Text("RESULTADOS",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w900),),
                    centerTitle: true,
                    backgroundColor: Color.fromRGBO(45, 235, 237, 0.9),
                    floating: true,
                    bottom: PreferredSize(                       // Add this code
                      preferredSize: Size.fromHeight(100.0),      // Add this code
                      child: Text(''),                           // Add this code
                    ), 
                    flexibleSpace: Container(
                      width: 350,
                      height: 150,
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              
                              Container( 
                                padding: EdgeInsets.only(bottom:10,left:20),
                                child:Icon(Icons.stars,size: 20,color: Colors.yellowAccent,),
                             ),
                              Container( 
                                padding: EdgeInsets.only(bottom:10, left:50),
                                child:Text("Animal top",style: TextStyle(fontSize: 17,color: Colors.white),)
                             ),
                             
                             Container( 
                               margin: EdgeInsets.only(bottom:10,left:10),
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                ),
                                padding: EdgeInsets.all(10),
                                child:Text("${animals[0].getName()}",style: TextStyle(fontSize: 17,color: Colors.white),)
                             ),
                             
                            ],
                          )

                        ],
                      ),
                     
                    ),
                      
                      
                  ),
                  SliverList(delegate: SliverChildBuilderDelegate(
                  
                    (BuildContext context, int index){
                    
                      return Container(margin: EdgeInsets.only(top:30,bottom:30),child:CatCard(cat: animals[index]));
                    },
                    childCount: animals.length,             
                  )),
                ],
              );;
  }







}