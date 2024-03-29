require_relative('../db/sql_runner')
require_relative('./house.rb')

class Student

  attr_accessor :age, :first_name, :last_name, :house_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      house_id,
      age
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @house_id, @age]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE students
    SET
    (
      first_name,
      last_name,
      house_id,
      age
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @house_id, @age, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM students
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM students"
    student_data = SqlRunner.run(sql)
    students = map_items(student_data)
    return students
  end

  def self.map_items(student_data)
    return student_data.map { |student| Student.new(student) }
  end

  def self.find(id)
    sql = "SELECT * FROM students
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    student = Student.new(result)
    return student
  end

  def format_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
  def house()
    sql ="select * from houses where id = $1"
    values=[@house_id]
      student_house_name= SqlRunner.run(sql, values)
       return House.new(student_house_name.first)
  end
  # def get_housename()
  #   sql = " SELECT houses.name from houses inner join students on  houses.id = students.house_id where students.id = $1"
  #   values(@id)
  #   student_house_name= SqlRunner.run(sql, values).first()
  #   house_name = student_house_name["name"]
  #   return house_name
  # end


end
