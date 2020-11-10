var jwt=require('jwt-simple');
var moment=require('moment');
require('dotenv').config();

 async function newToken(accountId,roles,shops,peoples,type){
	var exp;
	 if(type=="passwordReset"){
		exp=moment().add(1,"days").unix()
	 }else if(type=="forgot"){
		exp=moment().add(1,"days").unix()
	}else if(type=="newAccount"){
		exp=moment().add(3,"days").unix()
	}else if(type=="login"){
		exp=moment().add(4,"hours").unix()
	}else{
		exp=moment().add(1,"days").unix()
	}
	 
    var payload={
	type,
	account:accountId,
	role:roles,
	shop:shops,
	people:peoples,	
	rem:"lo-veremos-cara-a-cara",
	iat:moment().unix(),
	exp
    };

    var token= await jwt.encode(payload,process.env.JWT_SECRET);
      
    return token;
}

module.exports={newToken}
