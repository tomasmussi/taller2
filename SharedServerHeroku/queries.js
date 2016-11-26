var promise = require('bluebird');


var options = {
  // Initialization Options
  promiseLib: promise
};

var pgp = require('pg-promise')(options);
var connectionString = "postgres://sharedserveruser:shared@localhost:5432/sharedserver";
var db = pgp(connectionString);
var winston = require('winston'); //LOG 


var logger = new (winston.Logger)({
   transports: [
      new (winston.transports.Console)(),
      new (winston.transports.File)({ filename: 'logs/SharedServer.log' })
    ]
});

//GET: Returns all job positions.
function getAllJobPositions(req, res, next) {
  logger.info('Funcion getAllJobPositions');
  db.any('select name,description,category from job_position')
    .then(function (data) {	
	  logger.info('Respuesta OK: ' + JSON.stringify(data));
      res.status(200)
        .json({
          job_positions: data,
		  metadata: {
					"version":0.1,
					"count": data.length					
					}
        });	
    })
    .catch(function (err) {
		logger.error('Respuesta: '+ err.message);
		res.status(500).json({
		   "code":0,
		   "message":err.message
		});
    });	
}

//GET: filter job positions by category
function getAllJobPositionsByCategory(req, res, next) {
    logger.info('Funcion getAllJobPositionsByCategory');
    db.any('select name from category where name = $1',req.params.name).then(function(data){
    if(data.length != 0){
      db.any('select name,description,category from job_position where category = $1',req.params.name)
      .then(function (data) { 
      logger.info('Respuesta OK: ' + JSON.stringify(data));
      res.status(200)
      .json({
        job_positions: data,
        metadata: {
          "version":0.1,
          "count": data.length          
        }
      }); 
      })
      .catch(function (err) {
        logger.error('Respuesta: '+ err.message);
        res.status(500).json({
        "code":0,
        "message":err.message
      });
      }); 
    }else{
      res.status(404).json({
        "code":0,
        "message":'Categoria inexistente.'
      });
    }
    }).catch(function (err) {
    logger.error('Respuesta: '+ err.message);
    res.status(500).json({
    "code":0,
    "message":err.message
    });
    }); 
}

//GET: get categories
function getAllCategories(req, res, next) {
  logger.info('Funcion getAllCategories');
  db.any('select name,description from category')
    .then(function (data) { 
    logger.info('Respuesta OK: ' + JSON.stringify(data));
      res.status(200)
        .json({
          categories: data,
      metadata: {
          "version":0.1,
          "count": data.length          
          }
        }); 
    })
    .catch(function (err) {
    logger.error('Respuesta: '+ err.message);
    res.status(500).json({
       "code":0,
       "message":err.message
    });
    }); 
}

//GET: get skills
function getAllSkills(req, res, next) {
  logger.info('Funcion getAllCategories');
  db.any('select name,description,category from skill')
    .then(function (data) { 
    logger.info('Respuesta OK: ' + JSON.stringify(data));
      res.status(200)
        .json({
          skills: data,
      metadata: {
          "version":0.1,
          "count": data.length          
          }
        }); 
    })
    .catch(function (err) {
    logger.error('Respuesta: '+ err.message);
    res.status(500).json({
       "code":0,
       "message":err.message
    });
    }); 
}

//POST: post job position
function postJobPosition(req, res, next){
  logger.info('Funcion postJobPosition');
  if(req.body.name == null || req.body.description == null || req.params.category == null){
    logger.error('Respuesta: Parametros faltantes.');
    res.status(400).json({
       "code":0,
       "message":"Parametros faltantes"
    });
  };
  db.any('select name from category where name = $1',req.params.category).then(function(data){
    if(data.length == 0){
      logger.error('Respuesta: Categoria inexistente.');
      res.status(404).json({
         "code":0,
         "message":'Categoria inexistente.'
      });
    }
    db.any('INSERT INTO job_position \(name, description, category\)VALUES (\''
      +req.body.name
      +'\', \''
      +req.body.description
      +'\',\''
      +req.params.category 
      +'\'\);')
    .then(function (data) { 
      logger.info('Respuesta OK: ' + JSON.stringify(data));
        res.status(201)
          .json({
            name: req.body.name,
            category: req.params.category,
            description: req.body.description
          }); 
      })
      .catch(function (err) {
      logger.error('Respuesta: '+ err.message);
      res.status(500).json({
         "code":0,
         "message":err.message
      });
      }); 
    }).catch(function(err){
      logger.error('Respuesta: '+ err.message);
      res.status(500).json({
         "code":0,
         "message":err.message
      });

    });
}

