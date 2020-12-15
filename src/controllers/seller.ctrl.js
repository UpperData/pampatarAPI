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
    const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
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
          { where:{ id:shop.id }},{transaction:t})
        .then(async function(srShop){
          return await model.People.update({  // actauliza datos personales
            birthDate, 	 
            genderId,          
            document,
            lastName,
            firstName,
            nationalityId},
            { where:{id:tokenPeopleId}},{ transaction: t })
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
attachment, // Identificadores de las fotos JSONB
title, // Titulo STRING
brandId, // marca INTEGER
longDesc, //descripcion larga TEXT
smallDesc, //descripcion corta STRING
tags, // Etiquetas de la publicación JSONB
category, // Categoria y subcategorias JSONB
materials, // Materiales de Fabricación (tabs) JSONB
StatusId, // Identificador de lapúblicación INTEGER
reasons // Motivos de la Públicación JSONB
}=req.body

// :::::::::::::: PRODUCTO ::::::::::::::
const{
      skuId,
      WarehouseId, // Identificador del almacen INTEGER
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
if(bidType, attachment, title, brandId, longDesc, smallDesc, tags, category, 
  materials, shopId, StatusId, reasons){
    if(bidType){ //PRODUCTO
      if(WarehouseId, variation, garanty, customize, include, devolution, 
        time, disponibility, weight,dimesion){

            rsBid= await model.Bids.create({bidType, photos:null,title, brandId, longDesc, smallDesc, tags, category, 
            materials, shopId, StatusId,customizable,customize, reasons,WarehouseId, variation, garanty, customize, include, devolution, 
            time, disponibility, weight,dimesion},{ transaction: t })
          .then(async function(rsResult){
              //agregar Adjuntos
              data={};//Todos los Adjuntos
              phts=[];//Fotos
              vds=attachment['videos']; //Imagenes
              for (let step = 0; step < photos['photo'].length; step++) {
                await model.attachment.create({data:photos['photo'][step].data,tags:['bid','product',title,skuId]},{ transaction: t })
                phts.push({"attachmentId":Bids.id});
              }
              data.push(phts,vds)
              await model.Bids.update({photos:data},{ transaction: t })
              .then(async function(rsResult){
                  //return rsResult;
                  await t.commit()
                  res.json({data:{"result":true,"message":"Publicación creada Satisfactoriamente, en unos minutos podrá ver su publicación activa"}})
              }).catch(async function(error){
                console.log(error)
                await t.rollback();
                res.json({data:{"result":false,"message":"Algo salido mal cargando sus imagenes, intente nuevamente"}})
              })
              //return rsResult;
          }).catch(async function(error){
            console.log(error)
            await t.rollback();
            res.json({data:{"result":false,"message":"Algo salió mal en la creación de la publicación, intente nuevamente"}})
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
  const token=req.header('Authorization').replace('Bearer ', '');
  if(!token){ res.json({"data":{"result":false,"message":"Sutoken no es valido"}})}
  const shop=await generals.getShopId(token);
  if(generals.isShopUpdated({token})){
    
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
async function extractProductInventory(red,res){
  const{WarehouseId,skuId,quantity,id}=req.body;
  const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
  
}
// :::::::::::::::::::::::::::::::::::::::::::::::::::::
// ::::SOLO INGRESO DE LOTES AL INVENTARIO :::::::::::::
// :::::::::::::::::::::::::::::::::::::::::::::::::::::
async function inventoryAll(req,res){ // AGREGAR(SOLO AGREGAR) LOTE DE PRODUCTOS AL INVENTARIO
    const{WarehouseId,skuId,note,type,inPrice,variation,id}=req.body;
    var {quantity} =req.body;
    var msj;
    const dataTime= new Date();    
    const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
    const setInv=await generals.setInvnetory(type,quantity); //Setea el valor de quantity según el tipo de operación
    //console.log(setInv);
    quantity=setInv.quantity;
    msj=setInv.msj;
    //const t = await model.sequelize.transaction();
   // var stock=await generals.inventoryStock({"skuId":skuId,"shopId":shop.id})//::: Retorna sctock actual
    const stockMinimo=await model.shopContract.findOne({attributes:['contractDesc']},{where:{shopId:shop.id}})
    if (quantity<=0 ){  
      await t.rollback();
      res.json({"data":{"result":false,"message":"La operación que desea realizar no debe superar el Stock mínimo"}})    
    }else if(type=='in' ){
      return await model.Warehouse.findAndCountAll({attributes:['id'],where:{id:WarehouseId,shopId:shop.id}},{transaction:t})
      .then(async function(rsWarehouse){
        if(rsWarehouse.count>0){
          return await model.sku.findAndCountAll({attributes:['id'],where:{id:skuId,shopId:shop.id}},{transaction:t})
          .then(async function(rsSku){
            if(rsSku.count>0){
                return await model.inventory.create({WarehouseId,skuId,note,type,dataTime,quantity,shopId:shop.id,inPrice,variation},{transaction:t})
              .then(async function(rsInventory){ 
                if(inPrice==true){
                  //ACTUALIZA TODOS LOS PRODUCTOS EL PRECIO UN PRODUCTO
                  //avgPrice=Math.round(avgPrice);
                  await model.skuPrice.create({price,skuId,shopId:shop.id},{transaction:t})
                  .then(async function(skuPrice){
                    await t.commit();
                    res.json({"data":{"result":true,"message":msj}})
                  }).catch(async function(error){
                    console.log(error);
                    res.json({"data":{"result":false,"message":"Algo salió mal intendo actualiza precio del producto"}})
                  })
                }else{
                  await t.commit();
                    res.json({"data":{"result":true,"message":msj}})
                }
              }).catch(async function(error){
                    console.log(error);
                    await t.rollback();
                    res.json({"data":{"result":false,"message":"Algo salió mal procesando su inventario"}})
                  })
            }else{
              res.json({"data":{"result":false,"message":"Producto no concuerda con la tienda"}})
            }
          })
        }else{
          res.json({"data":{"result":false,"message":"Almacén no concuerda con la tienda"}})
        }
      })
    }
}

async function validateIsShopUpdate(req,res){
  try{
    const token= req.header('Authorization').replace('Bearer ', '');
    if(!token){
        res.json({"result":false,"message":"Su token no es valido"})
    }else{
      
      if(generals.isShopUpdated({token:token})){
        // Datos de Tienda Correcto: -Dirección -Payment -
        // Datos Personales Completos
        return await model.shop.findAll({})
        .then(async function(rsshop){
          res.json({"result":true,"message":"Cuenta de usuario actualizada"})
        })
      }else{
        res.json({"result":false,"message":"Debe actualizar su cuenta de usuario"})
      }
    }
  }catch(error){
    res.json({"result":false,"message":"Also salio mal verificando la última actualización de su cuenta"})
  }
}

async function serviceAdd(req,res){
  const {name}=req.body
  const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
  if(generals.isShopUpdated({token:req.header('Authorization').replace('Bearer ', '')})){
    const t = await model.sequelize.transaction();
    return await model.service.create({name,shopId:shop.id},{transaction:t})
    .then(async function(rsServices){
      await t.commit();
      res.json({"data":{"result":true,"message":"Su servicio fue agregado exitosamente"}})
    }).catch(async function(error){
      //console.log(error);
      await t.rollback();
      if(error.name=='SequelizeUniqueConstraintError'){
        res.json({"data":{"result":false,"message":"Usted ya posee un servicio registrado con este nombre"}})
      }else{
        res.json({"data":{"result":false,"message":"Algo salió mal tratando de registrar su servicio"}})
      }
            
    })
  }else{
    res.json({"data":{"result":false,"message":"Debe actualizar su cuenta antes realizar esta operación"}})
  }
}
async function myServiceslist(req,res){
  const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
  if(generals.isShopUpdated({token:req.header('Authorization').replace('Bearer ', '')})){
    
    return await model.service.findAndCountAll({where:{shopId:shop.id}})
    .then(async function(rsService){    
      res.json({"data":{"result":true,"count":rsService.count,"sku":rsService['rows']}})
    }).catch(async function(error){
    
      res.json({"data":{"result":false,"message":"Algo salió mal tratando de consultando su servicio"}})
    })
  }else{
    res.json({"data":{"result":false,"message":"Debe actualizar su cuenta antes realizar esta operación"}})
  }
}
async function editService(req,res){
  const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
  const {id,name}=req.body
  if(generals.isShopUpdated({token:req.header('Authorization').replace('Bearer ', '')})){
    const t = await model.sequelize.transaction();
    return await model.service.findAndCountAll({attributes:['id'],where:{id,shopId:shop.id}},{transaction:t})
    .then(async function(rsFindSku){
        if(rsFindSku.count>0){
          return await model.service.update({name},{where:{id,shopId:shop.id}},{transaction:t})
          .then(async function(rsService){
            await t.commit();
            res.json({"data":{"result":true,"message":"Su Servicio fue modificado exitosamente"}})
          }).catch(async function(error){
            console.log(error);
            await t.rollback();
            if(error.name=='SequelizeUniqueConstraintError'){
              res.json({"data":{"result":false,"message":"Usted ya posee un Servicio registrado con este nombre"}})
            }else{
              res.json({"data":{"result":false,"message":"Algo salió mal tratando de modificar su Servicio"}})
            }                
          })
        }else{
          res.json({"data":{"result":false,"message":"Este Servciio no está registrado en su tienda"}})  
        }
        
    }).catch(async function(error){
      res.json({"data":{"result":false,"message":"Algo salió mal validado su Servicio"}})
    })    
  }else{
    res.json({"data":{"result":false,"message":"Debe actualizar su cuenta antes realizar esta operación"}})
  }
}
async function myServicesById(req,res){
  const{id}=req.params;
  
  const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
  //console.log("Tienda: "+shop.id);
  if(generals.isShopUpdated({token:req.header('Authorization').replace('Bearer ', '')})){
    
    return await model.service.findAndCountAll({where:{shopId:shop.id,id}})
    .then(async function(rsService){ 
      if(rsService.count>0){
        res.json(rsService)
      }else{
        res.json({"data":{"result":false,"message":"Servico no encontado"}})
      }
    }).catch(async function(error){
      console.log(error);
      res.json({"data":{"result":false,"message":"Algo salió mal tratando de consultando su servicio"}})
    })
  }else{
    res.json({"data":{"result":false,"message":"Debe actualizar su cuenta antes realizar esta operación"}})
  }
}
async function mySkuById(req,res){
  const{id}=req.params;
  
  const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
  //console.log("Tienda: "+shop.id);
  if(generals.isShopUpdated({token:req.header('Authorization').replace('Bearer ', '')})){
    
    return await model.sku.findAndCountAll({where:{shopId:shop.id,id}})
    .then(async function(rsSku){ 
      if(rsSku.count>0){
        res.json(rsSku)
      }else{
        res.json({"data":{"result":false,"message":"Producto no encontado"}})
      }
    }).catch(async function(error){
      console.log(error);
      res.json({"data":{"result":false,"message":"Algo salió mal tratando de consultando su Producto"}})
    })
  }else{
    res.json({"data":{"result":false,"message":"Debe actualizar su cuenta antes realizar esta operación"}})
  }
}
async function getProfile(req,res){
  const token= req.header('Authorization').replace('Bearer ', '');
  if(!token){res.json({"result":false,"message":"Su token no es valido"})}
  const dataToken=await generals.currentAccount(token); 
  const shop=await generals.getShopId(token);

  return await model.Account.findAll({ attributes:['email','name',],where:{id:dataToken['data']['account'].id},
    include:[{
      model:model.People,
      attributes:[
        'birthDate', 	 
        'genderId',          
        'document',
        'lastName',
        'firstName',
        'nationalityId'],        
        include:[{
          model:model.Genders,
          attributes:['name']      
        },{
          model:model.Nationalities,
          attributes:['name']      
        }
      ]
    },
    {
      model:model.shopRequest,
      attributes:['id'],      
      include:[{
        model:model.shop ,
        attributes:
          ['name',    
          'logo',
          'processId',
          'shopDescription',
          'isLocal',
          'employees',
          'partner',        
          'phone',
          'address',
          'paymentCong',
          'storeType',
          'startActivity',
          'startActivityAttachment'],
        where:{id:shop.id},
      
      }]
    }]

  })
  .then(async function(rsAccount){
    res.json({"data":{"result":true,rsAccount}});

  }).catch(async function(error){
    console.log(error);
    res.json({"data":{"resul":false,"message":"Algo salió generando perfil, intente nuevamente"}})
  })
}
async function updateLogo(req,res){
  const token= req.header('Authorization').replace('Bearer ', '');
  if(!token){res.json({"result":false,"message":"Su token no es valido"})};
  const{logo}=req.body
  const t = await model.sequelize.transaction();
  const shop=await generals.getShopId(token);
  return await model.shop.update({logo},
    { where:{ id:shop.id }},{transaction:t})
  .then(async function(rsShop){
      res.json({"data":{"result":true,"message":"Logo actualizado satisfactoriamente"}}) 
  }).catch(async function(error){
    res.json({"result":false,"message":"Algo salio mal actualizando su logo, intente nuevamente"})
  })
}
async function getLogo(req,res){
  const token= req.header('Authorization').replace('Bearer ', '');
  if(!token){
    res.json({"result":false,"message":"Su token no es valido"})
  }else{
    const shop=await generals.getShopId(token);
    return await model.shop.findOne({attributes:['logo'],where:{id:shop.id}})
    .then(async function(rsShop){
      res.json({"data":{"result":true,rsShop}}) 
    }).catch(async function(error){
      res.json({"result":false,"message":"Algo salio mal opteniendo su logo"})
    })
  };
}
async function inventoryServiceAll(req,res){
  const{serviceId,note,price,serviceTypeId,type,timetable}=req.body;
  var {quantity} =req.body;    
  const dataTime= new Date();
  var msj;
  const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
  if(quantity<0){
    quantity=(quantity)*(-1);
  }
  if(type=='in'){
      var msj="Servico incroporado con satisfactoriamente"
  }
  if(type=='out'){
    quantity=(quantity)*(-1);
    var msj="Servicio desincorporado con satisfactoriamente"
  }
  const t = await model.sequelize.transaction();
  //console.log(await inventoryStock(skuId,shop.id ));
  
  var stock=await inventoryStockService(serviceId,shop.id)
  //console.log(stock-Math.abs(quantity));
  if (parseInt(stock)-Math.abs(parseInt(quantity))<=0 && type=='out'){
    await t.rollback();  
    res.json({"data":{"result":false,"message":"La desincorporación no debe superar al stock de este producto"}})
   // res.end();
  }else{    
    return await model.service.findAndCountAll({attributes:['id'],where:{id:serviceId,shopId:shop.id}},{transaction:t})
    .then(async function(rsService){
      if(rsService.count>0){
        return await model.inventoryService.create({serviceId,note,price,serviceTypeId,type,dataTime,quantity,shopId:shop.id,timetable},{transaction:t})
        .then(async function(rsInventory){ 
            await t.commit();
            res.json({"data":{"result":true,"message":msj}})
            // console.log(await inventoryStock(skuId,shop.id ));
            }).catch(async function(error){
              console.log(error);
              await t.rollback();
              res.json({"data":{"result":false,"message":"Algo salió mal registrando su inventario de servicos"}})
            })
      }else{
        res.json({"data":{"result":false,"message":"Servicio no concuerda con la tienda"}})
      }
    })
  }
}

async function inventoryStockService(serviceId,shopId){    
  //return await model.inventory.sum('quantity')
  //const {serviceId}=req.body
  
  return await model.inventoryService.findAll({
  attributes:[ [model.sequelize.literal('SUM ((quantity))'), 'total'] ], //--> sumatoria de los productos
  where:{serviceId,shopId}})
  .then(async function(rsStock){     
      return rsStock;
  }).catch(async function(error){
    console.log(error)
    res.json({"data":{"result":false,"mesage":"Algo salió consultando stock"}})
  })
}

async function stockMonitor(req,res){
  const{productId}=req.params;  
  const token= req.header('Authorization').replace('Bearer ', '');
  if(!token){res.json({"result":false,"message":"Su token no es valido"})};   
  const shop=await generals.getShopId(token);  
  return await model.inventory.findAll({
    attributes:[ 'id','createdAt','note',[model.sequelize.fn('SUM', model.sequelize.col('quantity')), 'total']],     
    where:{skuId:productId,shopId:shop.id} ,
   
    include : [
      {
        model : model.sku,
        attributes:['name'],
        required:true
      },
      {
        model : model.Warehouse,
        attributes:['name','phone','address'],
        required:true
      },
      {
        model:model.shop,
        attributes:['id'],
        required:true,
        include:[{
          model:model.shopContract, 
          attributes:['contractDesc'],
          required:true
        }]
      }
    ],
    group : ['sku.id','Warehouse.id','inventory.price','inventory.id','shop.id','shop->shopContracts.id'],
  })
  .then(async function(rsBySku){
        res.json({"data":{"result":true,rsBySku}});
  }).catch(async function(error){
    console.log(error);
    res.json({"data":{"result":false,"message":"Algo salió mal retronado stock"}});
  })
}
async function getLoteProduct(req,res){  
  const{skuId}=req.params
  const token= req.header('Authorization').replace('Bearer ', '');
  if(!token){res.json({"result":false,"message":"Su token no es valido"})}
  else{   
    const shop=await generals.getShopId(token);
    await model.inventory.findAll({attributes:['id','createdAt','updatedAt','quantity','variation','note'], 
      where:{shopId:shop.id,type:'in',skuId},
      include:[{
        model:model.sku,
        attributes:['name']
      }]
    })
      .then(async function(rsLote){
        res.json(rsLote);
      }).catch(async function(error){
        res.json({"data":{"result":false,"message":"Algo salió mal listando lotes"}});  
      })
  }
}
async function getLoteProductById(req,res){
  const{id}=req.params;
  const token= req.header('Authorization').replace('Bearer ', '');
  if(!token){res.json({"result":false,"message":"Su token no es valido"})}
  else{
    const shop=await generals.getShopId(token);
    await model.inventory.findOne({attributes:['id','createdAt','updatedAt','quantity','variation','note'], 
          where:{id,shopId:shop.id},
          include:[{
            model:model.sku,
            attributes:['id','name'],
            required:true
          },{
            model:model.Warehouse,
            attributes:['id','name','address','phone'],
            required:true
          }]
        })
    .then(async function(rsLote){
      res.json(rsLote);
    }).catch(async function(error){
      console.log(error)
      res.json({"data":{"result":false,"message":"Algo salió mal buscando el lote"}});  
    })
  }
}
async function editLoteProduct(req,res){ // modifica lote ingresado
  const {id,quantity,warehouseId}=req.body
  
  const token= req.header('Authorization').replace('Bearer ', '');
  if(!token){
      res.json({"result":false,"message":"Su token no es valido"})
    }
  else{
    const t = await model.sequelize.transaction();		//Inicia transaccion 
    const shop=await generals.getShopId(token);
    const contract=await model.shopContract.findOne({attributes:['contractDesc']},{where:{shopId:shop.id}});
    console.log(contract);
    console.log(contract['contractDesc'].minStock);
    //calcular existencia del lote
    
    if(quantity<0 || quantity<contract['contractDesc'].minStock){
      res.json({"data":{"result":false,"message":"Cantidad de productos debe ser mayores a cero(0)"}});
    }else{
      await model.inventory.update({quantity,WarehouseId:warehouseId},{where:{id,shopId:shop.id}},{transaction:t})
      .then(async function(rsLote){
        t.commit();
        res.json({"data":{"result":true,"message":"Lote modificado satisfactoriamente"}});  
      }).catch(async function(error){
        console.log(error);
        t.rollback();
        res.json({"data":{"result":false,"message":"Algo salió mal actualizando el lote"}});  
      })
    }
  }
}
async function priceUpdateInventory(req,res){ // Actualiza registro de inventario
  const {skuId,price}=req.body
  const token= req.header('Authorization').replace('Bearer ', '');
  if(!token){res.json({"result":false,"message":"Su token no es valido"})
  }
  else{
    const shop=await generals.getShopId(token);
    await model.skuPrice.create({skuId,price,shopId:shop.id})
    .then(async function(skuPrice){
      res.json({"data":{"result":true,"message":"Precio actualizado satisfactoriamente"}})
    }).catch(async function(error){
      res.json({"data":{"result":false,"message":"Algo salió mal actualizando precio"}})
    })
  }
}
async function processPurchase(req,res){
  const{cart}=req.body
  try{

    const t = await model.sequelize.transaction();		//Inicia transaccion 
    //crear orden de compra 
    order=await model.purchaseOrder.create({AccountId,StatusId,shipping},{transaction:t}); 
    
    for (let step = 0; step < cart.length; step++) { // Recorre el carrito      
      
      const bid= await model.Bids.findOne({where:{id:cart[step].bidId}},{transaction:t});
      // DEBO USAR cart[step].varaition
      var purchase={} //Json de Compras
      switch (bid.type) {
        case 'product': // Decuenta inventario de Producto Hechos a Mano 
          await inventorySkuOut({skuId:bid.skuId,quanity:cart[step].quantity,orderId:order.id,varaition:cart[step].varaition})
          .then(async function(rsSkuOut){
            if(rsSkuOut.reuslt){
              purchase.push({"code":rsSkuOut.skuId,"description":rsSkuOut.name,"quiantity":rsSkuOut.quantity,"price":rsSkuOut.price});
            }
          }).catch(async function(error){
            t.rollback();
            res.json({"data":{"result":false,"message":"Algo salió mal procesado compra de producto hecho a mano"}})
          });          
          break;
        case 'service':
          await inventoryServiceOut(bid.inventoryId)
          .then(async function(rsServiceOut){
            if(rsServiceOut.reuslt){
              purchase.push();
            }
          }).catch(async function(error){
            t.rollback();
            res.json({"data":{"result":false,"message":"Algo salió mal procesado compra de servicio"}})
          });          
          break;
        case 'Materials':
          await inventoryMaterialsOut(bid.inventoryId)
          .then(async function(rsMaterialsOut){
            if(rsMaterialsOut.result){
              purchase.push();
            }
          }).catch(async function(error){
            t.rollback();
            res.json({"data":{"result":false,"message":"Algo salió mal procesado insumos o materiales"}})
          });
          break;
      }
    }
    t.commit();
  }catch(error){
    t.rollback();
    res.json({"data":{"result":false,"message":"Algo salió mal procesando compra"}})
  }
}

async function inventorySkuOut(req,res){ // Procesa movimientos salida del inventario (en los lotes)
  //selecciona último lote
  const{skuId,quantity,orderId,variation}=req.body;
  try{
    const token= req.header('Authorization').replace('Bearer ', '');    
    const currentAccount=await generals.currentAccount(token); //
    // seleccionar lote mas antigio  
    var thisLot = await model.inventory.findOne({attributes:['id','quantity']},{
      where:{
        skuId,
        statusId:1,
        variation:{
          [Op.contains]:[{size: variation.size}],
          [Op.contains]:[{color: variation.color}]
          }},order:[['createdAt','ASC']],
      include:[{
        model:sku,
        attributes:['id','name'],
        required:true
      }]
    })
    var lotExistence=generals.lotExistence(thisLot.id); 
    var reportOut={};
    var dif=quantity-lotExistence.quantity; // calcula la diferencia entre 
    const t = await model.sequelize.transaction();		//Inicia transaccion 
    if(quantity>lotExistence.quantity){ //si el lote actual no es suficiente
      var myOrder=0; //Contador del bucle
      while (quantity>myOrder){ //busca un lote para complementar a quantity
        lot = await model.inventory.findOne({attributes:['id','quantity']},{ //Busca lote Activo más Antiguo
          where:{
            skuId,
            StatusId:1,
            variation:{
              [Op.contains]:[{size: variation.size}],
              [Op.contains]:[{color: variation.color}]
              }
          },order:[['createdAt','ASC']],
          include:[{
            model:sku,
            attributes:['id','name'],
            required:true
          }]
        });
        lotExistence=generals.lotExistence({inventoryId:lot.id})
        if(lotExistence.quantity>0){ //Valida que se mayor que cero
          if(lotExistence.quantity>=quantity){ // valida que el lote sea mayor o igual ala diferencia            
            await model.inventoryTransaction.create({type:'out',quantity:quantity,inventoryId:lot.id,orderId,AccountId:currentAccount.id},{transaction:t}); //registra la transaction
            myOrder=myOrder+quantity; //Incrementa contador
            if(lotExistence.quantity==quantity){
              await model.inventory.update({statusId:2},{where:{id:lot.id}},{transaction:t}); //desactiva el lote actual porque se agoto
            }
          }else{
            await model.inventoryTransaction.create({type:'out',quantity:lotExistence.quantity,inventoryId:lot.id,orderId,AccountId:currentAccount},{transaction:t}); //registra la transaction
            await model.inventory.update({statusId:2},{where:{id:lot.id}},{transaction:t}); //desactiva el lote actual por que se acabó la disponiblidad
            myOrder=myOrder+lotExistence.quantity; //Incrementa contador
          }
          reportOut.push({lot:lot.id,skuId:lot['sku'].id,skuName:lot['name'],quantity}); //registra el lote del producto         
          //return myOrder;
        }else{
          await model.inventory.update({statusId:2},{where:{id:lot.id}},{transaction:t}); //desactiva el lote actual          
        }
      }
      return reportOut;
    }else if(quantity<=lotExistence.quantity){
      await model.inventoryTransaction({type:'out',quantity:lotExistence.quantity,inventoryId:thisLot.id,orderId,AccountId:currentAccount},{transaction:t}); //registra la transaction
      reportOut.push({lot:thisLot.id,skuId:lot['sku'].id,skuName:lot['name'],quantity}); //registra el lote del producto
      if(quantity==lotExistence.quantity){ // si se acabo el lote con esta orden
        await model.inventory.update({statusId:2},{where:{id:thisLot.id}},{transaction:t}); //desactiva el lote actual
      }
      return reportOut;
    }
  }catch(error){
    t.rollback();
    res.json({"data":{"result":false,"message":"Alfo salió mal procesando pedido de compra. Intente nuevamente"}})
  }
}
module.exports={
  configShop,getBidOne,getBidAll,addBid,addSKU,editSKU,mySKUlist,inventoryAll,
  validateIsShopUpdate,serviceAdd,myServiceslist,editService,myServicesById,
  mySkuById,getProfile,updateLogo,getLogo,inventoryServiceAll,inventoryStockService,
  stockMonitor,getLoteProduct,getLoteProductById,editLoteProduct,priceUpdateInventory,
  inventorySkuOut
  }