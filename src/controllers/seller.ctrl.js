const model=require('../db/models/index');
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
    console.log(req.body);
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
    console.log("empezo de Validar JSON")
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
                res.json({data:{"result":True,"message":"Perfil Actualizado Satisfactoriamente"}});                
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
      res.json({data:{"result":false,"message":"El formulario no cumple con los validaciones necesario"}})
    } 
}
async function getShopId(token){

  const dataToken=await generals.currentAccount(token);  
  var theShop;
  try{
  // Valida que tenga permiso de vendedor
  const isAutorized= dataToken['data']['role'].find(function(e) {
    if( e.id == 5){
      return true    
    }else{
      return false
      //res.json({data:{"result":false,"message":"Usario sin autorización para publicar productos"}}) 
    }
  })
  if(isAutorized){
    theShop = await model.Account.findAll({where:{id:dataToken['data']['account'].id, statusId:1,confirmStatus:true},
      include: [{
        model: model.shopRequest,  
        where: { status: { id: 3 } } , // POSTULACIÓN APROBADA     
          include:[{
            model: model.shop,
            where: { statusId:1 }  // TIENDA ACTIVA 
          }]    
      }]
    })      
    return  theShop[0]['shopRequests'][0]['shop'].id
  }
  }
  catch(error){
    res.json({data:{"result":false, "message":"No fue posible identificar si tienda, consulte su estatus con el administrador del sistema"}})
  }
}
async function getBidOne(req,res){ // BUSCA UNA PUBLICACIÓN DE LA TIENDA  
  const {id}=req.params   
    return await model.Bids.findOne({where:{id,shopId:await getShopId(req.header('Authorization').replace('Bearer ', ''))}})
    .then(async function(rsBid){
      res.json({data:{rsBid}})
    }).catch(async function(error){
      console.log(error)
      res.json({data:{"result":false,"message":"Error buscando SKU"}})
    });  
}
async function getBidAll(req,res){
      return await model.Bids.findAndCountAll({where:{shopId:await getShopId(req.header('Authorization').replace('Bearer ', ''))}})
      .then(async function(rsBid){
        res.json({data:{rsBid}})
      }).catch(async function(error){
        console.log(error)
        res.json({data:{"result":false,"message":"Ocurrio un error retornando publicaciones"}})
      });  
}
async function addBid(req,res){
  const dataToken=generals.currentAccount(req.header('Authorization').replace('Bearer ', '')) 
  const Account =dataToken['data']['account'];
// :::::::::::::: COMUNES ::::::::::::::
const shopId=await getShopId(req.header('Authorization').replace('Bearer ', ''))
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
    if(bidType==1){ //PRODUCTO
      if(WarehouseId, variation, garanty, customize, include, devolution, 
        time, disponibility, weight,dimesion){

          return await model.Bids.create(bidType, photos,title, brandId, longDesc, smallDesc, tags, category, 
            materials, shopId, StatusId, reasons,WarehouseId, variation, garanty, customize, include, devolution, 
            time, disponibility, weight,dimesion,{ transaction: t })
          .then(async function(rsBid){
            mail.sendEmail({"from":"Pampatar",
            "to":Account.email,
            "subject": '.:Nueva Postulación:.',
            "text":"Haz creado una nueva postulación",
            "html":"<h2>¡Enhorabuena!</h2> <br> <h4> tu postulación ->"+title + "<- esta en evaluación. Te informaremos cuando sea procesada <br> <a href='#'>Ver Detalles</a>  </h4>"
            },{ transaction: t })	

            mail.sendEmail({"from":"PUBLICACIÓN DE PRODUCTO",
            "to":'angel.elcampeon@gmail.com',
            "subject": '.:Nueva Postulación:.',
            "text":"Hay un nuevo postulado",
            "html":"<h2>¡Enhorabuena!</h2> <br> <h4>"+firstName +" "+ lastName + "se a creado una Publicación en Pampatar. <br> <a href='#'>Ver Detalles</a>  </h4>"
            },{ transaction: t })	
          }).catch(async function(error){
            await t.rollback();
            res.json({data:{"result":false,"message":"Ocurrió un error en la creación de la publicación, intente nuevamente"}})
          })

        }else{
          await t.rollback();
          res.json({data:{"result":false,"message":"Debe ingresa todos los valores para el registro del producto"}})
        }
    }else if(bidType==1){ //TALLER / SERVICIO
        if(schedule){ //validar formato JSON

          return await model.Bids.create(bidType, photos,title, brandId, longDesc, smallDesc, tags, category, 
            materials, shopId, StatusId, reasons,schedule,{ transaction: t }) // REGISTRAR TALLER
            .then(async function(rsBid){
              mail.sendEmail({"from":"Pampatar",
              "to":Account.email,
              "subject": '.:Nueva Postulación:.',
              "text":"Haz creado una nueva postulación",
              "html":"<h2>¡Enhorabuena!</h2> <br> <h4> tu postulación ->"+title + "<- esta en evaluación. Te informaremos cuando sea procesada <br> <a href='#'>Ver Detalles</a>  </h4>"
              },{ transaction: t })	
              res.json({data:{"result":false,"message":"Publicación regsitrada con exito"}})
              mail.sendEmail({"from":"PUBLICACIÓN DE TALLER",
              "to":'angel.elcampeon@gmail.com',
              "subject": '.:Nueva Postulación:.',
              "text":"Hay un nuevo postulado",
              "html":"<h2>¡Enhorabuena!</h2> <br> <h4>"+firstName +" "+ lastName + "se a creado una Publicación de Servicio en Pampatar. <br> <a href='#'>Ver Detalles</a>  </h4>"
              },{ transaction: t })	
            }).catch(async function(error){
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
}else{
  await t.rollback();
  res.json({data:{"result":false,"message":"Debe ingresar los valores requerido"}})
} 



}
module.exports={getShop,configShop,getBidOne,getBidAll,addBid}