require 'pry-byebug'
require_relative('../models/rental.rb')
require_relative('../models/book.rb')
require_relative('../models/member.rb')



get '/rentals' do
  @rentals = Rental.all()
  erb :'rentals/index'
end

get '/rentals/new' do
  @books = Book.all()
  @members = Member.all()
  erb :'rentals/new'
end

post '/rentals' do
  @rental = Rental.new(params)
  @rental.save
  redirect to( "rentals" )
end