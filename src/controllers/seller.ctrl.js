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



async function isShopUpdated(token,req,res){
  
    const dataToken=generals.currentAccount(token) 
    const AccountId=dataToken.account;
    var updated;
    return await model.shop.findOne({were:{AccountId}})
    .then(async function(rsShop){
        
        if(!rsShop.processId || !rsShop.address || !rsShop.paymentCong || !rsShop.storeType || !rsShop.startActivityAttachment ){                       
          updated=false;          
        }else{
          updated="Actualizada"            
        }   
        return updated     
    }).catch( function(error){
        res.json({"data":{"result":false,"message":"Algo salió mal buscando estatus de su tienda"}})
        
    })
}

async function configShop(req,res){
                                                                                                                                                                                                                                                                                            
    const dataToken=await generals.currentAccount(req.header('Authorization').replace('Bearer ', ''));
    const Account =dataToken['data']['account'];
    const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''))    
    const tokenPeopleId=dataToken['data']['people'].id;
  try{  
    var v = new Validator();    
    var updatevalid=false;
    const{    
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

    // VALORES MINIMOS REQUERIDOS PARA ACTAULIZAR
    if (
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
 
 //  console.log(v.validate(phone, schPhone));
    // Valida JSON address
  
    if(updatevalid){
      v.addSchema(schMaster, '/schMaster');

      if(!v.validate(address, schAddress)){
          res.json({data:{"result":false,"message":"Dirección invalida"}})
          updatevalid=false;
      }
      if(!v.validate(phone, schPhone)){
          res.json({data:{"result":false,"message":"Algo salio mal, verifique  telefonos"}})
          updatevalid=false;
      }
      if(!v.validate(processId, schProcess)){
        res.json({data:{"result":false,"message":"Algo salio mal, verifique procesos de fabricación"}})
        updatevalid=false;
      }
      if(!v.validate(partner, schPartner)){ 
        res.json({data:{"result":false,"message":"Algo salio mal, verifique datos de socios son invalidos"}})
        updatevalid=false;
      }      
      if(!v.validate(paymentCong, schPayment)){
        res.json({data:{"result":false,"message":"Algo salio mal,verifique la información bancaria"}})
        updatevalid=false;
      }  
      if(!v.validate(document, schDocument)){
        res.json({data:{"result":false,"message":"Algo salio mal, verifique la información de su documentación"}})
        updatevalid=false;
      }     
    }
    /// FIN DE VALIDACIÓN DE VALORES JSON
//console.log("terminao de Validad JSON") 
    if( updatevalid){
      if(shop.id>0){
        const t = await model.sequelize.transaction();		//Inicia transaccion 
        return await model.shop.update({     // Actualiza tienda      
          name,    
          logo,
          processId,
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
          { where: { id:shop.id }},{transaction:t})
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
                  mail.sendEmail({
                  "from":'"Pampatar" <'+process.env.EMAIL_INFO+'>', // Enviar correo
                  "to":Account.email,
                  "subject": '.:Cuenta Pampatar - :.',
                  "text":"Hemos procesado Satisfactoriamente la actualización de su cuenta",
                  "html":`<!doctype html>
                  <img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Loco Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
                  <hr style="width: 420; height: 1; background-color:#99999A;">
                  <link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
                
                  <div  align="center">
                    <h2 style="font-family:sans-serif; color:#ff4338;" >¡ACTUALIZACIÓN DE DATOS!</h2>
                    <p style="font-family:sans-serif; font-size: 19px;" >Su cuenta pampatar.cl a sido actualizada satisfactoriamente </p>
                                  
                  </div>
                  <br><br><br>
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
                  await t.commit();
                  res.json({data:{"result":true,"message":"Perfil Actualizado Satisfactoriamente"}});                
                }          

            }).catch(async function(error){
                await t.rollback();  
                console.log(error)            ;
                res.json({data:{"result":false,"message":"Algo salido mal mientras actualizambamos sus datos personales, intente nuevamente"}})            
            })
        }).catch(async function(error){
          await t.rollback();    
          console.log(error)              
          res.json({data:{"result":false,"message":"Algo salido mal mientras actualizambamos su cuenta, intente nuevamente"}})
        })
      }else{      
        res.json({data:{"result":false,"message":"El usuario actual no posee tienda aprobada"}})
      } 
    }else{      
      res.json({data:{"result":false,"message":"El formulario no cumple con los validaciones necesario"}})
    } 
  }catch(error){
    res.json({data:{"result":false,"message":"Algo salido mal en el proceso de actualización, intente nuevamente"}})
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
async function addSKU(req,res){
  const {name}=req.body
  const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
  if(generals.isShopUpdated({token:req.header('Authorization').replace('Bearer ', '')})){
    const t = await model.sequelize.transaction();
    return await model.sku.create({name,shopId:shop.id},{transaction:t})
    .then(async function(rsSkus){
      await t.commit();
      res.json({"data":{"result":true,"message":"Su producto fue agregado exitosamente"}})
    }).catch(async function(error){
      //console.log(error);
      await t.rollback();
      if(error.name=='SequelizeUniqueConstraintError'){
        res.json({"data":{"result":false,"message":"Usted ya posee un producto registrado con este nombre"}})
      }else{
        res.json({"data":{"result":false,"message":"Algo salió mal tratando de registrar su producto"}})
      }
            
    })
  }else{
    res.json({"data":{"result":false,"message":"Debe actualizar su cuenta antes realizar esta operación"}})
  }
}
async function editSKU(req,res){
  const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
  const {id,name}=req.body
  if(generals.isShopUpdated({token:req.header('Authorization').replace('Bearer ', '')})){
    const t = await model.sequelize.transaction();
    return await model.sku.findAndCountAll({attributes:['id'],where:{id,shopId:shop.id}},{transaction:t})
    .then(async function(rsFindSku){
        if(rsFindSku.count>0){
          return await model.sku.update({name},{where:{id,shopId:shop.id}},{transaction:t})
          .then(async function(rsSkus){
            await t.commit();
            res.json({"data":{"result":true,"message":"Su producto fue modificado exitosamente"}})
          }).catch(async function(error){
            console.log(error);
            await t.rollback();
            if(error.name=='SequelizeUniqueConstraintError'){
              res.json({"data":{"result":false,"message":"Usted ya posee un producto registrado con este nombre"}})
            }else{
              res.json({"data":{"result":false,"message":"Algo salió mal tratando de modificar su producto"}})
            }                
          })
        }else{
          res.json({"data":{"result":false,"message":"Este producto no está registrado en su tienda"}})  
        }
        
    }).catch(async function(error){
      res.json({"data":{"result":false,"message":"Algo salió mal validado su producto"}})
    })    
  }else{
    res.json({"data":{"result":false,"message":"Debe actualizar su cuenta antes realizar esta operación"}})
  }
}
async function mySKUlist(req,res){
  const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
  if(generals.isShopUpdated({token:req.header('Authorization').replace('Bearer ', '')})){
    
    return await model.sku.findAndCountAll({where:{shopId:shop.id}})
    .then(async function(rsSkus){    
      res.json({"data":{"result":true,"count":rsSkus.count,"sku":rsSkus['rows']}})
    }).catch(async function(error){
    
      res.json({"data":{"result":false,"message":"Algo salió mal tratando de consultando su producto"}})
    })
  }else{
    res.json({"data":{"result":false,"message":"Debe actualizar su cuenta antes realizar esta operación"}})
  }
}
async function inventoryAll(req,res){
    const{WarehouseId,skuId,note,price,type}=req.body;
    var {quantity} =req.body;    
    const dataTime= new Date();
    var msj;
    const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
    if(quantity<0){
      quantity=(quantity)*(-1);
    }
    if(type=='in'){              
        var msj="Invnetario incroporado con satisfactoriamente"      
    }
    if(type=='out'){      
      quantity=(quantity)*(-1);
      var msj="Invnetario desincorporado con satisfactoriamente"    
    }
    const t = await model.sequelize.transaction();
    //console.log(await inventoryStock(skuId,shop.id ));
    
    var stock=await inventoryStock(skuId,shop.id)
    //console.log(stock-Math.abs(quantity));
    if (parseInt(stock)-Math.abs(parseInt(quantity))<=0 && type=='out'){
      await t.rollback();  
      res.json({"data":{"result":false,"message":"La desincorporación no debe superar al stock de este producto"}})
     // res.end();
    }
    
    return await model.inventory.create({WarehouseId,skuId,note,price,type,dataTime,quantity,shopId:shop.id},{transaction:t})
    .then(async function(rsInventory){ 
      await t.commit();     
      res.json({"data":{"result":true,"message":msj}})
      console.log(await inventoryStock(skuId,shop.id ));
    }).catch(async function(error){
      console.log(error);
      await t.rollback();     
      res.json({"data":{"result":false,"message":"Algo salió mal regsitrando su inventario"}})
    })
    
}
async function inventoryStock(skuId,shopId){
  
  //return await model.inventory.sum('quantity')
  return await model.inventory.sum('quantity')
  .then(async function(rsStock){    
      return rsStock
  }).catch(async function(error){
  //  return false;
    console.log(error)
    //res.json({"data":{"result":false,"mesage":"Algo salió consultando stock"}})
  })
}
async function validateIsShopUpdate(req,res){
  try{
  
    if(generals.isShopUpdated({token:req.header('Authorization').replace('Bearer ', '')})){
      res.json({"result":true,"message":"Cuenta de usuario actualizada"})
    }else{
      res.json({"result":false,"message":"Debe actualizar su cuenta de usuario"})
    }
  }catch(error){
    res.json({"result":false,"message":"Also salio mal verificando la última actualización de su cuenta"})
  }
}
async function inventoryShopAvgProduct(req,res){
  const{sku}=req.params;

  const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));

  return await model.inventory.findAll({//.sum('quantity') 
    attributes:['id','sku',[model.Sequelize.fn('AVG', model.Sequelize.col('price')), 'avgPrice']],    
    where:{skuId:sku,shopId:shop.id,type:'in'}, group:['inventory.id','inventory.sku','AVG'], 
    include:[{
      model:model.sku,attributes:['id','name']
    }] 
    
  }).then(async function(rsInventory){
    res.json({"data":{"result":true,rsInventory}})
  }).catch(async function(error){
    console.log(error);
    res.json({"data":{"result":false,"message":"Algo salió mal calculado precio del producto"}})
  })
}
async function inventoryShopAvgGeneral(){
  
}
module.exports={configShop,getBidOne,getBidAll,addBid,addSKU,editSKU,mySKUlist,inventoryAll,inventoryStock,
                validateIsShopUpdate,inventoryShopAvgProduct}