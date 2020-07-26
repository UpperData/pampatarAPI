'use strict';
module.exports = (sequelize, DataTypes) => {
  const People = sequelize.define('People', {
    firstName:{
		type:DataTypes.STRING,
		allowNull:false,
		validate:{
			len:[1,120],	    
			notEmpty: true
		}
    },
    lastName:{
		type:DataTypes.STRING,
		allowNull:false,
		validate:{
			len:[1,120],	    
			notEmpty: true
		}
    },documentType:{
		type:DataTypes.STRING,
		allowNull:true,
		validate:{			
			isIn: ["1","2","3"],// 1=RUT, 2=pasaporte, 3=DNI
			notEmpty: true
		}
	},
    documentId:{
		type:DataTypes.STRING,
		unique:true,
		allowNull:false,
		validate:{
			len:[1,60],
			notEmpty: true
		}
    },
    genderId: {
		type:DataTypes.INTEGER,
		allowNull:false,
		references:{
			model:{tableName:'Genders',schema:'public'},key:'id'
		}
    },
    nationalityId: {
		type:DataTypes.INTEGER,
		allowNull:false,
		references:{
			model:{tableName:'Nationalities',schema:'public'},key:'id'
		}
    },
    birthDate:{
		type:DataTypes.DATE,
		allowNull:false,
		validate:{
			isDate: true,
			isBefore:["2003-01-01"]
		}
    },
    statusId:{
		type:DataTypes.INTEGER,
		allowNull:false,
		defaultValue:1,
		references:{
			model:{tableName:'Status',schema:'public'},key:'id'
		}
    },
  }, {freezeTableName:true, modelName:'singularName'});
  People.associate = function(models) {
    // associations can be defined here
	People.hasMany(models.Account,{ foreignKey:'peopleId', sourceKey:'id', as:'account',});
	People.belongsTo(models.Gender,{foreignKey:'genderId', as:'gender'});
	People.belongsTo(models.Nationalities,{foreignKey:'nationalityId', as:'nationality'});
  };
  return People;
};