//POST: post skill
function postskill(req,res,next){
    logger.info('Funcion postskill');
  if(req.body.name == null || req.body.description == null || req.params.category == null){
    logger.error('Respuesta: Parametros faltantes.');
    res.status(400).json({
       "code":0,
       "message":"Parametros faltantes"
    });
  };
  db.any('select name from category where name = $1',req.params.category).then(function(data){
    if(data.length == 0){
      logger.error('Respuesta: Categoria inexistente.');
      res.status(404).json({
         "code":0,
         "message":'Categoria inexistente.'
      });
    }
    db.any('INSERT INTO skill \(name, description, category\)VALUES (\''
      +req.body.name
      +'\', \''
      +req.body.description
      +'\',\''
      +req.params.category 
      +'\'\);')
    .then(function (data) { 
      logger.info('Respuesta OK: ' + JSON.stringify(data));
        res.status(201)
          .json({
            name: req.body.name,
            category: req.params.category,
            description: req.body.description
          }); 
      })
      .catch(function (err) {
      logger.error('Respuesta: '+ err.message);
      res.status(500).json({
         "code":0,
         "message":err.message
      });
      }); 
    }).catch(function(err){
      logger.error('Respuesta: '+ err.message);
      res.status(500).json({
         "code":0,
         "message":err.message
      });

    });

}

//POST: post category
function postCategory(req,res,next){
  logger.info('Funcion postCategory');
  if(req.body.name == null || req.body.description == null){
    logger.error('Respuesta: Parametros faltantes');
    res.status(400).json({
       "code":0,
       "message":"Parametros faltantes"
    });
  };
    db.any('INSERT INTO category \(name, description\)VALUES (\''
      +req.body.name
      +'\', \''
      +req.body.description
      +'\'\);')
    .then(function (data) { 
      logger.info('Respuesta OK: ' + JSON.stringify(data));
        res.status(201)
          .json({
            name: req.body.name,
            description: req.body.description
          }); 
      })
      .catch(function (err) {
      logger.error('Respuesta: '+ err.message);
      res.status(500).json({
         "code":0,
         "message":err.message
      });
      }); 

}

//PUT: put skill
function putSkill(req,res,next){
  logger.info('Funcion putSkill');
  if(req.body.name == null || req.body.description == null || req.body.category == null){
    logger.error('Respuesta: Parametros faltantes.');
    res.status(400).json({
       "code":0,
       "message":"Parametros faltantes"
    });
  };
  var checkValues = [req.params.name,req.params.category];
  db.any('select name from skill where name = $1 and category=$2',checkValues).then(function(data){
    if(data.length == 0){
      logger.error('Respuesta: No existe recurso solicitado.');
      res.status(404).json({
         "code":0,
         "message":'No existe recurso solicitado.'
      });
    }
  var values = [req.body.name,req.body.description,req.body.category,req.params.name,req.params.category];
  db.any('update skill set name=$1,description=$2,category=$3 where name=$4 and category=$5',
    values)
  .then(function (data) { 
      logger.info('Respuesta OK: ' + JSON.stringify(data));
        res.status(200)
          .json({
            name: req.body.name,
            category: req.params.category,
            description: req.body.description
          }); 
      })
      .catch(function (err) {
      logger.error('Respuesta: '+ err.message);
      res.status(500).json({
         "code":0,
         "message":err.message
      });
      }); 
  });
}

//PUT: put job position
function putJobPosition(req, res, next){
  logger.info('Funcion putJobPosition');
  if(req.body.name == null || req.body.description == null || req.body.category == null){
    res.status(400).json({
       "code":0,
       "message":"Parametros faltantes"
    });
  };

  var checkValues = [req.params.name,req.params.category];
  db.any('select name from job_position where name = $1 and category=$2',checkValues).then(function(data){
    if(data.length == 0){
      logger.error('Respuesta: No existe recurso solicitado.');
      res.status(404).json({
         "code":0,
         "message":'No existe recurso solicitado.'
      });
    }
  var values = [req.body.name,req.body.description,req.body.category,req.params.name,req.params.category];
  db.any('update job_position set name=$1,description=$2,category=$3 where name=$4 and category=$5',
    values)
  .then(function (data) { 
      logger.info('Respuesta OK: ' + JSON.stringify(data));
        res.status(200)
          .json({
            name: req.body.name,
            category: req.params.category,
            description: req.body.description
          }); 
      })
      .catch(function (err) {
      logger.error('Respuesta: '+ err.message);
      res.status(500).json({
         "code":0,
         "message":err.message
      });
      }); 
});
}

