require( 'pg' )
require_relative('pokemon')

class Trainer

  attr_reader( :id, :name )

  def initialize( options, runner )
    @id = options['id'].to_i
    @name = options['name']
    @runner = runner
  end

  def save()
    sql = "INSERT INTO trainers (name) VALUES ('#{ @name }') RETURNING *"
    return Trainer.map_item(sql, @runner)
  end

  def pokemons()
    sql = "SELECT p.* FROM pokemons p INNER JOIN ownedpokemons o ON o.pokemon_id = p.id WHERE trainer_id = #{@id};"
    return Pokemon.map_items(sql, @runner)
  end

  def self.all(runner)
    sql = "SELECT * FROM trainers"
    return Trainer.map_items(sql, runner)
  end

  def self.delete_all(runner)
   sql = "DELETE FROM trainers"
   runner.run(sql)
  end

  def self.map_items(sql, runner)
    trainers = runner.run( sql )
    result = trainers.map { |trainer| Trainer.new( trainer, runner ) }
    return result
  end

  def self.map_item(sql, runner)
    result = Trainer.map_items(sql, runner)
    return result.first
  end

end