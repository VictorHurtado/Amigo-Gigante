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

module.exports={
   dog: new model("Dog",dogSchema),
} ;