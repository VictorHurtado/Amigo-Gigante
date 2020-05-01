const { Router } = require('express');
const router= Router();

const Specie=require("../models/specie");
// enrutador 
router.post('/api/species/analyzeSpecies',async(req,res)=>{
    const body = req.body;
    console.log(body.myResponses);
    var responses = JSON.parse(body.myResponses);
    console.log(responses);
  
    res.json(responses);
    
});
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
module.exports= router;