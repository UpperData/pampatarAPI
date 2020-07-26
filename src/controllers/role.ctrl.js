const model=require(__dirname + '/../db/models/index');

async function add(req,res){
    try{
	const{name,statusId}=req.body;
	return await model.Roles.create({name,statusId})
	.then(function(rsResult){
	   res.status(200).json(rsResult);
	    return rsResult.id;
	})
    }catch(error){
	console.log(error);
	res.status(404).json({data:{message:'Error inserting role','problem':error}});
    }
}
async function getOne(req,res){
    try{
	const{id}=req.params;
	return await model.Roles.findOne({where: {id}})
	    .then(function (rsRoles){return rsRoles})
    }catch(error){
	res.status(404).json({data:{"message":"Error Buscando un Role","problem":error}})
    }
}
async function getAll(req,res){
    try{
	return await model.Roles.findAll({
	    attributes:['id','name','statusId']
	}).then(function(rsRoles){
	  	 res.status(200).json(rsRoles);
		return rsRoles})
    }catch(error){
	res.status(404).json({data:{"message":"Error Buscando Todos Role","problem":error}})
    }
}
async function edit(req,res){

    try{
	const {name,statusId}=req.body;
	return await getOne(req,res)
	    .then(async function(srRoles){
		if(rsRoles){
		    await rsRoles.update({name,statusId});
		}
		else{
		    {res.json({data:{"message":"Rol no existe"}})}
		}
	    })
    }catch(error){
	res.status(404).json({data:{"message":"Error editando Role","problem":error}})

    }
}

module.exports={add,getOne,getAll,edit};
