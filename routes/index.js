var express = require('express');
var router = express.Router();
var r = require('rethinkdb');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.post('/newsletter', function(req, res, next) {
    r.connect( { host : 'localhost', db: 'landing', port : 28015 }, function(err, conn) {
        if (err) throw err;
        r.table('newsletter').insert(req.body).run(conn, function (err, cursor) {
          if (err) throw err;
          // cursor.toArray(function (err, result){
            // if (err) throw err;
          res.send("OK");
            //res.send(JSON.stringify(cursor));
          // });
        });
    });

});

module.exports = router;
