require ('pry-byebug')
require ('pg')

class Pizza
  attr_reader(:id, :first_name, :last_name, :topping, :quantity)

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @topping = options['topping']
    @quantity = options['quantity'].to_i
  end

  def save
    db = PG.connect( {dbname: 'pizza_shop', host: 'localhost' })
    sql = "INSERT INTO pizzas (
        first_name,
        last_name,
        topping,
        quantity) VALUES(
        '#{ @first_name }',
        '#{ @last_name }',
        '#{ @topping }',
        '#{ @quantity }'
        ) returning *" 
    result = db.exec(sql)
    @id = result[0]['id']
    db.close
  end

  def self.all()
    db = PG.connect( {dbname: 'pizza_shop', host: 'localhost' })
    sql = "SELECT * FROM pizzas"
    pizzas = db.exec(sql)
    db.close
    pizza_array =  pizzas.map { |pizza| Pizza.new(pizza)}
    return pizza_array
  end

  def self.select(id)
    db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
    sql = "SELECT * from pizzas WHERE id = '#{id}'"
    pizza = db.exec(sql)
    return Pizza.new( pizza.first() )
  end

  def self.delete(id)
    db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
    sql = "DELETE FROM pizzas WHERE id = #{id}"
    db.exec(sql)
    db.close
  end

  def delete
    Pizza.delete(@id)
  end

  def update (options)
    if (options['first_name'])
      @first_name = options['first_name']
    end
    if (options['last_name'] )
      @last_name = options['last_name']
    end
    if (options['topping'])
      @topping = options['topping']
    end
    if (options['quantity'])
      @quantity = options['quantity'].to_i
    end

    pizza_id = options['id'].to_i

    db = PG.connect( { dbname: 'pizza_shop', host: 'localhost' } )
    sql = "UPDATE pizzas SET 
      first_name = '#{ @first_name }', 
      last_name = '#{ @last_name }', 
      topping = '#{ @topping }', 
      quantity = #{ @quantity }
      WHERE id = #{ @id }"
      db.exec(sql)
      db.close
  end

end

















