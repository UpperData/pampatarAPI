'use strict';
module.exports = (sequelize, DataTypes) => {
  const attachment = sequelize.define('attachment', {
    data: 
    {type:DataTypes.BLOB,
    allowNull:false,
    validate:{     
      notEmpty:true        
    }
  },
    tabs: {
      type:DataTypes.JSONB,
      allowNull:false,
      validate:{     
        notEmpty:true        
      }
    }
  }, {});
  attachment.associate = function(models) {
    // associations can be defined here
  };
  return attachment;
};