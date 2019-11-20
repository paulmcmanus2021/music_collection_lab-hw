require_relative('../db/sql_runner.rb')
require_relative('album.rb')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details ['id']
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def Artist.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end

  def Artist.find_by_id(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run( sql, values)
    return nil if result.count == 0
    artist = result[0]
    return Artist.new(artist)
  end

  def Artist.list_all
    sql = "SELECT * FROM artists"
    result = SqlRunner.run(sql)
    return result.map {|artist| Artist.new(artist)}
  end


#Returns an empty array indicating nil/0 value for artist_id/@id
  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map {|album| Album.new(album)}
  end




#
end
