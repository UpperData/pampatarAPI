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
    },
    document:{
		type:DataTypes.JSONB
    },
    genderId: {
		type:DataTypes.INTEGER,
		allowNull:false
    },
    nationalityId: {
		type:DataTypes.INTEGER,
		allowNull:false
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
	People.belongsTo(models.Genders,{foreignKey:'genderId'});
	People.belongsTo(models.Nationalities,{foreignKey:'nationalityId'});
  };
  return People;
};
