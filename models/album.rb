require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @genre = details['genre']
  end

  def save()
    sql = "INSERT INTO albums (title, genre) VALUES ($1, $2) RETURNING id;"
    values = [@title, @genre]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Album.delete_all()
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end

  def Album.find_by_id
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@id]
    result = SqlRunner.run( sql, values)
    return Album.new(result)
  end

end
