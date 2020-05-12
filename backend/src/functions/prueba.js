var myDogs = [
    {
        "_id": "5eaf03d12e94f63ae490a30f",
        "name": "paris",
        "size": "grande",
        "fur": "abundante",
        "docility": "agresivo",
        "maintenance": 1500000,
        "timeRequired": true,
        "energy": true,
        "age": "cachorro",
        "raza": "pincher",
        "__v": 0
    },
    {
        "_id": "5eaf03d12e94f63ae490a30f",
        "name": "cheo",
        "size": "grande",
        "fur": "poco",
        "docility": "docil",
        "maintenance": 1500000,
        "timeRequired": true,
        "energy": true,
        "age": "cachorro",
        "raza": "pincher",
        "__v": 0
    },
    {
        "_id": "5eaf03d12e94f63ae490a30f",
        "name": "abby",
        "size": "muygrande",
        "fur": "poco",
        "docility": "docil",
        "maintenance": 1500000,
        "timeRequired": true,
        "energy": true,
        "age": "cachorro",
        "raza": "pincher",
        "__v": 0
    },
    {
        "_id": "5eaf03d12e94f63ae490a30f",
        "name": "linda",
        "size": "pequeño",
        "fur": "poco",
        "docility": "docil",
        "maintenance": 1500000,
        "timeRequired": true,
        "energy": true,
        "age": "cachorro",
        "raza": "pincher",
        "__v": 0
    },
    {
        "_id": "5eaf03d12e94f63ae490a30f",
        "name": "vanus",
        "size": "grande",
        "fur": "abundante",
        "docility": "agresivo",
        "maintenance": 1500000,
        "timeRequired": true,
        "energy": true,
        "age": "cachorro",
        "raza": "pincher",
        "__v": 0
    }
];

var prototype = {
    "size": "muygrande",
    "fur": "abundante", 
    "docility": "agresivo", 
    "maintenance": 1500000, 
    "timeRequired": true, 
    "energy": true, 
    "age": "cachorro"
};

//main

var myPreferences=[];
for (const animal in myDogs) {
    value=compare(myDogs[animal],prototype);
    myPreferences.push(agregarPropiedad(myDogs[animal],value));

    
}
console.log(myPreferences);


//functions
myPreferences.sort(function(a,b){
    return  (b.nMatch - a.nMatch);
});

console.log(myPreferences);
function agregarPropiedad(obj,valor){
    return Object.defineProperty(obj,'nMatch',{enumerable: true,
        configurable: true,
        writable: true,
        value: valor});
}

function compare( animal , prototype){
    nMatch=0;
    for (const key in animal) {
        
      if(prototype.hasOwnProperty(key) && animal[key]== prototype[key]){
        nMatch++;
      }
    }
    return nMatch;
}