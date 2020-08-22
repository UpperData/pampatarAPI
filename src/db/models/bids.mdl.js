'use strict';
module.exports = (sequelize, DataTypes) => {
  const Bids = sequelize.define('Bids', {

    bidType:{
        type:DataTypes.INTEGER,
        allowNull:false,
        validate:{
            isIn:["1","2"] // 1=servicio 2=producto
        }
    },
    title: {
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[10,200],
        notEmpty:true        
      }
    },
    brandId:{
      type:DataTypes.INTEGER,
      allowNull:false
    },
    longDesc:{
      type:DataTypes.TEXT,
      allowNull:false,
  
    },
    smallDesc:{
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[20,100]        
      }
    },
    disponibility:{
      type:DataTypes.INTEGER,
      allowNull:false
    },
    time:{
      type:DataTypes.INTEGER,
      allowNull:false,
      validate:{
          len:[0,3] //Numero de Días
      }      
    },
    devolution:{
      type:DataTypes.BOOLEAN,
      allowNull:false
      
    },  
    include:{
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[20,250],
        notEmpty:true
      }
    },customizable:{
      type:DataTypes.BOOLEAN,
      allowNull:false
    },
    customizeValue:{
      type:DataTypes.STRING,
      allowNull:true,
      validate:{
        len:[0,250]
      }
    },
    garanty:{
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
          len:[0,3] //Meses de garantía
      }       
    },      
    tags:{
      type:DataTypes.JSONB,
      allowNull:true
    },
    photos:{
      type:DataTypes.JSONB,
      allowNull:false        
    },     
    category:{
      type:DataTypes.JSONB,
      allowNull:false        
    },
    variation:{
      type:DataTypes.JSONB,
      allowNull:false        
    },
    materials:{
      type:DataTypes.JSONB,
      allowNull:false        
    },
    shopId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    WarehouseId: {
      type:DataTypes.INTEGER,
      allowNull:true
    },
    StatusId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    reasons:{
      type:DataTypes.JSONB,
      allowNull:true
    },
    weight:{
      type:DataTypes.DECIMAL(10, 2)  ,
      allowNull:false 
    },schedule:{ //calendario
      type:DataTypes.INTEGER,
      allowNull:true
    },
    dimesion:{
      type:DataTypes.JSONB,
      allowNull:true
    }

  }, { freezeTableName: true});
  Bids.associate = function(models) {
    // associations can be defined here 

    Bids.belongsTo(models.Status);
    Bids.belongsTo(models.Warehouse);
    Bids.belongsTo(models.shop);
    Bids.belongsTo(models.brands);
    

  };
  return Bids;
};