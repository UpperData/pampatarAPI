var jwt=require('jwt-simple');
var moment=require('moment');
require('dotenv').config();
var requireRole=function(roles){   
return async function (req,res,next){
    const authorized=roles;   
    var isValid=false;  
    if(!req.headers.authorization){
       // res.redirect(process.env.HOST_FRONT+"login"); // redirecciona a URL con hash 
        res.status(403).json({"data":{"result":false,"message":"Usuario no autorizado"}});       
    } 
  //  var token=req.headers.authorization.split(' ')[1];
    const token = req.header('Authorization').replace('Bearer ', '')
    var  payload= await jwt.decode(token,process.env.JWT_SECRET);
    //console.log("TOKEN ACCOUNT:" + payload.account)
    const roleGroups= payload.role;
    if(payload.exp<=moment().unix()){
        //res.redirect(process.env.HOST_FRONT+"productos");
        res.status(401).json({"data":{"result":false,"message":"Token ha Expirado"}})        
    }
    if(roleGroups.length<1){
        res.status(401).json({"data":{"result":false,"message":"Usario tiene permiso"}})              
    }
    if(payload.rem!='lo-veremos-cara-a-cara'){
        res.status(401).json({"data":{"result":false,"message":"Token desconocido"}})        
    }     
    for (var i = 0; i < authorized.length; i++){       
        for (var j = 0; j < roleGroups.length; j++){  
            if (authorized[i].id == roleGroups[j].id){
                isValid=true               
            }
        }
    }   
    if(!isValid){
        res.status(401).json({"data":{"result":false,"message":"No tiene autorización para acceder a este modulo"}})  
    }else{
        next();
    }
};
    /*
    */
}
module.exports={requireRole}
