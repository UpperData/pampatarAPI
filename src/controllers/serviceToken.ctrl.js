var jwt=require('jwt-simple');
var moment=require('moment');
require('dotenv').config();

 async function newToken(accountId,roles,peoples){
    var payload={
	account:accountId,
	role:roles,
	people:peoples,
	rem:"lo-veremos-cara-a-cara",
	iat:moment().unix(),
	exp:moment().add(1,"days").unix()
    };

    var token= await jwt.encode(payload,process.env.JWT_SECRET);
      
    return token;
}

module.exports={newToken}
