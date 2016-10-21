var express = require('express');
var app = express();
var bodyParser = require('body-parser');
var router = express.Router();
var db = require('queries');
var winston = require('winston'); //LOG 
var logger = new (winston.Logger)({
   transports: [
      new (winston.transports.Console)(),
      new (winston.transports.File)({ filename: 'logs/SharedServer.log' })
    ]
});
app.set('port', (process.env.PORT || 5000));
/*Agrego encabezado que permiten hacer request desde angular*/
app.all('/*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  next();
});

app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded
app.use(express.static(__dirname + '/public'));
/*Agrego los directorios para que pueda funcionar correctamente 
 *el index.ejs*/
app.use('/js',express.static(__dirname + '/views/pages/js'));
app.use('/fonts',express.static(__dirname + '/views/pages/fonts'));
app.use('/imgs',express.static(__dirname + '/views/pages/imgs'));
app.use('/templates',express.static(__dirname + '/views/pages/templates'));
app.use('/css',express.static(__dirname + '/views/pages/css'));

app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');

app.get('/', function(request, response) {
  logger.info('Ingresando a index.js');
  response.render('pages/index');
});

app.get('/job_positions',db.getAllJobPositions);
app.get('/job_positions/categories/:name',db.getAllJobPositionsByCategory);
app.get('/categories',db.getAllCategories);
app.get('/skills',db.getAllSkills);
app.post('/job_positions/categories/:category',db.postJobPosition);

app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});

module.exports = router;
