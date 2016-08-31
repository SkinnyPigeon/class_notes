require_relative('./models/artist')
require_relative('./models/album')
require_relative('./db/sql_runner')


require( 'pry-byebug' )

runner = SqlRunner.new( {dbname:'music_library', host:'localhost'} )

artist = Artist.new( {'name' => "Oasis"}, runner )
artist.save()


album1 = Album.new( { 'name' => 'Definitely Maybe', 'artist_id' => artist.id }, runner )
album2 = Album.new( { 'name' => 'Whats the Story', 'artist_id' => artist.id}, runner )

album1.save()
album2.save()

binding.pry
nil