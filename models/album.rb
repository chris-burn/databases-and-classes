require ('pg') # acquire PostGres
require_relative ('../db/sql_runner')

class Album

  attr_accessor :id, :title, :genre, :artist_id

  def initialize (options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

#CRUD methods below

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', '#{@artist_id}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all() 
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

  def artists() 
    sql = "SELECT * FROM artists where id = #{@artist_id};"
    results = SqlRunner.run(sql)
    artist_data = results[0] 
    artist = Artist.new(artist_data)
    return artist
  end
  

# EXTENSION

  def update() #???
    sql = "UPDATE albums SET (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', '#{@artist_id}') WHERE id = #{@id};"
    SqlRunner.run(sql) 
  end


  def self.delete_all() 
    sql = "DELETE FROM albums;"
    SqlRunner.run(sql)
  end


  def self.find(id) 
    sql = "SELECT * FROM albums WHERE id = #{id};"
    results = SqlRunner.run(sql)
    album_hash = results.first
    result = Album.new(album_hash)
    return result
  end

end