'use strict';

module.exports = (sequelize, DataTypes) => {
  const Account = sequelize.define('Account', {
    name:{
		type:DataTypes.STRING,
		allowNull:true,
		unique:true,
		validate:{
			len:[6,12],
			notEmpty:true
		}
    } ,
    pass:{
		type:DataTypes.STRING,
		allowNull:false,
		validate:{
			len:[6,200],
			notEmpty:true
		}
    },
    email:{
		type:DataTypes.STRING,
		allowNull:false,
		validate:{
		isEmail:true
		}
    },
    peopleId:{
		type:DataTypes.INTEGER,
		allowNull:true,
		references:{
			model:{tableName:'People',shema:'public'},key:'id'
		}
	},
	preference: {
        type: DataTypes.JSONB
    },
    statusId:{
		type:DataTypes.INTEGER,
		allowNull:false,
		defaultValue:1,
		references:{
			model:{tableName:'Status',shema:'public'},key:'id'
		}
    },
    confirmStatus:{
		type:DataTypes.BOOLEAN,
		allowNull:true,
		defaultValue:false
	},
	hashConfirm:{
		type:DataTypes.TEXT,
		allowNull:true
	}

  }, {});
  Account.associate = function(models) {
    // associations can be defined here	
    Account.belongsTo(models.People,{foreignKey:'peopleId'});
	Account.belongsTo(models.Status,{foreignKey:'statusId'});
	Account.hasMany(models.accountRoles);	
	Account.hasMany(models.shopRequest);

  };
  return Account;
};
