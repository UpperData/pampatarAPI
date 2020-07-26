const db=require('../db/models/index');
//const People =require('../../db/models/people.mdl');

async function add(data,res){
    const{firstName,lastName,documentId,genderId,nationalityId,birthDate,statusId}=data;
    try{
	return await db.People.create({
	    firstName,lastName,documentId,genderId,nationalityId,birthDate,statusId
	}).then(function(result){
		return result.id;
	});
    }
    catch(error){
	console.log(error);
	console.log('Error creando persona');
	res.json({
	    data:{"message":"Inserting Pople Error",  "problem":error}
	});
    }
};

async function getAll(data,res){
    try{
	return await db.People.findAll({
	    attributes:['id','firstName','lastName','documentId','genderId','nationalityId','birthDate']
	}).then(function(rsPeople){return rsPeople})
    }
    catch(error){
	console.log(error);
	res.json({
	    data:{"message":"List People searching error", "problem":error}
	});
    }
};

async function getOne(req,res){
    const {id}=req.params;
    try{
	return await db.People.findOne({
	    where:{id}
	}).then (function(rsPeople){return rsPeople})
    }
    catch(error){
	console.log(error);
	res.json({
	    data:{"message":"One People searching error","problem":error}
	})
    };
};

async function edit(req,res){
//    const {id}=req.params;
    const{firstName,lastName,documentId,genderId,nationalityId,birthDate}=req.body;

    try{
	return await getOne(req,res)
	.then(async function (rsPeople){
	    if(rsPeople){ // Check if record exists in DB
		await rsPeople.update({firstName,lastName,documentId,genderId,nationalityId,birthDate})
		.then(function(result){return result})
	    }
	    else{
		console.log('People not exists')
		res.json({
		    data:{"message":"People not exits","problem":"People with Id"+ id +"not record"}
		})
	    }
	})
    }
    catch(error){
	console.log(error);
	res.json({
	    data:{"message":"Updating  People error","problem":error}
	})
    };

};

module.exports={add,getAll,getOne,edit};
