require ('pg') #acquire PostGres
require_relative ('../db/sql_runner')

class Artist

  attr_reader :id, :name

  def initialize ( options )
    @id = options['id'].to_i
    @name = options['name']
    # @album_id = options['album_id'].to_i
  end

  #CRUD methods below

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING * ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * from artists;"
    bands = SqlRunner.run(sql)
    return bands.map { |band| Artist.new(band) }
  end

  def albums() 
    sql = "SELECT * FROM albums where artist_id = #{@id};"
    results = SqlRunner.run(sql)
    cds = results.map { |cd| Album.new(cd)}
    return cds
  end


#EXTENSION

  def update() #???
    sql = "UPDATE artists SET (name) VALUES ('#{@name}') WHERE id = #{@id};"
    SqlRunner.run(sql) 
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql) 
  end

  def self.find(id) 
    sql = "SELECT * FROM artists where id = #{id};"
    results = SqlRunner.run(sql)
    artist_hash = results.first
    result = Artist.new(artist_hash)
    return result
  end

end