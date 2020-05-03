const { Router } = require('express');
const router= Router();
const digitsOfNUmbers= require('../functions/functions_species');

const Specie=require("../models/specie");
// enrutador 
//analisis de especies 
router.post('/api/species/analyzeSpecies',async(req,res)=>{
    const body = req.body;
    var arrayResponses=[];
    var arrayDecision=[0.0,0.0,0.0,0.0];
    var responses = JSON.parse(body.myResponses);
    console.log(responses);
    for (const response in responses) {
       if(responses[response][1]<10){
            arrayResponses.push(responses[response][1]);
       }else{
            var arrayMini= digitsOfNUmbers(responses[response][1]);
            for (let index = 0; index < arrayMini.length; index++) {
                arrayResponses.push(parseInt(arrayMini[index]));
                
            }
       }
    }
    for (let index = 0; index < arrayResponses.length; index++) {
        switch (arrayResponses[index]){
            case 1: arrayDecision[0]+=1.0;break;
            case 2: arrayDecision[1]+=1.0;break;
            case 3: arrayDecision[2]+=1.0;break;
            case 4: arrayDecision[3]+=1.0;break;
        }
    }
    for (let index = 0; index < arrayDecision.length; index++) {
        
        arrayDecision[index]=parseFloat(((arrayDecision[index]*100)/arrayResponses.length).toFixed(1));
        
    }
    console.log(arrayDecision);
    res.json(arrayDecision);
    
});



//CRUD
router.get('/api/species/extractSpices',async (req,res)=>{
    const spices= await Specie.find();
    
    res.json({spices});
});
router.post('/api/species/generateSpices',async(req,res)=>{
    await Specie.create({
        nameSpice: req.body.nameSpice,
        personality: req.body.personality,
        space: req.body.space,
        economic_resources: req.body.economic_resources,
        time: req.body.time,
        long_terms_plans: req.body.long_terms_plans,
        diseases:req.body.diseases,
    });
    res.json({message:'especie creada con exito'});
});
router.delete('/api/species/deleteSpice/:id',async (req,res)=>{
    const _id=req.params.id;
    try {
        const spicedelete = await Specie.findByIdAndDelete({_id});
        if(!spicedelete){
            return res.json({message:"no se encontro el id",error});
        }
        res.json({message:"Se elimino la especie con exito",spicedelete});
        
    } catch (error) {
        return res.json({
            message: 'ocurrio un error',
            error
        });
    }
    
});
//CRUD
module.exports= router;