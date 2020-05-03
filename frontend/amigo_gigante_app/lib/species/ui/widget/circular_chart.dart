import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:amigo_gigante_app/species/model/species.dart';
 

class DonnutChart extends StatefulWidget{
  final List<num> porcents;

  const DonnutChart({Key key, this.porcents});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DonnutChart();
  }


}
class _DonnutChart extends State<DonnutChart>{
  List<charts.Series<Species,String>> _seriesPieData;

  _generateData(List<num> array){
    var pieData=[
      new Species('Perros', array[0],Color.fromRGBO(45, 235, 237, 1)),
      new Species('Gatos', array[1],Color.fromRGBO(100, 235, 247, 0.5)),
      new Species('Aves', array[2],Color.fromRGBO(145, 255, 237, 1)),
      new Species('Reptiles', array[3],Color.fromRGBO(255, 235, 237, 1)),

    ];
    _seriesPieData.add(
      charts.Series(
        data:pieData,
        domainFn: (Species specie,_)=> specie.name,
        measureFn: (Species specie,_)=> specie.porcent,
        colorFn: (Species species,_)=> charts.ColorUtil.fromDartColor(species.colorValue),
        id: 'Especies Recomendadas',
        labelAccessorFn: (Species row,_)=>'${row.porcent}%', 

        
        ),
    );

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData=List<charts.Series<Species,String>>();
    _generateData(widget.porcents);

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  charts.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 2),
                             behaviors: [
                            new charts.DatumLegend(
                              outsideJustification: charts.OutsideJustification.endDrawArea,
                              horizontalFirst: false,
                              desiredMaxRows: 1,
                              cellPadding: new EdgeInsets.only(right: 7.0, bottom: 4.0),
                              entryTextStyle: charts.TextStyleSpec(
                                  color: charts.MaterialPalette.purple.shadeDefault,
                                  fontFamily: 'Lato',
                                  fontSize: 11),
                            )
                          ],
                           defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 60,
                              
                             arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.inside)
        ]));
  }


}




