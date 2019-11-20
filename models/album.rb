require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @genre = details['genre']
    @artist_id = details['artist_id'].to_i()
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

  def Album.find_by_id(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return nil if result.count == 0
    album = result[0]
    return Album.new(album)
  end

  def Album.list_all
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return result.map {|album| Album.new(album)}
  end


#
end
