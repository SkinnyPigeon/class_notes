require('pry-byebug')
require_relative('../models/book.rb')
require_relative('../models/member.rb')

Book.delete_all()
Member.delete_all()

book1 = Book.new({ 'title' => 'Harry Potter', 'author' => 'J.K.Rowling'}).save
book2 = Book.new({ 'title' => 'Necronomicon', 'author' => 'H.P.Lovecraft'}).save
book3 = Book.new({ 'title' => 'American Gods', 'author' => 'N.Gaiman'}).save

member1 = Member.new({ 'name' => 'Conan the Librarian', 'address' => 'Hyboria'}).save
member2 = Member.new({ 'name' => 'Lisa Simpson', 'address' => 'Springfield'}).save
member3 = Member.new({ 'name' => 'Charles Xavier', 'address' => 'Xavier Estate'}).save


binding.pry
nil
