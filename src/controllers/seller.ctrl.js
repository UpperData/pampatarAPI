const model=require('../db/models/index');
const { Op } = require('sequelize');
const mail= require ('./mail.ctrl');
const Validator = require('jsonschema').Validator;
const generals=require('./generals.ctrl')
require ('dotenv').config();
var jwt=require('jwt-simple');
var schMaster = require('../schemas/master.sch.json') // Esquema general para tablas Master
var schAddress = require('../schemas/address.sch.json') // Esquema de Dirección  
var schPhone = require('../schemas/phone.sch.json') // Esquema de telefono
var schPartner = require('../schemas/partner.sch.json') // Esquema de Socios
var schProcess = require('../schemas/processFactory.sch.json') // Esquema de Socios
var schPayment = require('../schemas/payment.sch.json') // Esquema de Datos de Pago
var schDocument = require('../schemas/document.sch.json') // Esquema de documento de identidad



async function getShop(req,res){
    const dataToken=generals.currentAccount(req.header('Authorization').replace('Bearer ', '')) 
    const AccountId=dataToken.account;
    var status;
    return await model.shop.findOne({were:{AccountId}})
    .then(async function(rsShop){
        
        if(!rsShop.processId || !rsShop.address || !rsShop.paymentCong || !rsShop.storeType || !rsShop.startActivityAttachment ){                
            res.json({rsShop}) ;
            //console.log(rsShop.name.replace(/ /g, "").length)
            status="Desactualizada"            
        }else{
            status="Actualizada"            
        }        
    }).catch( function(error){
        res.json({"data":{"result":false,"message":"No se pudo encontrar registro de su tienda"}})
        
    })
}

async function configShop(req,res){
                                                                                                                                                                                                                                                                                            
    const dataToken=await generals.currentAccount(req.header('Authorization').replace('Bearer ', ''));
    const Account =dataToken['data']['account'];
    const tokenPeopleId=dataToken['data']['people'].id;
    //console.log(req.body);
    var v = new Validator();    
    var updatevalid=false;
    const{
    requestId,
    birthDate, 	 
    genderId,
    nationalityId,
    name,
    document,
    lastName,
    firstName,    
    logo ,  
    processId,
    shopDescription,
    isLocal,
    employees,
    partner,
    peopleId,
    phone,
    address,
    paymentCong,
    storeType,
    startActivity,
    startActivityAttachment}=req.body

    //console.log(document.length);
   
    // VALORES MINIMOS REQUERIDOS PARA ACTAULIZAR
    if (
        requestId!=null &&
        birthDate!=null && 	 
        genderId!=null &&        
        document.length<1 &&
        lastName!=null &&
        firstName!=null &&
        name!=null &&        
        processId.length<1 &&
        shopDescription!=null &&
        isLocal!=null &&
        employees!=null &&
        peopleId!=null &&
        phone.length<1 &&
        address.length<1 &&
        storeType!=null &&
        startActivity!=null ){
        updatevalid=false;
    }else{updatevalid=true;}
   // v.addSchema(schMaster, '/schMaster');

 //  console.log(v.validate(phone, schPhone));
    // Valida JSON address
  //  console.log("empezo de Validar JSON")
    if(updatevalid){
      v.addSchema(schMaster, '/schMaster');

      if(!v.validate(address, schAddress)){
          res.json({data:{"result":false,"message":"Dirección invalida"}})
          updatevalid=false;
      }
      if(!v.validate(phone, schPhone)){
          res.json({data:{"result":false,"message":"Telefono Invalido"}})
          updatevalid=false;
      }
      if(!v.validate(processId, schProcess)){
        res.json({data:{"result":false,"message":"Procesos de fabricación invalidos"}})
        updatevalid=false;
      }
      if(!v.validate(partner, schPartner)){ 
        res.json({data:{"result":false,"message":"Datos de socios son invalidos"}})
        updatevalid=false;
      }      
      if(!v.validate(paymentCong, schPayment)){
        res.json({data:{"result":false,"message":"Datos de socios son invalidos"}})
        updatevalid=false;
      }  
      if(!v.validate(document, schDocument)){
        res.json({data:{"result":false,"message":"Datos de socios son invalidos"}})
        updatevalid=false;
      }     
    }
    /// FIN DE VALIDACIÓN DE VALORES JSON
console.log("terminao de Validad JSON")
 
    if( updatevalid){
      const t = await model.sequelize.transaction();		//Inicia transaccion 
      return await model.shop.update({     // Actualiza tienda
      
        name,    
        logo ,
       // processId,
        shopDescription,
        isLocal,
        employees,
        partner,        
        phone,
        address,
        paymentCong,
        storeType,
        startActivity,
        startActivityAttachment},
        { where: { requestId }},{transaction:t})
      .then(async function(srShop){
        return await model.People.update({  // actauliza datos personales
          birthDate, 	 
          genderId,          
          document,
          lastName,
          firstName,
          nationalityId},
          {where:{id:tokenPeopleId}}, { transaction: t })
          .then(async function(rsPeople){    
              if(rsPeople){
                mail.sendEmail({"from":"Estudio Pampatar", // Enviar correo
                "to":Account.email,
                "subject": '.:Cuenta Pampatar - Cuenta Actualizados:.',
                "text":"Hemos procesado Satisfactoriamente la actualización de su cuenta",
                "html":"Hemos procesado Satisfactoriamente la actualización de su cuenta <br><br> <a href= #>Si Desconoce esta acción haga click aquí</a>"
                },{ transaction: t })
                await t.commit();
                res.json({data:{"result":true,"message":"Perfil Actualizado Satisfactoriamente"}});                
              }          

          }).catch(async function(error){
              await t.rollback();  
            //  console.log(error)            ;
              res.json({data:{"result":false,"message":"Algo salido mal mientras actualizambamos sus datos personales, intente nuevamente"}})            
          })
      }).catch(async function(error){
        await t.rollback();    
        console.log(error)              
        res.json({data:{"result":false,"message":"Algo salido mal mientras actualizambamos su cuenta, intente nuevamente"}})
      })
    }else{
      res.json({data:{"result":false,"message":"El formulario no cumple con los validaciones necesario"}})
    } 
}



