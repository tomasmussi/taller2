var express = require('express');
var app = express();
var router = express.Router();
var db = require('queries');

app.set('port', (process.env.PORT || 5000));

/*Agrego encabezado que permiten hacer request desde angular*/
app.all('/*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With");
  next();
});

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
  response.render('pages/index');
});

app.get('/job_positions',db.getAllJobPositions);

app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});

module.exports = router;
