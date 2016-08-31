require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( '../models/album' )

class Artist

  attr_reader( :id, :name )

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *"
    artist_data = run_sql(sql)
    @id = artist_data.first['id'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    albums_data = run_sql( sql )
    albums = albums_data.map { |album_data| Album.new(album_data) }
    return albums
  end

  def self.all(query = "")
    query = query.to_s
    sql = "SELECT * FROM artists"
    sql = sql + " WHERE name LIKE '%#{query}%'" unless query.empty?
    artists = run_sql( sql )
    result = artists.map { |a| Artist.new( a ) }
    return result
  end

  def self.find( id )
    artists = run_sql( "SELECT * FROM artists WHERE id=#{id}" ) 
    result = Artist.new( artists.first )
    return result
  end

  def self.update( options )
      run_sql(  
        "UPDATE artists SET 
          name='#{options['name']}'
          WHERE id=#{options['id']}"
      ) 
  end

  def self.destroy( id )
    run_sql( "DELETE FROM artists WHERE id=#{id}" )
  end

end