async function getBidOne(req,res){ // BUSCA UNA PUBLICACIÓN DE LA TIENDA  
  const {id}=req.params   
  var currentShop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''))
    return await model.Bids.findOne({where:{id,shopId:currentShop.id}})
    .then(async function(rsBid){
      res.json({data:{rsBid}})
    }).catch(async function(error){
     // console.log(error)
      res.json({data:{"result":false,"message":"Error buscando SKU"}})
    });  
}

async function getBidAll(req,res){
  var currentShop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''))
      return await model.Bids.findAndCountAll({where:{shopId:currentShop.id}})
      .then(async function(rsBid){
        res.json({data:{rsBid}})
      }).catch(async function(error){
        
        res.json({data:{"result":false,"message":"Ocurrio un error retornando publicaciones"}})
      });  
}
async function addBid(req,res){
  const dataToken=await generals.currentAccount(req.header('Authorization').replace('Bearer ', '')) 
  const Account =dataToken['data']['account'];
  var rsBid;
// :::::::::::::: COMUNES ::::::::::::::
var currentShop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''))
const shopId=currentShop.id

const {  
bidType, // tipo INTEGER
photos, // Identificadores de las fotos JSONB
title,  // Titulo STRING
brandId, // marca INTEGER
longDesc, //descripcion larga TEXT
smallDesc, //descripcion corta  STRING
tags, // Etiquetas de la publicación JSONB
category, // Categoria y subcategorias JSONB
materials, // Materiales de Fabricación (tabs) JSONB
StatusId, // Identificador de lapúblicación INTEGER
reasons // Motivos de la Públicación JSONB
}=req.body

