const mongoose= require('mongoose');

async function connect(){
    await mongoose.connect('mongodb://localhost/pet_app', { useNewUrlParser:true});// una base de datos local y el la creara
    //el useNewUrl ... es para que no muestre mensaje por pantalla de error
    console.log('Database Connected');
};
module.exports={connect}