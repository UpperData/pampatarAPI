
const Environment = require('transbank-sdk').Environment;
const WebpayPlus = require('transbank-sdk').WebpayPlus;
WebpayPlus.commerceCode = process.env.TRANSBANK_COMMERCECODE;
WebpayPlus.apiKey = process.env.TRANSBANK_APIKEY;
WebpayPlus.environment = process.env.TRANSBANK_ENVIRONMENT;


async function payOrderStart(req,res){
    const {AccountId,shipping,items,pay,people,seller}= req.body;
    //const {buy_order, session_id, amount, return_url} =req.body;
    //return_url --> sustituido por variable de entorno process.env.PAY_RETURN_URL
    const t= await model.sequelize.transaction();
    return await module.purchaseOrder.create({AccountId,shipping,items,pay,people,seller},{transaction:t})
    .then(async function(rsPurchase){
        await WebpayPlus.Transaction.create(rsPurchase.id, rsPurchase.AccountId, rsPurchase['pay'].amount,process.env.PAY_RETURN_URL)
        .then(async function (rsPayStar){
            // vaciar carrito
            t.commit();
            res.json(rsPayStar);
        }).catch(async function(error){
            res.json({"data":{"result":false,"message":"Su pago no pudo ser procesado, intente nuevamente"}})
        })
    }).catch(async function(error){
        res.json({"data":{"result":false,"message":"No fue posible registrar su compra, intente nuevamente"}})
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