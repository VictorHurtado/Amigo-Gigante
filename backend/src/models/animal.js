const {Schema, model} = require("mongoose");

const dogSchema= new Schema({
    name: String, 
    size: {type: String,required:true},
    fur: {type: String,required: true},
    docility: {type: Boolean,required: true},
    maintenance: {type: Number,required: true},
    timeRequired:{type: Boolean,required: true},
    energy: {type: Boolean,required: true},
    age: Number,
    raza: { type: String,  required:true}, 
});

const catSchema= new Schema({
    name: String,
    fur: {type: String,required: true},
    maintenance: {type: Number,required: true},
    age: Number,
    personality:[String],
    raza: { type: String,  required:true}, 
});

module.exports={
   dog: new model("Dog",dogSchema),
   cat: new model("Cat",catSchema),
};