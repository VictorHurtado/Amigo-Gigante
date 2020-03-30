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
        nameSpice:"perro",
        personality: "fidelidad",
        space: 10,
        economic_resources: 10,
        time: true,
        long_terms_plans: 5,
        diseases:["terapia","invidente"]
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