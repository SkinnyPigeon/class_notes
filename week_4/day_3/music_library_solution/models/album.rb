require( 'pg' )
require( 'pry-byebug' )
require_relative('../db/sql_runner')

class Album

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @artist_id = options['artist_id']
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}', '#{ @artist_id }') RETURNING *"
    album_data = run_sql(sql)
    @id = album_data.first['id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{ @artist_id }"
    artist_data = run_sql( sql )
    artist = Artist.new( artist_data.first )
    return artist
  end

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM albums"
    sql = sql + " WHERE name LIKE '%#{query}%'" unless query.empty?
    albums_data = run_sql( sql )
    albums = albums_data.map {|album_data| Album.new( album_data )}
    return albums
  end

  def self.find( id )
    albums = run_sql( "SELECT * FROM albums WHERE id=#{id}" ) 
    result = Album.new( albums.first )
    return result
  end

  def self.update( options )
      run_sql(  
        "UPDATE albums SET 
          name='#{options['name']}',
          artist_id=#{options['artist_id']}
          WHERE id=#{options['id']}"
      ) 
  end

end