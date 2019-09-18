require_relative('../db/sql_runner')

class House

  attr_accessor :name, :url
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @url = options['url']

  end
  def save()
    sql = "INSERT INTO houses
    (
      name,
      url
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @url]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end
  

  # def update()
  #   sql = "UPDATE houses
  #   SET
  #   (
  #     name,
  #     url
  #   ) =
  #   (
  #     $1, $2
  #   )
  #   WHERE id = $3"
  #   values = [@name, @url ,@id]
  #   SqlRunner.run(sql, values)
  # end
  #
  # def delete()
  #   sql = "DELETE FROM houses
  #   WHERE id = $1"
  #   values = [@id]
  #   SqlRunner.run(sql, values)
  # end
  #
  def self.all()
    sql = "SELECT * FROM houses"
    house_data = SqlRunner.run(sql)
    houses = map_items(house_data)
    return houses
  end
  #
  # def self.map_items(house_data)
  #   return house_data.map { |house| House.new(house) }
  # end
  #
  def self.find(id)
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    house= House.new(result)
    return house
  end
  #

end
