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
        len:[10,200]        
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
      allowNull:false,
      validate:{
        isIn:["1","2"] // 1=Inmediata 2=Contrapedido
      }
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
      defaultValues:"t"
    },  
    include:{
      type:DataTypes.STRING,
      allowNull:false,
      validate:{
        len:[20,400]
      }
    },
    customize:{
      type:DataTypes.STRING,
      allowNull:true,
      validate:{
        len:[20,400]
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
      type:DataTypes.JSON,
      allowNull:true
    },
    photos:{
      type:DataTypes.JSON,
      allowNull:false        
    },     
    category:{
      type:DataTypes.JSON,
      allowNull:false        
    },
    variation:{
      type:DataTypes.JSON,
      allowNull:false        
    },
    accountRoleId: {
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
<<<<<<< Updated upstream
=======
    },
    reasons:{
      type:DataTypes.JSONB,
      allowNull:true
    },
    weight:{
      type:DataTypes.DECIMAL(10, 2)  ,
      allowNull:false 
    },
    schedule:{ //calendario
      type:DataTypes.INTEGER,
      allowNull:true
    },
    dimesion:{
      type:DataTypes.JSONB,
      allowNull:true
>>>>>>> Stashed changes
    }
  }, { freezeTableName: true});
  Bids.associate = function(models) {
    // associations can be defined here 

    Bids.belongsTo(models.Status);
    Bids.belongsTo(models.Warehouse);
    Bids.belongsTo(models.accountRoles);

  };
  return Bids;
};