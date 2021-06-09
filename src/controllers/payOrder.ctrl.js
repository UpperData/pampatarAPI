
const model = require('../db/models/index');
const generals = require('./generals.ctrl')
const servToken = require('./serviceToken.ctrl');
var jwt = require('jwt-simple');
require('dotenv').config();
var moment = require('moment');
const { Op } = require("sequelize");
const mail = require('./mail.ctrl');
const bcrypt = require("bcryptjs");
const Environment = require('transbank-sdk').Environment;
const WebpayPlus = require('transbank-sdk').WebpayPlus;
WebpayPlus.commerceCode = 597037398179;
WebpayPlus.apiKey = '579B532A7440BB0C9079DED94D31EA1615BACEB56610332264630D42D0A36B1C';
WebpayPlus.environment = Environment.Integration;
const shopper=require('./shopper.ctrl')

async function payOrderCreate(req,res){
    const {shoppingcarId,shipping,items,pay,people,seller}= req.body;  
    //Incializar shoppingcarId account['data']['account'].id;
    const today= new Date();
    const t= await model.sequelize.transaction();
    historyStatus=[]
    historyStatus.push({"id":1," ":"Orden Regsitrada - Sin Pagar","date":today});
    return await model.purchaseOrder.create({shoppingcarId,shipping,items,pay,people,seller,historyStatus,invoice},{transaction:t})
    .then(async function(rsPurchase){
        t.commit();
      res.json(rsPurchase)
    }).catch(async function(error){
        t.rollback();
        console.log(error)
        res.json({"data":{"result":false,"message":"No fue posible registrar su compra, intente nuevamente"}})
    })
}
async function payOrderCommit(req,res){ // Confirmación de pago de orden de compra
    const {orderId,pay}=req.body
    /*Descripcion de variable
    - ordeId: Id de la orden de compra que se va aconfirmar
    - pay: Json emitido por transbank   
    */
    const today= new Date();
    const token = req.header('Authorization').replace('Bearer ', '');
    if(orderId>0 && pay!=null && token){
        const account =await generals.currentAccount(token);
        if(pay.status=='AUTHORIZED'){ //valida que el pago este procesado
            const t = await model.sequelize.transaction();
            await model.purchaseOrder.findOne({ // Valida que la orden de compra sea real
                attributes:['id','historyStatus','shoppingcarId'],
                where:{id:orderId}
            }).then(async function (rsPurchaseFind){
                //actualiza orden de compra: información del pago + StatusTracking
                var r= rsPurchaseFind.historyStatus.filter(st=>st.id==2).length;// si esta confirmada               
                if(r==0){
                    rsPurchaseFind.historyStatus.push({"id":2,"name":"Pago confirmado","date":today});
                    await model.purchaseOrder.update({ //actualiza orden de compra con información del pago
                        pay,statusTrackingId:1,historyStatus:rsPurchaseFind.historyStatus},
                        {where:{id:rsPurchaseFind.id}
                    }).then(async function (rsPurchaseUpdate){                       
                        t.commit(); //confrima pago en pampatar
                        return true;
                    }).catch(async function(error){
                        console.log(error);
                        generals.sendEmail({
                            "to": process.env.EMAIL_ADMIN_SYS,
                            "subject": 'ALERTA:Incidente en facturación',
                            "html": `<!doctype html>
                            <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
                            <hr style="width: 420; height: 1; background-color:#99999A;">
                            <link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
                        
                            <div  align="center">
                                <h2 style="font-family:sans-serif; color:#ff4338;" >¡Orden confirmada en Transbank no procesada en Pampatar!</h2>
                                <p style="font-family:sans-serif; font-size: 19px;" > La orden ce compra con el código <b> ` + rsPurchaseFind.id + ` </b>fue cobrada pero no pudo ser confirmada en Pampatar, debe procesar manualmente la orden</p>
                                <br>
                                    <h3>Detalle del pago</h3>
                                <br>
                                ` + JSON.stringify(pay) +`
                            </div>
                            <br>						
                                <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
                                <br>
                                <div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
                                    <p align="center">	
                                        <a href="https://www.pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://www.pampatar.cl/legal/">Políticas de privacidad</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Términos y condiciones</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
                                    </p>					
                            
                                    <p  align="center" >
                                    info@pampatar.cl
                                            Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
                                    </p>
                                </div>`
                        })
                        /*mail.sendEmail({
                            "from": '"Pampatar" <' + process.env.EMAIL_ADMIN + '>',
                            "to": process.env.EMAIL_ADMIN_SYS,
                            "subject": 'ALERTA:Incidente en facturación',
                            "text": "Orden no confirmada",
                            "html": `<!doctype html>
                            <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
                            <hr style="width: 420; height: 1; background-color:#99999A;">
                            <link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
                        
                            <div  align="center">
                                <h2 style="font-family:sans-serif; color:#ff4338;" >¡Orden confirmada en Transbank no procesada en Pampatar!</h2>
                                <p style="font-family:sans-serif; font-size: 19px;" > La orden ce compra con el código <b> ` + rsPurchaseFind.id + ` </b>fue cobrada pero no pudo ser confirmada en Pampatar, debe procesar manualmente la orden</p>
                                <br>
                                    <h3>Detalle del pago</h3>
                                <br>
                                ` + JSON.stringify(pay) +`
                            </div>
                            <br>						
                                <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
                                <br>
                                <div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
                                    <p align="center">	
                                        <a href="https://www.pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://www.pampatar.cl/legal/">Políticas de privacidad</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Términos y condiciones</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
                                    </p>					
                            
                                    <p  align="center" >
                                    info@pampatar.cl
                                            Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
                                    </p>
                                </div>`
                        }) */
                        res.json({"data":{"result":false,"message":"Pago confirmado satisfactoriamente"}});
                    })
                }else{
                    res.end();
                }
            })
        }else{
           
            res.json({"data":{"result":false,"message":"Parametro de entrada no son validos"}})
        }
    }else{
        res.json({"data":{"result":false,"message":"Parametro de entrada no son validos"}})
    }
    
}
async function envoiceIntegration(req,res){ //Registro de factura

}
//Regsitra pedidos de una orden de compra y envia notificaciones
async function petityonsDistribution(data){ 
    const {shoppingcarId}=data;
    await model.shoppingcar.findOne({ // valida carrito
        where:{id:rsPurchaseFind.shoppingcarId}
    }).then(async function(rsShoppingcar){
        var rs=[];
        for (let i = 0; i < rsShoppingcar.items.length; i++) { // Recorre Items de carrito
            pending=await model.Bids.findOne({// Identifica publicaciones involucaradas
                attributes:['id','title','skuTypeId','skuId'],
                where:{id:rsShoppingcar.items[i].BidId},
                include:[{
                    model:model.shop,
                    attributes:['id'],
                    include:[{
                        model:model.shopRequest,
                        attributes:['id'],
                        include:[{
                            model:model.Account,
                            attributes:['id','email'],
                            include:[{
                                model:model.accountRoles,
                                where:{StatusId:1}
                            }]
                        }]
                    }]
                },{
                    model:model.skuType,
                    attributes:['id','name']
                }]
            }).then(async function (rsBids){
                qtySku=rsShoppingcar.items[i].qty; // captura la cantidad para  retornarla
                /* Busca el detalle del producto o servico */
                if(rsBids['skuType'].id==3){
                    var detailSku= await model.service.findOne({
                       attributes:['id','name'],
                        where:{id:rsBids.skuId}
                    });
                }else{
                    var detailSku= await model.sku.findOne({
                        attributes:['id','name'],
                        where:{id:rsBids.skuId}
                    });
                }
                rsBids.dataValues.detailSku={"sku":detailSku,"qty":qtySku};
                return rsBids;
            })
            rs.push(pending);
        }
        var shopList = [...new Set(rs.map(item => item['shop'].id))] //Eliminas tiendas duplicadas
       // console.log(shopList); 
        var rsPetityon=[];                           
        for (let j = 0; j < shopList.length; j++) {
            
           rsPetityon.push(rs.filter(st=>st['shop'].id==shopList[j]));//Extrae pedido de la tienda actual
            //Registra pedidos
            if(r>0){
                await model.petittyon.create({
                    purchaseOrderId:rsShoppingcar.id,
                    items:detailSku,
                    processed:false
                }).then(async function (rsPetityon){
                    await generals.sendNotificationsToUser(
                        account,
                        role,
                        reason,
                        title,
                        text,
                        extra
                    );
                    await generals.sendEmail({
                        to,
                        subject,
                        html
                    });
                })
            }else{
                res.status(403).json({"data":{"result":false,"message":"Deber registrar en Pampatar.cl"}})
            }
            
           
            
        }
        res.json(rsPetityon)
    })
}


module.exports={
    payOrderCreate,payOrderCommit
}