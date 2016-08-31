require_relative( 'models/pokemon' )
require_relative( 'models/trainer' )
require_relative( 'db/sql_runner' )
require( 'pry-byebug' )

runner = SqlRunner.new({dbname: 'pokemon', host: 'localhost'})


binding.pry
nil
