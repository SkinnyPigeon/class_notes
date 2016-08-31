require( 'pry-byebug' )

class Artist
  attr_reader(:name, :id)

  def initialize( options, runner)
    @name = options['name']
    @id = options['id'].to_i
    @runner = runner
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *"
    artist_data = @runner.run(sql)
    @id = artist_data.first['id'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    albums_data = @runner.run( sql )
    albums = albums_data.map { |album_data| Album.new(album_data, @runner) }
    return albums
  end
end
