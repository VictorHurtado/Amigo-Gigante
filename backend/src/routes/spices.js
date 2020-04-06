const { Router } = require('express');
const router= Router();

const Spice=require("../models/spice");
// enrutador 
router.get('/api/extractSpices',async (req,res)=>{
    const spices= await Spice.find();
    res.json({spices});
});
router.post('/api/generateSpices',async(req,res)=>{
    await Spice.create({
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
router.delete('/api/deleteSpice/:id',async (req,res)=>{
    const _id=req.params.id;
    try {
        const spicedelete = await Spice.findByIdAndDelete({_id});
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