var revalidator = require('revalidator');

var schemaValidator = function (schema) {
    return function (value) {
        var results = revalidator.validate(value, schema);
        if (!results.valid) throw new Error(JSON.stringify(results.errors));
    };
};
'use strict';
module.exports = (sequelize, DataTypes) => {
  const envoiceNotify = sequelize.define('envoiceNotify', {
    envoiceTypeId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    envoiceNum: {
      type:DataTypes.STRING,
      allowNull:false
    },
    dateNotify: {
      type:DataTypes.DATE,
      allowNull:false
    },
    deliveryId: {
      type:DataTypes.INTEGER,
      allowNull:false
    },
    taxes: { // {tax:{id:0,name:abc},value:1223} =>Table  taxValue
      type:DataTypes.JSONB,
      allowNull:false,
      validate:{   
        schema: schemaValidator({
          type: "array",
          items: {
            type: "object",
            required: true,
            properties: {               
              tax: {
                type: 'object',
                required: true,
                properties: {
                  id: {
                    type: 'number',
                    required: true
                  },
                  name: {
                    type: 'string',
                    required: true
                  }
                }
              }
            },
              value:{type:"number",required:true}
          }           
        })
      }        
    },
    attachmentId: {
      type:DataTypes.INTEGER
    },
    shopId:{
      type:DataTypes.INTEGER,
      allowNull:false
    }
  }, {});
  envoiceNotify.associate = function(models) {
    // associations can be defined here
  };
  return envoiceNotify;
};