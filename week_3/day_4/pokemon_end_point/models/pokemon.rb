require( 'pg' )
require_relative('trainer')
require_relative('../db/sql_runner')

class Pokemon 

  attr_reader( :id, :name )

  def initialize( options, runner )
    @id = options['id'].to_i
    @name = options['name']
    @runner = runner
  end

  def save()
    sql = "INSERT INTO pokemons (name) VALUES ('#{ @name }') RETURNING *"
    return Pokemon.map_item(sql, @runner)
  end

  def trainers()
    sql = "SELECT t.* from trainers t INNER JOIN ownedpokemons o ON o.trainer_id = t.id WHERE pokemon_id = #{@id}"
    return Trainer.map_items(sql, @runner)
  end

  def self.all(runner)
    sql = "SELECT * FROM pokemons"
    return Pokemon.map_items(sql, runner)
  end

  def self.delete_all(runner)
    sql = "DELETE FROM pokemons"
    runner.run(sql)
  end

  def self.map_items(sql, runner)
    pokemons = runner.run(sql)
    result = pokemons.map { |pokemon| Pokemon.new( pokemon, runner ) }
    return result
  end

  def self.map_item(sql, runner)
    result = Pokemon.map_items(sql, runner)
    return result.first
  end

end