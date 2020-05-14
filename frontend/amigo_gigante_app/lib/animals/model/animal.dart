class Animal {
  static int cant=0;
  int id;
  Animal(){
    this.id=cant;
    cant++;
  }
  int getValor(){
    return id;
  }
  String getName(){
    return '';
  }
  String getNmatch(){
    return '';
  }
  String getImg(){
    return '';
  }
}
