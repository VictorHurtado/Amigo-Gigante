const {Schema, model} = require("mongoose");

const dogSchema= new Schema({
    name: String, 
    size: {type: String,required:true},
    fur: {type: String,required: true},
    docility: {type: String,required: true},
    maintenance: {type: Number,required: true},
    timeRequired:{type: Boolean,required: true},
    energy: {type: Boolean,required: true},
    age: {type: String,required:true},
    photo:{type:String, required:true},
    raza: { type: String,  required:true}, 
});

const catSchema= new Schema({
    name: String,
    fur: {type: String,required: true},
    maintenance: {type: Number,required: true},
    age: {type: String,required:true},
    personality:[String],
    raza: { type: String,  required:true},
    photo:{type:String, required:true} 
});
const birdSchema= new Schema({
    name: String,
    size: {type: String,required:true},
    sound: {type: Boolean,required:true},
    domesticate: {type: Boolean,required:true},
    color: {type: String,required:true},
    maintenance: {type: Number,required: true},
    age: {type: String,required:true},
    raza:{type:String,required:true},
    photo:{type:String,required:true}

});
const reptileSchema= new Schema({
    name:String,
    size: {type: String,required:true},
    maintenance: {type: Number,required: true},
    extremities:{type: Boolean,required:true},
    type:{type:String,required:true},
    danger:{type:String,required:true},
    food: {type: String,required:true},
    raza: {type:String,required: true},
    photo:{type:String,required:true}
});

module.exports={
   dog: new model("Dog",dogSchema),
   cat: new model("Cat",catSchema),
   bird: new model("Bird",birdSchema),
   reptile: new model("Reptile",reptileSchema),

};