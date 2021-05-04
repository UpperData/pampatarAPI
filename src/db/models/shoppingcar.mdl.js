'use strict';
var revalidator = require('revalidator');

var schemaValidator = function (schema) {
    return function (value) {
        var results = revalidator.validate(value, schema);
        if (!results.valid) throw new Error(JSON.stringify(results.errors));
    };
};
'use strict';
module.exports = (sequelize, DataTypes) => {
  const shoppingcar = sequelize.define('shoppingcar', {
    AccountId: {
      type:DataTypes.INTEGER,
      allowNull: false
    },
    items: {
      type:DataTypes.JSONB,
      allowNull: true,
      validate:{   
        schema: schemaValidator({
          type: "object",
          items: {
            type: "array",
            required: true,
            properties: {                               
              BidId:{type:"number",required:true},
              qty:{type:"string",required:true}
            }
          }
        })
      }
    },
    StatusId: {
      type:DataTypes.INTEGER,
      defaultValue:1,
      allowNull: false
    }
  }, {});
  shoppingcar.associate = function(models) {
    // associations can be defined here
    shoppingcar.belongsTo(models.Status);
    shoppingcar.belongsTo(models.Account);
  };
  return shoppingcar;
};