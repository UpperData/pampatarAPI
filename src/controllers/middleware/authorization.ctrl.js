        var jwt=require('jwt-simple');
var moment=require('moment');
require('dotenv').config();

async function validateToken(req,res,next){
    if(!req.headers.authorization){
	    return res.status(403).json({"message":"Usuario no autorizado"})
    }
    var token=req.headers.authorization.split(" ")[1];
    var  payload= await jwt.decode(token,process.env.JWT_SECRET);
    if(payload.exp<=moment().unix()){
	    return res.status(401).json({"message":"Token ha Expirado"})
    }
    if(payload.role.length<1){	return res.status(401).json({"message":"No tiene permiso"})}

    if(payload.rem!='estudiopampatar.com'){return res.status(401).json({"message":"Token no valido"})}
    
    req.account=payload.account;
    req.role=payload.roles;

}
module.exports={validateToken}
