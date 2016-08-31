require( 'pg' )
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
    pokemon = @runner.run( sql ).first
    return Pokemon.new(pokemon, @runner)
  end

  def self.all(runner)
    sql = "SELECT * FROM pokemons"
    pokemons = runner.run(sql)
    result = pokemons.map { |pokemon| Pokemon.new( pokemon ) }
    return result
  end

  def self.delete_all(runner)
    sql = "DELETE FROM pokemons"
    runner.run(sql)
  end

end