//PUT: put category
function putCategory(req,res,next){
logger.info('Funcion putCategory');
  if(req.body.name == null || req.body.description == null){
    res.status(400).json({
       "code":0,
       "message":"Parametros faltantes"
    });
  };
  var checkValues = [req.params.name];
  db.any('select name from category where name = $1',checkValues).then(function(data){
    if(data.length == 0){
      logger.error('Respuesta: No existe recurso solicitado.');
      res.status(404).json({
         "code":0,
         "message":'No existe recurso solicitado.'
      });
    }
  var values = [req.body.name,req.body.description,req.params.name];
  db.any('update category set name=$1,description=$2 where name=$3 ',
    values)
  .then(function (data) { 
      logger.info('Respuesta OK: ' + JSON.stringify(data));
        res.status(200)
          .json({
            name: req.body.name,
            description: req.body.description
          }); 
      })
      .catch(function (err) {
      logger.error('Respuesta: '+ err.message);
      res.status(500).json({
         "code":0,
         "message":err.message
      });
      }); 

});
}

//DELETE: delete job position
function deleteJobPosition(req,res,next){
  logger.info('Funcion deleteJobPosition');
  var checkValues = [req.params.name,req.params.category];
  db.any('select name from job_position where name = $1 and category=$2',checkValues).then(function(data){
    if(data.length == 0){
      logger.error('Respuesta: No existe recurso solicitado.');
      res.status(404).json({
         "code":0,
         "message":'No existe recurso solicitado.'
      });
    }
  values=[req.params.name,req.params.category];
  db.any('delete from job_position where name=$1 and category=$2',values)
  .then(function(data){
    logger.info('Respuesta OK: ' + JSON.stringify(data));
        res.status(204)
          .json({
            name: req.params.name,
            category: req.params.category
          }); 
  })
        .catch(function (err) {
      logger.error('Respuesta: '+ err.message);
      res.status(500).json({
         "code":0,
         "message":err.message
      });
       });
});
}

//DELETE: delete skill
function deleteSkill(req,res,next){
  logger.info('Funcion deleteSkill');
  var checkValues = [req.params.name,req.params.category];
  db.any('select name from skill where name = $1 and category=$2',checkValues).then(function(data){
    if(data.length == 0){
      logger.error('Respuesta: No existe recurso solicitado.');
      res.status(404).json({
         "code":0,
         "message":'No existe recurso solicitado.'
      });
    }
  values=[req.params.name,req.params.category];
  db.any('delete from skill where name=$1 and category=$2',values)
  .then(function(data){
    logger.info('Respuesta OK: ' + JSON.stringify(data));
        res.status(204)
          .json({
            name: req.params.name,
            category: req.params.category
          }); 
  })
        .catch(function (err) {
      logger.error('Respuesta: '+ err.message);
      res.status(500).json({
         "code":0,
         "message":err.message
      });
       });
});
}

//DELETE: delete category
function deleteCategory(req,res,next){
  logger.info('Funcion deleteCategory');
    var checkValues = [req.params.name];
  db.any('select name from category where name = $1',checkValues).then(function(data){
    if(data.length == 0){
      logger.error('Respuesta: No existe recurso solicitado.');
      res.status(404).json({
         "code":0,
         "message":'No existe recurso solicitado.'
      });
    }
  values=[req.params.name];
  db.any('delete from category where name=$1',values)
  .then(function(data){
    logger.info('Respuesta OK: ' + JSON.stringify(data));
        res.status(204)
          .json({
            name: req.params.name
          }); 
  })
        .catch(function (err) {
      logger.error('Respuesta: '+ err.message);
      res.status(500).json({
         "code":0,
         "message":err.message
      });
       });

});
}

module.exports = {
  getAllJobPositions: getAllJobPositions,
  getAllJobPositionsByCategory: getAllJobPositionsByCategory,
  getAllCategories: getAllCategories,
  getAllSkills: getAllSkills,
  postskill: postskill,
  postJobPosition: postJobPosition,
  postCategory: postCategory,
  putJobPosition: putJobPosition,
  putSkill: putSkill,
  putCategory: putCategory,
  deleteSkill: deleteSkill,
  deleteCategory: deleteCategory,
  deleteJobPosition: deleteJobPosition
};

