function agregarPropiedad(obj,valor){
    
    return Object.defineProperty(obj,'nMatch',{enumerable: true,
        configurable: true,
        writable: true,
        value: valor});
}

function compare( animal , prototype){
    nMatch=0;
    for (const key in animal) {
        
      if(prototype.hasOwnProperty(key) && animal[key].toString() == prototype[key].toString()){
        nMatch++;
      }
    }
    return nMatch;
}
module.exports={
    compare: compare,
    addProperty:agregarPropiedad,
};