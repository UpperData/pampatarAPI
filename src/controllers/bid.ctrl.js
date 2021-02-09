const model=require('../db/models/index');
const generals=require('./generals.ctrl')

// Registra publicaciones de productos hechos a mano
async function addBid(req,res){
	const{
		skuId,
		bidType,
		title,
		brandId,
		longDesc,
		smallDesc,
		disponibility,
		time,
		devolution,  
		include,
		customize,
		customizable,
		garanty,      
		tags,
		photos,     
		category,
		urlVideos
  	}=req.body;
	const shop=await generals.getShopId(req.header('Authorization').replace('Bearer ', ''));
	
	const t = await model.sequelize.transaction();
	

    try{
		switch (bidType) {
			case '1': // publicacióm de Producto Hechos a Mano 				
			  await model.Bids.create({})
			  .then(async function(rsBidPhm){
				
			  }).catch(async function(error){
				t.rollback();
				res.json({"data":{"result":false,"message":"Algo salió mal publicando producto hecho a mano, intente nuevamente"}})
			  });          
			  break;
			case '1': // publicacióm de Producto Hechos a Mano 
			  
			  await model.Bids.create({})
			  .then(async function(rsBidPhm){
				
			  }).catch(async function(error){
				t.rollback();
				res.json({"data":{"result":false,"message":"Algo salió mal publicando producto hecho a mano, intente nuevamente"}})
			  });          
			  break;
		}
		return await model.Bids.findAndConutAll({where:{title,shopId:shop.id}},{transaction:t})
		.then(async function(rsFindBid){
			if(rsFindBid.count==0){ //si no existe una publicación con el mismo titulo
				return await model.Bids.create({
					bidType,
					title,
					brandId,
					longDesc,
					smallDesc,
					disponibility,
					time,
					devolution,  
					include,
					customize,
					garanty,      
					tags,
					photos,     
					category,
					variation,
					shopId:shop.id,
					WarehouseId,
					StatusId:2
				}).then(function(result){
					return result.id;
				}).catch(async function(error){
					t.rollback();
					res.json({ "data":{"result":false,"message":"Ocurrió un error creando publicación, Itenten nuevamente"}	});					
				})
			}else{
				res.json({ "data":{"result":false,"message":"Ya posee una públicación con el mismo titulo, Itenten con otro titulo"}	});					
			}			
		})		
    }
    catch(error){	
		console.log(error);
		t.rollback();
		res.json({ "data":{"result":false,"message":"Ocurrió un error creando publicación"}	});
    }
};
async function getOneBid(req,res){
    const {id}=req.params;
    try{
	return await model.Bids.findOne({
	    where:{id,StatusId:1}
	}).then (function(rsBid){
		res.status(200).json(rsBid)
		//var obj=JSON.parse(rsBid.tags);
		console.log(rsBid.tags);
        //return rsBid;        
    })
    }
    catch(error){	
		console.log(error);
	res.json({
	    "data":{"result":false,"message":"One Bid searching error","problem":error}
	})
    };
};
async function getAllMine(req,res){
    try{		
	return await model.Bid.findAll({

		attributes:[	
			id,
			bidType,
			title,
			brandId,
			longDesc,
			smallDesc,
			disponibility,
			time,
			devolution,  
			include,
			customize,
			garanty,      
			tags,
			photos,     
			category,
			variation,
			accountRoleId,
			WarehouseId,
			StatusId],
		where: {
			accountRoleId: 4, // Sesion actual
			StatusId:1
		 }
	}).then(function(rsPeople){return rsPeople})
    }
    catch(error){
	console.log(error);
	res.json({
	    data:{"message":"List bids searching error", "problem":error}
	});
    }
};


async function editBid(req,res){
	const{id}=req.params;
	
    const {bidType,title,brandId,longDesc,smallDesc,disponibility,time,
			devolution,include,customize,garanty,tags,photos,category,variation,accountRoleId,
			WarehouseId,StatusId}=req.body;
    try{
	
		return await model.Bids.update({bidType,title,brandId,longDesc,smallDesc,disponibility,time,
			devolution,include,customize,garanty,tags,photos,category,variation,accountRoleId,
			WarehouseId,StatusId}, 
			{
				where: {
					id
				}
			}
		).then(function(result){
				res.status(200).json({"result":true});
				return result;				
			});
		

    }
    catch(error){
		console.log(error);
	    res.status(500).json({"data":{"mesage": "Someting goes wrong editting Bid"}
	})
    }

}

module.exports={addBid,getOneBid,editBid,getAllMine}