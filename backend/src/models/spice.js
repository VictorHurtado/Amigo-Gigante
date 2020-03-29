const {Schema, model}= require('mongoose');

const spiceSchema= new Schema({
    nameSpice:String,
    personality: String, 
    space: Number,
    economic_resources: Number,
    time: Boolean,
    long_terms_plans: Number,
    diseases:[String],
});

module.exports= new model('Spice',spiceSchema);