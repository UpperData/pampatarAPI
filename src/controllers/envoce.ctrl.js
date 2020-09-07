const model=require('../db/models/index');
const mail= require ('./mail.ctrl');
require ('dotenv').config();
const generals=require('./generals.ctrl')

async function notify(req,res){
    const t = await model.sequelize.transaction();
    const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
    const{attachment,taxes,deliveryId,dateNotify,envoiceNum,envoiceTypeId}=req.body
    return await model.attachment.create({data:attachment,tabs:[{"name":"Boleta"},{"name":shop.name},{"name":"boleta"+envoiceNum},{"name":envoiceTypeId},{"name":"Pedido "+deliveryId}]},{transaction:t})
    .then(async function(rsAdjunto){
        return await model.envoiceNotify.create({attachmentId:rsAdjunto.id,taxes,deliveryId,dateNotify,envoiceNum,envoiceTypeId,shopId:shop.id},{transaction:t})
        .then(async function(rsCreateNotify){
            var link=process.env.HOST_FRONT+"/setting/envoice/"+rsCreateNotify.id;
            var mailsend = await  mail.sendEmail({
            "from":"Pampatar <upper.venezuela@gmail.com>", // Enviar correo
            "to":"angel.elcampeon@gmail.com",
            "subject": '.:Notificación de Boleta:.',                        
            "html":`La tienda <b>`+shop.name +`</b> a notificado la boleta <b>`+ rsCreateNotify.id +`</b>`,
            "html":`<!doctype html>
                        <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Loco Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
                        <hr style="width: 420; height: 1; background-color:#99999A;">
                        <link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
                    
                        <div  align="center">
                            <h2 style="font-family:sans-serif; color:#ff4338;">BOLETA</h2>
                            <p style="font-family:sans-serif; font-size: 19px;" >La tienda <b>`+shop.name +`</b> a notificado la boleta N° <b>`+ rsCreateNotify.id +`</b></p>						
                            <a href="`+ link +`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Ver Detalles"></a>
                            <br>
                        </div>						
                            <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
                            <br>
                            <div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
                                <p align="center">	
                                    <a href="#">Quiénes somos</a> | <a href="#">Políticas de privacidad</a> | <a href="#">Términos y condiciones</a> | <a href="#">Preguntas frecuentes</a> 
                                </p>					
                        
                                <p  align="center" >
                                info@estudiopampatar.cl
                                        Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
                                </p>
                            </div>`	
    
            },{ transaction: t })
            if(mailsend){
                await t.commit();
                res.json({data:{"result":true,"message":"La notificación de su boleta se a procesado satisfactoriamente"}});                
            }else{
                await t.rollback();
                console.log(error); 
            }  
        }).catch(async function(error){
            await t.rollback();
            console.log(error);  
            res.json({data:{"result":false,"message":"Ocurrió un error tratando de notificar su boleta, intente nuevamente"}});                
        })
    }).catch(async function(error){
        await t.rollback();  
        console.log(error);       
        res.json({data:{"result":false,"message":"No se pudo procesas archivo que intenta adjuntar"}});                
    })
}
module.exports={notify}