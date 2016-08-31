require( 'pg' )

class OwnedPokemon

  attr_reader :id, :trainer_id, :pokemon_id

  def initialize( options, runner )
    @id = options['id'].to_i
    @trainer_id = options['trainer_id'].to_i
    @pokemon_id = options['pokemon_id'].to_i
    @runner = runner
  end

  def save()
    sql = "INSERT INTO ownedpokemons (
      trainer_id,
      pokemon_id) 
      VALUES (
        #{ @trainer_id }, 
        #{ @pokemon_id }
      ) RETURNING *"
    return OwnedPokemon.map_item(sql, @runner)
  end

  def self.all(runner)
    sql = "SELECT * FROM ownedpokemons"
    return OwnedPokemon.map_items(sql, runner)
  end

  def self.delete_all(runner) 
    sql = "DELETE FROM ownedpokemons"
    runner.run(sql)
  end

  def self.map_items(sql, runner)
    owned_pokemons = runner.run( sql )
    result = owned_pokemons.map { |owned_pokemon| OwnedPokemon.new( owned_pokemon, runner ) }
    return result
  end

  def self.map_item(sql, runner)
    result = OwnedPokemon.map_items(sql, runner)
    return result.first
  end
  
end