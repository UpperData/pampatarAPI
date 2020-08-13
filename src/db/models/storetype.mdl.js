'use strict';
module.exports = (sequelize, DataTypes) => {
  const storeType = sequelize.define('storeType', {
    name: {
    	 type:DataTypes.STRING,
	    allowNull:false,
	    validate:{
			isIn: [['Fabrico Productos Hechos a mano','Fabrico Productos con la ayuda de un socio productor',
						'Soy distribuidor de una marca de Insumos o herramientas del rubro de artes, manualidades o celebraciones',
						'Presto servicios o imparto cursos para el rubro de artes, manualidades o celebraciones']],    
	    }
 	 }
  }, {});
  storeType.associate = function(models) {
    // associations can be defined here
  };
  return storeType;
};