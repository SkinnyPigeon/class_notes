require('pry-byebug')

require_relative('bear.rb')
require_relative('river.rb')
require_relative('fish.rb')

bear1 = Bear.new("Yogi", "Grizzly")
bear2 = Bear.new("Iorek", "Polar")

fish1 = Fish.new("Nemo")
fish2 = Fish.new("Sharkey")
fish3 = Fish.new("Barry")
fish4 = Fish.new("George")

river1 = River.new( [fish1, fish2] )
river2 = River.new( [fish3, fish4] )

binding.pry
nil
