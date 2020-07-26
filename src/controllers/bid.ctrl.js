const model=require('../db/models/index');

async function add(req,res){

	const{
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
		StatusId
  	}=req.body;

    
    try{
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
		accountRoleId,
		WarehouseId,
		StatusId
	}).then(function(result){
		return result.id;
	});
    }
    catch(error){	
		console.log(error);
	res.json({
	    data:{"message":"Inserting Bid Error",  "problem":error}
	});
    }
};
async function getOne(req,res){
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
	    data:{"message":"One Bid searching error","problem":error}
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


async function edit(req,res){
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

module.exports={add,getOne,edit,getAllMine}