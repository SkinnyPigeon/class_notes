var express = require( 'express' );
var app = express();
var MongoClient = require( 'mongodb' ).MongoClient;
var ObjectId = require( 'mongodb' ).ObjectId;
var bodyParser = require( 'body-parser' );
var path = require( 'path' );
app.use( bodyParser.json() );
app.use( express.static( 'public' ) );
var url = 'mongodb://localhost:27017/farm';

app.get( '/', function( req, res ) {
	res.sendFile( path.join( __dirname + '/index.html' ) );
})

app.delete( '/animals/:id', function( req, res ) {
	MongoClient.connect( url, function( err, db ) {
		var collection = db.collection( 'animals' );
		collection.remove( { _id: new ObjectId( req.params.id ) } )
		res.status(200).end()
		db.close()
	})
})

app.put( '/animals/:id', function(req, res) {
	MongoClient.connect( url, function( err, db ) {
		var collection = db.collection( 'animals' );
		collection.updateOne( 
			{ _id: new ObjectId( req.params.id ) }, 
			{ $set: req.body } )
		res.status(200).end();
		db.close();
	})
})

app.post( '/animals', function(req, res ) {
	MongoClient.connect( url, function(err, db) {
		var collection = db.collection( 'animals' )
		collection.insert( req.body )
		res.status(200).end()
		db.close()
	})
});

app.get( '/animals', function(req, res) {		
	MongoClient.connect( url, function( err, db ) {
		var collection = db.collection( 'animals' )
		collection.find({}).toArray( function( err, docs ) {
			res.json( docs );
			db.close();
		})
	})
})

app.listen( '3000', function() {
	console.log( 'running on 3000!' );
})