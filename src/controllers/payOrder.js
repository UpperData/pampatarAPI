
const Environment = require('transbank-sdk').Environment;
const WebpayPlus = require('transbank-sdk').WebpayPlus;
WebpayPlus.commerceCode = 597055555532;
WebpayPlus.apiKey = '579B532A7440BB0C9079DED94D31EA1615BACEB56610332264630D42D0A36B1C';
WebpayPlus.environment = Environment.Integration;


async function payOrderStart(req,res){
    const {buy_order, session_id, amount, return_url} =req.body;
    await WebpayPlus.Transaction.create(buy_order, session_id, amount, return_url)
    .then(async function (rsPayStar){
        res.json(rsPayStar)
    }).catch(async function(error){
        res.json({"data":{"result":false,"message":"Su pago no pudo ser procesado, intente nuevamente"}})
    })
}
async function payOrderCommit(req,res){
    const {token_ws}=req.params;
   /* await WebpayPlus.Transaction.commit(token_ws)
    .then(async function (rsPayCommit){
        res.json(rsPayCommit)
    }).catch(async function(error){
        console.log(error);
        res.json({"data":{"result":false,"message":"Su pago no pudo confimrar su pago, intente nuevamente"}})
    })*/
    var request = require('request');

    //Lets configure and request
    request({
        url: 'https://webpay3gint.transbank.cl/webpayserver/initTransaction', //URL to hit
        qs: {from: 'pampatar.cl', time: +new Date()}, //Query string data
        method: 'POST', // specify the request type
        /*headers: { // speciyfy the headers
            'Content-Type': 'MyContentType',
            'Custom-Header': 'Custom Value'
        },*/
        body: `<input type="hidden" name="token_ws" 
        value="`+token_ws+`"/>` //Set the body as a string
    }, function(error, response, body){
        if(error) {
            console.log(error);
        } else {
            console.log(response.statusCode, body);
            //res.render(response);
        }
    });
}

module.exports={
    payOrderStart,payOrderCommit
}