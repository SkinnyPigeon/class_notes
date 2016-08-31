var express = require('express');
var app = express();
var path = require('path');
var planets = [{name: "Mars", size: 2093},{name: "Saturn", size: 8823},{name: "Jupiter", size: 13763}];

app.use(express.static('client/build'));

app.get('/', function(req, res){
  res.sendFile(path.join(__dirname + '/client/build/index.html'));
});

app.get('/planets/new', function(req, res) {
  // NEW
  res.send("NEW planet route");
});

app.post('/planets', function(req, res) {
  // CREATE
  res.send("CREATE planet route");
});

app.get('/planets/:id', function(req, res){
  // SHOW
  res.json(planets[req.params.id-1]);
})

app.get('/planets/:id/edit', function(req, res) {
  // EDIT
  res.send("EDIT planet route");
});

app.put('/planets/:id', function(req, res) {
  // UPDATE
  res.send("UPDATE planet route");
});

app.delete('/planets/:id', function(req, res) {
  // DELETE
  res.send("DELETE planet route");
});

app.listen('3000', function(){
  console.log('The magic is all happening on port 3000');
});