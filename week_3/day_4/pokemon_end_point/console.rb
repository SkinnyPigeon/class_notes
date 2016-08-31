require_relative( 'db/sql_runner' )
require_relative( 'models/pokemon' )
require_relative( 'models/trainer' )
require_relative( 'models/owned_pokemon' )

require( 'pry-byebug' )



runner = SqlRunner.new({dbname: 'pokemon', host: 'localhost'})

OwnedPokemon.delete_all(runner)
Trainer.delete_all(runner)
Pokemon.delete_all(runner)

trainer1 = Trainer.new({ 'name' => 'Tony' }, runner)
trainer2 = Trainer.new({ 'name' => 'Valerie' }, runner)

t1 = trainer1.save()
t2 = trainer2.save() 

pokemon1 = Pokemon.new({ 'name' => 'Charmander'}, runner)
pokemon2 = Pokemon.new({ 'name' => 'Pikachu' }, runner)

p1 = pokemon1.save()
p2 = pokemon2.save()

entry1 = OwnedPokemon.new({ 'trainer_id' => t1.id , 'pokemon_id' => p1.id }, runner)
entry2 = OwnedPokemon.new({ 'trainer_id' => t2.id , 'pokemon_id' => p1.id }, runner)
entry3 = OwnedPokemon.new({ 'trainer_id' => t2.id , 'pokemon_id' => p2.id }, runner)


entry1.save
entry2.save
entry3.save


binding.pry
nil
