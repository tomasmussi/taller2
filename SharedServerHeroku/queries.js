var promise = require('bluebird');

var options = {
  // Initialization Options
  promiseLib: promise
};

var pgp = require('pg-promise')(options);
var connectionString = "postgres://sharedserveruser:shared@localhost:5432/sharedserver";
//var connectionString = 'postgres://alfredo:pass@localhost:5000/job_position';
//yourusername:yourpassword@localhost:5432
//'postgres://"+config.postgres.user+":"+config.postgres.password+"@"+config.postgres.host+"/"+config.postgres.db';
var db = pgp(connectionString);

// add query functions


function getAllJobPositions(req, res, next) {
	console.log("entro a getAllJobPositions");
  db.any('select * from job_positions')
    .then(function (data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'Retrieved ALL job_positions'
        });
    })
    .catch(function (err) {
		console.log("entro a error");
      return next(err);
    });
}


module.exports = {
  getAllJobPositions: getAllJobPositions
//  getSinglePuppy: getSinglePuppy,
//  createPuppy: createPuppy,
//  updatePuppy: updatePuppy,
//  removePuppy: removePuppy
};

