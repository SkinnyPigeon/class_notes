require('pg')

class Album
  attr_reader( :id, :name, :artist_id )

  def initialize( options, runner )
    @id = options['id']
    @name = options['name']
    @artist_id = options['artist_id']
    @runner = runner
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}', '#{ @artist_id }') RETURNING *"
    album_data = @runner.run(sql)
    @id = album_data.first['id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{ @artist_id }"
    artist_data = @runner.run( sql )
    artist = Artist.new( artist_data.first, @runner )
    return artist
  end

  def self.all(runner)
    sql = "SELECT * FROM albums"
    albums_data = runner.run( sql )
    albums = albums_data.map {|album_data| Album.new( album_data, runner )}
    return albums
  end
end
