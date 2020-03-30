const { Router } = require('express');
const router= Router();
const animals=require("../models/animal");

//animales
const dogModel= animals.dog;
//rutas
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
module.exports=router;