const rateLimit = require("express-rate-limit");

 function bruteLimiter (req,res,next){  
    //app.set('trust proxy', 1);
     rateLimit({
        windowMs: 60 * 60 * 1000, // 1 hour window
        max: 5, // start blocking after 5 requests
        message:
        "Too many accounts created from this IP, please try again after an hour"
    });
 }
 const notBruteSecure =rateLimit({
    windowMs: 60 * 60 * 1000, // 1 hour window
    max: 5, // start blocking after 5 requests
    message:
    "Excediste el limite de peticiones, debe esperar una hora intentar nuevamente ",
    handler:
    function (req, res, /*next*/) {
        //res.status(options.statusCode).send(options.message);
        res.json({"data":{"result":false,"message":"Excediste el limite de peticiones, debe esperar una hora intentar nuevamente"}})
    }
});
  module.exports={bruteLimiter,notBruteSecure};