require_relative('../db/sql_runner.rb')
require_relative('album.rb')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end





#
end
