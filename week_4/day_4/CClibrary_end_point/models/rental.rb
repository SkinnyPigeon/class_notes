require('pg')
require_relative('../db/sql_runner')


class Rental

  attr_reader :id, :book_id, :member_id

  def initialize( options )
    @id = options['id'].to_i
    @book_id = options['book_id'].to_i
    @member_id = options['member_id'].to_i
  end

  def save()
    sql = "INSERT INTO rentals (book_id, member_id) VALUES (#{@book_id}, #{@member_id}) RETURNING *"
    rental = run(sql).first
    return Rental.new(rental)
  end

  def book()
    sql = "SELECT * FROM books WHERE id = #{@book_id}"
    return Book.map_item(sql)
  end

  def member()
    sql = "SELECT * FROM members WHERE id = #{@book_id}"
    return Member.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    return Rental.map_items(sql)
  end

  def self.map_items(sql)
    rental = run(sql)
    result = rental.map { |product| Rental.new( product ) }
    return result
  end

  def self.map_item(sql)
    result = Rental.map_items(sql)
    return result.first
  end

end