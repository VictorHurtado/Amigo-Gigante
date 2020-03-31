const { Router } = require('express');
const router= Router();
const animals=require("../models/animal");

//animales
const dogModel= animals.dog;
const catModel= animals.cat;
//rutas para animales
// perros
router.get('/api/extractDogs',async(req,res)=>{
    const totalDogs= await dogModel.find();
    res.json({mensaje:"se extrageron con exito todos los perros",totalDogs});
});
router.post('/api/generateDog',async(req,res)=>{
    console.log(req.body);
    const body = req.body;
   try {
    const newDog = await dogModel.create(body);
    res.status(200).json(newDog);
    
   } catch (error) {
       return res.status(500).json({
           mensaje: "no se logro generar el perro",
       });
   }
});
router.delete('/api/deleteDog/:id',async(req,res)=>{
    const _id= req.params.id;
    try {
        const dogdelete = await dogModel.findByIdAndDelete({_id});
        if(!dogdelete){
            return res.json({message:"no se encontro el id",error});
        }
        res.json({message:"Se elimino el perro con exito",dogdelete});
        
    } catch (error) {
        return res.json({
            message: 'ocurrio un error',
            error
        });
    }
});
// Gatos
router.get('/api/extractCats',async(req,res)=>{
    const totalCats= await catModel.find();
    res.json({mensaje:"se extrageron con exito todos los gatos",totalCats});
});
router.post('/api/generateCat',async(req,res)=>{
   
    const body = req.body;
   try {
    const newCat= await catModel.create(body);
    res.status(200).json(newCat);
    
   } catch (error) {
       return res.status(500).json({
           mensaje: "no se logro generar el gato",
       });
   }
});
router.delete('/api/deleteCat/:id',async(req,res)=>{
    const _id= req.params.id;
    try {
        const catdelete = await catModel.findByIdAndDelete({_id});
        if(!catdelete){
            return res.json({message:"no se encontro el id",error});
        }
        res.json({message:"Se elimino la el gato con exito",catdelete});
        
    } catch (error) {
        return res.json({
            message: 'ocurrio un error',
            error
        });
    }
});
module.exports=router;