// :::::::::::::: PRODUCTO ::::::::::::::
const{WarehouseId, // Identificador del almacen INTEGER
      variation, // Color, tipo Prenda, Talla, Cant. Unidades, Precio, descuento JSONB
      garanty, //Meses de garantía STRING  
      customizable,
      customize, // Personalizable STRING 20-250
      include, // Que incluye el paquete STRINF 20-250
      devolution, //Devolucion BOOLEAN  
      time, // Tiempo fabricación INTEGER
      disponibility, // Disponibilidad INTEGER
      weight, // Peso de producto  DECIMAL(10, 2)
      dimesion // dimeciones del producto  JSONB
}=req.body
// :::::::::::::: TALLER ::::::::::::::::
const{schedule // Calendario de talleres JSONB
}=req.body
const t = await model.sequelize.transaction();
if(bidType, photos, title, brandId, longDesc, smallDesc, tags, category, 
  materials, shopId, StatusId, reasons){
    if(bidType){ //PRODUCTO
      if(WarehouseId, variation, garanty, customize, include, devolution, 
        time, disponibility, weight,dimesion){

            rsBid= await model.Bids.create({bidType, photos,title, brandId, longDesc, smallDesc, tags, category, 
            materials, shopId, StatusId,customizable,customize, reasons,WarehouseId, variation, garanty, customize, include, devolution, 
            time, disponibility, weight,dimesion},{ transaction: t })
          .then(async function(rsResult){
              return rsResult;
          }).catch(async function(error){
            console.log(error)
            await t.rollback();
            res.json({data:{"result":false,"message":"Ocurrió un error en la creación de la publicación, intente nuevamente"}})
          })

        }else{
          await t.rollback();
          res.json({data:{"result":false,"message":"Debe ingresa todos los valores para el registro del producto"}})
        }
    }else if(bidType==2){ //TALLER / SERVICIO
        if(schedule){ //validar formato JSON

            rsBid=  await model.Bids.create(bidType, photos,title, brandId, longDesc, smallDesc, tags, category, 
            materials, shopId, StatusId, reasons,schedule,customizable,{ transaction: t }) // REGISTRAR TALLER
            .then(async function(rsResult){
              return rsResult;
            }).catch(async function(error){
              console.log(error)
              await t.rollback();
              res.json({data:{"result":false,"message":"Ocurrió un error en la creación de la publicación, intente nuevamente"}})
            })
        }else{
          await t.rollback();
          res.json({data:{"result":false,"message":"Debe ingresa calendario del taller"}})
        }
    }else{
      await t.rollback();
      res.json({data:{"result":false,"message":"Debe ingresar un tipo de publicación valido"}})
    }

    if(rsBid){ //si se registro una publicación envia correo
      var mailsendShop= mail.sendEmail({
        "from":"Pampatar <upper.venezuela@gmail.com>",
        "to":Account.email,
        "subject": '.:Nueva Publicacion Pampatar:.',
        "text":"Haz creado una nueva publicación",
        "html": `<!doctype html>
        <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Loco Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
        <hr style="width: 420; height: 1; background-color:#99999A;">
        <link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
      
        <div  align="center">
          <h4 style="font-family:sans-serif; color:#99999A;" class="card-title">`+ currentShop.name.toUpperCase() +`</h4>
          <br>
          <h2 style="font-family:sans-serif; color:#ff4338;" >¡Nueva publicación!</h2>
          <p style="font-family:sans-serif; font-size: 19px;" > Usted ha solicitado publicar un servicio en Pampatar, pronto estará activa </p>
          <a href="#">`+ title.toUpperCase() +`</a> <br><br>
                
          <pre style="font-family:sans-serif; margin-top: 25px; color: #99999A;" class="card-text">¿NO HAS INICIADO SESIÓN?</pre>
          <a href="http://192.99.250.22/pampatar/#/sign-in">Haz clic</a> <br>
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
        },{transaction:t});              
        var mailsendadmin= mail.sendEmail({
        "from":"Pampatar <upper.venezuela@gmail.com>",
        "to":'veronicacestari@gmail.com',
        "subject": '.:Solicitud de Publicación:.',
        "text":"Solicitud de Publicación",
        "html": `<!doctype html>
          <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Loco Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
          <hr style="width: 420; height: 1; background-color:#99999A;">
          <link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
        
          <div  align="center">
            <h6 style="font-family:sans-serif; color:#99999A;" class="card-title">A D M I N I S T R A D O R</h6>
            <br>
            <h2 style="font-family:sans-serif; color:#ff4338;" >¡Nueva publicación!</h2>
            <p style="font-family:sans-serif; font-size: 19px;" > <b>`+ currentShop.name.toUpperCase() +`</b> ha solicitado publicar en Pampatar </p>
            <a href="#">`+ title.toUpperCase() +`</a> <br>   <br>         
            <a href="#"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Revisar publicación"></a>          
            <pre style="font-family:sans-serif; margin-top: 25px; color: #99999A;" class="card-text">¿NO HAS INICIADO SESIÓN?</pre>
            <a href="`+process.env.HOST_FRONT+`/sign-in">Haz clic</a>  <br>
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
        },{transaction:t});
        if(mailsendadmin && mailsendShop){
          await t.commit();
          res.json({data:{"result":true,"message":"Publicación procesada exitosamente"}})                  
        }else{
          await t.rollback()
          res.json({data:{"result":true,"message":"Ocurrió un error procesando solicitud"}})                  
        }
    }
}else{
  await t.rollback();
  res.json({data:{"result":false,"message":"Debe ingresar los valores requerido"}})
} 
}

module.exports={getShop,configShop,getBidOne,getBidAll,addBid}