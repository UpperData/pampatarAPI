const model=require('../db/models/index');
const generals=require('./generals.ctrl');
const servToken = require('./serviceToken.ctrl');
const mail= require ('./mail.ctrl');

// Registra publicaciones de productos hechos a mano
async function addBid(req,res){
	const{
		skuId,
		bidType,
		title,		
		longDesc,
		smallDesc,
		disponibilityId,
		devolution,
		garanty,      
		tags,
		photos,     
		category,
		urlVideos,
		materials,
		customizable,
		include,
		weight,
		reasons,
		dimension
	  }=req.body;
	  var {brandId,time,customize}=req.body;
	  
	  token=req.header('Authorization').replace('Bearer ', '')
	  if(token){
		const shop=await generals.getShopId(token);
		var account =await generals.currentAccount(token);
		const t = await model.sequelize.transaction();	
		try{
			// agrega valores predeterminados
			if(brandId<=0){brandId=shop.id};
			if(disponibilityId==1){time="0"};
			if(customizable==false){customize='Sin personalizar'}
			switch (bidType) {
				case 1: // publicación de Servicio 				
				//:: VALIDA CAMPOS DEL SERVICIO  ::
				if(photos!=null &&  title.replace(/ /g, "").length>0 && category!=null && longDesc.replace(/ /g, "").length>0 &&
					smallDesc.replace(/ /g, "").length>0 && disponibilityId>0 && tags!=null && devolution!=null && garanty!=null &&
					materials!=null && skuId>0 ){						
					catDefault={cat1s:{"id":2,"name":"Talleres",subCat:category}};// asigna categoría pertinente
					return await generals.skuInInventoryById({bidType:'service',shopId:shop.id,skuId},{transaction:t}) // valida que el SKU este inventariado 
					.then(async function(rsSkuInStock){
						console.log(rsSkuInStock);
						if(rsSkuInStock){
							return await generals.ShopStatusGeneral({shopId:shop.id},{transaction:t}) // valida estatus de una tienda
							.then(async function (rsShopStatus){
								console.log(rsShopStatus);
								if(rsShopStatus){
									// Adjunta fotos
									var photosAttached=[];
									for (var i = 0; i < photos.length; i++){
										await model.attachment.create({data:photos[i],tags:{"shop":shop.id,skuId,"uso":"publicacion","tipoPublicaion":"servicio",category}},{transaction:t})
										.then(async function(rsAttach){
											photosAttached.push(rsAttach.id)
										}).catch(async function(error){
											t.rollback();
											console.log(error);
											res.json({"data":{"result":false,"message":"Algo salió mal adjuntando fotos, intente nuevamente"}})
										});
									}
									return await model.Bids.create({photos:photosAttached,urlVideos,title,category:catDefault,longDesc,smallDesc,disponibilityId,tags,devolution,garanty,materials,brandId,skuId,bidTypeId:bidType,shopId:shop.id,StatusId:1},{transaction:t})
									.then(async function(rsBid){
										type="shopRequestsView";
										account['data']['shop'].bidId=rsBid;
										hash=await servToken.newToken(account['data']['account'],{"id":5,"name":"Vendedor"},account['data']['shop'],account['data']['people'],type) //generar Token 
										var link=process.env.HOST_FRONT+"viewPublished/"+hash; // crea link Para ver Postulación
										var link2=process.env.HOST_FRONT+"viewPublished/"+hash; // crea link Para ver Postulación
										var mailsendShoper= mail.sendEmail({
										"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', 
										"to":account['data']['account'].email,
										"subject": 'Nueva Publicación Pampatar',
										"html": `<!doctype html>
										<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
										<hr style="width: 420; height: 1; background-color:#99999A;">
										<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
									
										<div  align="center">
											<h2 style="font-family:sans-serif; color:#ff4338;" >¡Nueva Publicación de Servicio!</h2>
											<p style="font-family:sans-serif; font-size: 19px;" >La publicaicón <b>`+ title +`</b> esta pendiente por aprobación</p>
										
										<a href="`+link+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Vista Previa"></a>
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
				
										var mailsendAdmin= mail.sendEmail({
										"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', 
										"to":process.env.EMAIL_ADMIN_SYS,
										"subject": '.:Nueva Publicación:.',
										"html": `<!doctype html>
										<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
										<hr style="width: 420; height: 1; background-color:#99999A;">
										<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
									
										<div  align="center" style="display: block">
											<h2 style="font-family:sans-serif; color:#ff4338;" >¡Nueva Publicación de Servicio!</h2>
											<p style="font-family:sans-serif; font-size: 19px;" > ` + account['data']['shop'].name + `  ha solicitado crear una nueva publicación de Servico en Pampatar</p>
										
											<a href="`+ link2 +`">`+ title + `</a> 
											</br>
											<a href="bk.pampatar.cl/Published/procESS/"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Procesar Solicitud"></a>
										</div>
										<br>						
											<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
											<br>
											<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
												<p align="center">	
													<a href="https://www.pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://www.pampatar.cl/legal/">Políticas de privacidad</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Términos y condiciones</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
												</p>					
										
												<p  align="center" >
												info@estudiopampatar.cl
														Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
												</p>
											</div>`
										},{ transaction: t })
										if(mailsendAdmin && mailsendShoper)	{
											await t.commit();
											res.json({"data":{"result":true,"message":"Nueva públicaión de Servico creada satisfactorimente"}})										
										}else{
											await t.rollback()
											res.json({"data":{"result":false,"message":"Algo salió mal tratando de enviar Correo Electrónico"}})										
										}

									}).catch(async function (error){
										t.rollback();
										if(error.name=='SequelizeUniqueConstraintError'){
											res.json({"data":{"result":false,"message":"Existe una publicación con este título "}})
										}else if(error.name=="SequelizeValidationError"){
											res.json({ "data":{"result":false,"message":"Verifique valores del formulario"}	});												
										}else{
											console.log(error);
											res.json({"data":{"result":false,"message":"Algo salió mal creando publicación, intente nuevamente"}})
										}
									})
								}else{
									t.rollback();
									return {"data":{"result":false,"message":"Su tienda esta inactiva"}}
								}
							}).catch(async function (error){
								console.log(error);
								t.rollback();
								res.json({"data":{"result":false,"message":"Algo salió mal validando estatus de su tienda"}})
							})
						}else{
							t.rollback();
							return {"data":{"result":false,"message":"Actualemente sin invetario disponible"}}
						}
						
					}).catch(async function (error){
						t.rollback();
						console.log(error);
						res.json({"data":{"result":false,"message":"Algo salió mal validando estatus del producto"}})
					})
				}else{
					res.json({"data":{"result":false,"message":"Faltan valores en el formulario"}})
				}
				break;
				case 2: // publicación de Producto Hechos a Mano
					console.log(bidType + " skuId: " +skuId+ " creando publicación de Producto Hecho a Mano ");
					//:: VALIDA CAMPOS DEL PRODUCTO HECHO A MANO  ::
					if(photos!=null &&  title.replace(/ /g, "").length>0 && category!=null && longDesc.replace(/ /g, "").length>200 &&
						smallDesc.replace(/ /g, "").length>20 && disponibilityId>0 && tags!=null && devolution!=null && garanty!=null &&
						materials!=null && skuId>0  && time!=null && weight!=null && include!=null && customizable!=null 
						&& customize!=null && reasons!=null && dimension!=null){
						catDefault={cat1s:{"id":1,"name":"Hecho a mano",subCat:category}};// asigna categoría pertinente
						return await generals.skuInInventoryById({bidType:'prodcut',shopId:shop.id,skuId},{transaction:t}) // valida que el SKU este inventariado 
						.then(async function(rsSkuInStock){
							//console.log(rsSkuInStock);
							if(rsSkuInStock){
								return await generals.ShopStatusGeneral({shopId:shop.id},{transaction:t}) // valida estatus de una tienda
								.then(async function (rsShopStatus){
									//console.log(rsShopStatus);
									if(rsShopStatus){
										// Adjunta fotos
										var photosAttached=[];
										for (var i = 0; i < photos.length; i++){
											await model.attachment.create({data:photos[i],tags:{"shop":shop.id,skuId,"uso":"publicacion","tipoPublicaion":"PHM",category,reasons}},{transaction:t})
											.then(async function(rsAttach){
												photosAttached.push(rsAttach.id)
											}).catch(async function(error){
												t.rollback();
												console.log(error);
												res.json({"data":{"result":false,"message":"Algo salió mal adjuntando fotos, intente nuevamente"}})
											});
										}
										return await model.Bids.create({photos:photosAttached,urlVideos,title,category:catDefault,longDesc,smallDesc,disponibilityId,
												tags,devolution,garanty,materials,brandId,skuId,bidTypeId:bidType,shopId:shop.id,time,weight,dimension,reasons,customizable,
												customize,StatusId:1},{transaction:t})
										.then(async function(rsBid){
											
											type="shopRequestsView";
											account['data']['shop'].bidId=rsBid;
											hash=await servToken.newToken(account['data']['account'],{"id":5,"name":"Vendedor"},account['data']['shop'],account['data']['people'],type) //generar Token 
											var link=process.env.HOST_FRONT+"viewPublished/"+hash; // crea link Para ver Postulación
											var link2=process.env.HOST_FRONT+"viewPublished/"+hash; // crea link Para ver Postulación
											var mailsendShoper= mail.sendEmail({
											"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', 
											"to":account['data']['account'].email,
											"subject": 'Nueva Publicación Pampatar',																	
											"html": `<!doctype html>
											<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
											<hr style="width: 420; height: 1; background-color:#99999A;">
											<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
										
											<div  align="center">
												<h2 style="font-family:sans-serif; color:#ff4338;" >¡Nueva Publicación de Producto Hecho a Mano!</h2>
												<p style="font-family:sans-serif; font-size: 19px;" >La publicaicón <b>`+ title +`</b> esta pendiente por aprobación</p>
											
											<a href="`+link+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Vista Previa"></a>
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
					
											var mailsendAdmin= mail.sendEmail({
											"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', 
											"to":process.env.EMAIL_ADMIN_SYS,
											"subject": '.Nueva Publicación Pampatar',
											"text":"Hay un nuevo Publicación",							
											"html": `<!doctype html>
											<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
											<hr style="width: 420; height: 1; background-color:#99999A;">
											<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
										
											<div  align="center" style="display: block">
												<h2 style="font-family:sans-serif; color:#ff4338;" >¡Nueva Publicación de Producto Hecho a Mano!</h2>
												<p style="font-family:sans-serif; font-size: 19px;" > ` + account['data']['shop'].name + `  ha solicitado crear una nueva publicación en Pampatar</p>
											
												<a href="`+ link2 +`">`+ title + `</a> 
												</br>
												<a href="bk.pampatar.cl/Published/procESS/"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Procesar Solicitud"></a>
											</div>
											<br>						
												<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
												<br>
												<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
													<p align="center">	
														<a href="https://www.pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://www.pampatar.cl/legal/">Políticas de privacidad</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Términos y condiciones</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
													</p>					
											
													<p  align="center" >
													info@estudiopampatar.cl
															Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
													</p>
												</div>`
											},{ transaction: t })
											if(mailsendAdmin && mailsendShoper)	{
												await t.commit();
												res.json({"data":{"result":true,"message":"Nueva públicaión de Producto Hecho a Mano creada satisfactorimente"}})										
											}else{
												await t.rollback()
												res.json({"data":{"result":false,"message":"Algo salió mal tratando de enviar Correo Electrónico"}})										
											}
	
										}).catch(async function (error){
											t.rollback();
											if(error.name=='SequelizeUniqueConstraintError'){
												res.json({"data":{"result":false,"message":"Existe una publicación con este título "}})
											}else if(error.name=="SequelizeValidationError"){
												res.json({ "data":{"result":false,"message":"Verifique valores del formulario"}	});												
											}else{
												console.log(error);
												res.json({"data":{"result":false,"message":"Algo salió mal creando publicación, intente nuevamente"}})
											}
										})
									}else{
										t.rollback();
										return {"data":{"result":false,"message":"Su tienda esta inactiva"}}
									}
								}).catch(async function (error){
									console.log(error);
									t.rollback();
									res.json({"data":{"result":false,"message":"Algo salió mal validando estatus de su tienda"}})
								})
							}else{
								t.rollback();
								return {"data":{"result":false,"message":"Product / servicio sin invetario disponible"}}
							}
							
						}).catch(async function (error){
							t.rollback();
							console.log(error);
							res.json({"data":{"result":false,"message":"Algo salió mal validando estatus del producto"}})
						})
					}else{
						t.rollback();
						res.json({"data":{"result":false,"message":"Faltan valores en el formulario Producto"}})
					}
				break;
				case 3: // publicación de Materiales / Suministros					
					//:: VALIDA CAMPOS DE MATERIALES Y SUMINISTROS  ::
					if(photos!=null &&  title.replace(/ /g, "").length>0 && category!=null && longDesc.replace(/ /g, "").length>0 &&
					smallDesc.replace(/ /g, "").length>0 && disponibilityId>0 && tags!=null && devolution!=null && garanty!=null &&
					materials!=null && skuId>0 && category!=null && weight!=null && include!=null && dimension!=null){						
					catDefault={cat1s:{"id":4,"name":"Materiales",subCat:category}};// asigna categoría pertinente
					return await generals.skuInInventoryById({bidType:'prodcut',shopId:shop.id,skuId},{transaction:t}) // valida que el SKU este inventariado 
						.then(async function(rsSkuInStock){
							//console.log(rsSkuInStock);
							if(rsSkuInStock){
								return await generals.ShopStatusGeneral({shopId:shop.id},{transaction:t}) // valida estatus de una tienda
								.then(async function (rsShopStatus){
									//console.log(rsShopStatus);
									if(rsShopStatus){
										// Adjunta fotos
										var photosAttached=[];
										for (var i = 0; i < photos.length; i++){
											await model.attachment.create({data:photos[i],tags:{"shop":shop.id,skuId,"uso":"publicacion","tipoPublicaion":"PHM",category}},{transaction:t})
											.then(async function(rsAttach){
												photosAttached.push(rsAttach.id)
											}).catch(async function(error){
												t.rollback();
												console.log(error);
												res.json({"data":{"result":false,"message":"Algo salió mal adjuntando fotos, intente nuevamente"}})
											});
										}
										return await model.Bids.create({photos:photosAttached,urlVideos,title,category:catDefault,longDesc,smallDesc,disponibilityId,
												tags,devolution,garanty,materials,brandId,skuId,bidTypeId:bidType,shopId:shop.id,time,weight,dimension,reasons,customizable,
												customize,StatusId:1},{transaction:t})
										.then(async function(rsBid){
											
											type="shopRequestsView";
											account['data']['shop'].bidId=rsBid;
											hash=await servToken.newToken(account['data']['account'],{"id":5,"name":"Vendedor"},account['data']['shop'],account['data']['people'],type) //generar Token 
											var link=process.env.HOST_FRONT+"viewPublished/"+hash; // crea link Para ver Postulación
											var link2=process.env.HOST_FRONT+"viewPublished/"+hash; // crea link Para ver Postulación
											var mailsendShoper= mail.sendEmail({
											"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', 
											"to":account['data']['account'].email,
											"subject": 'Nueva Publicación Pampatar',																	
											"html": `<!doctype html>
											<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
											<hr style="width: 420; height: 1; background-color:#99999A;">
											<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
										
											<div  align="center">
												<h2 style="font-family:sans-serif; color:#ff4338;" >¡Nueva Publicación de Material / Suministro! </h2>
												<p style="font-family:sans-serif; font-size: 19px;" >La publicaicón <b>`+ title +`</b> esta pendiente por aprobación</p>
											
											<a href="`+link+`"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Vista Previa"></a>
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
					
											var mailsendAdmin= mail.sendEmail({
											"from":'"Pampatar" <'+process.env.EMAIL_ADMIN+'>', 
											"to":process.env.EMAIL_ADMIN_SYS,
											"subject": 'Nueva Publicación Pampatar',
											"text":"Hay un nuevo Publicación",							
											"html": `<!doctype html>
											<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar.png" alt="Logo Pampatar.cl" width="250" height="97" style="display:block; margin-left:auto; margin-right:auto; margin-top: 25px; margin-bottom:25px"> 
											<hr style="width: 420; height: 1; background-color:#99999A;">
											<link rel="stylesheet" href="http://192.99.250.22/pampatar/assets/bootstrap-4.5.0-dist/css/bootstrap.min.css">
										
											<div  align="center" style="display: block">
												<h2 style="font-family:sans-serif; color:#ff4338;" >¡Nueva Publicación de Material / Suministro!</h2>
												<p style="font-family:sans-serif; font-size: 19px;" > ` + account['data']['shop'].name + `  ha solicitado crear una nueva publicación en Pampatar</p>
											
												<a href="`+ link2 +`">`+ title + `</a> 
												</br>
												<a href="bk.pampatar.cl/Published/procESS/"><input class="btn btn-primary btn-lg" style="font-size:16px; background-color: #ff4338;  border-radius: 10px 10px 10px 10px; color: white;" type="button" value="Procesar Solicitud"></a>
											</div>
											<br>						
												<img src="http://192.99.250.22/pampatar/assets/images/logo-pampatar-sin-avion.png" alt="Logo Pampatar.cl" width="120" height="58" style="display:block; margin-left:auto; margin-right:auto; margin-top: auto; margin-bottom:auto">
												<br>
												<div  style="margin-left:auto;font-family:sans-serif; margin-right:auto; margin-top:15px; font-size: 11px;">
													<p align="center">	
														<a href="https://www.pampatar.cl/quienes-somos/">Quiénes somos</a> | <a href="https://www.pampatar.cl/legal/">Políticas de privacidad</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Términos y condiciones</a> | <a href="https://www.pampatar.cl/preguntas-frecuentes/">Preguntas frecuentes</a> 
													</p>					
											
													<p  align="center" >
													info@estudiopampatar.cl
															Santiago de Chile, Rinconada el salto N°925, Huechuraba +56 9 6831972
													</p>
												</div>`
											},{ transaction: t })
											if(mailsendAdmin && mailsendShoper)	{
												await t.commit();
												res.json({"data":{"result":true,"message":"Nueva Publicación de Material / Suministro creada satisfactorimente"}})										
											}else{
												await t.rollback()
												res.json({"data":{"result":false,"message":"Algo salió mal tratando de enviar Correo Electrónico"}})										
											}
	
										}).catch(async function (error){
											t.rollback();
											
											if(error.name=='SequelizeUniqueConstraintError'){
												res.json({"data":{"result":false,"message":"Existe una publicación con este título "}})
											}else if(error.name=="SequelizeValidationError"){
												res.json({ "data":{"result":false,"message":"Verifique valores del formulario"}	});												
											}else{
												console.log(error);
												res.json({"data":{"result":false,"message":"Algo salió mal creando publicación, intente nuevamente"}})
											}
										})
									}else{
										t.rollback();
										return {"data":{"result":false,"message":"Su tienda esta inactiva"}}
									}
								}).catch(async function (error){
									console.log(error);
									t.rollback();
									res.json({"data":{"result":false,"message":"Algo salió mal validando estatus de su tienda"}})
								})
							}else{
								t.rollback();
								return {"data":{"result":false,"message":"Product / servicio sin invetario disponible"}}
							}
							
						}).catch(async function (error){
							t.rollback();
							console.log(error);
							res.json({"data":{"result":false,"message":"Algo salió mal validando estatus del producto"}})
						})
				}else{
					t.rollback();
					res.json({"data":{"result":false,"message":"Faltan valores en el formulario Producto"}})
				}
				break;  
			}
		}
		catch(error){	
			console.log(error);
			t.rollback();
			if(error.name="SequelizeValidationError"){
				res.json({ "data":{"result":false,"message":"Verifique valores del formulario"}	});
			}else{
				res.json({ "data":{"result":false,"message":"Algo salió mal procesando solicitud de publicación, intenta nuevamente"}	});
			}
			
		}
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
			disponibilityId,
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
	
    const {bidType,title,brandId,longDesc,smallDesc,disponibilityId,time,
			devolution,include,customize,garanty,tags,photos,category,variation,accountRoleId,
			WarehouseId,StatusId}=req.body;
    try{
		return await model.Bids.update({bidType,title,brandId,longDesc,smallDesc,disponibilityId,time,
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