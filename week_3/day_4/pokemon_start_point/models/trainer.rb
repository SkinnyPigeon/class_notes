require( 'pg' )
require_relative('../db/sql_runner')

class Trainer

  attr_reader( :id, :name )

  def initialize( options, runner )
    @id = options['id'].to_i
    @name = options['name']
    @runner = runner
  end

  def save()
    sql = "INSERT INTO trainers (name) VALUES ('#{ @name }') RETURNING *"
    trainer = @runner.run( sql )
    return Trainer.new(trainer, @runner)
  end

  def self.all(runner)
    sql = "SELECT * FROM trainers"
    trainers = runner.run( sql )
    result = trainers.map { |trainer| Trainer.new( trainer ) }
    return result
  end

  def self.delete_all(runner)
    sql = "DELETE FROM trainers"
    runner.run(sql)
  end


end