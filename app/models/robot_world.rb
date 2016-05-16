require 'pry'
# RobotWorld model interacting with database
class RobotWorld
  attr_reader :database, :robots

  def initialize(database)
    @database = database
    @robots = all
  end

  def table
    database.from(:robots).order(:id)
  end

  def create(robot)
    table.insert( :name       => robot[:name],
                  :city       => robot[:city],
                  :state      => robot[:state],
                  :avatar     => robot[:avatar],
                  :birthday   => robot[:birthday],
                  :date_hired => robot[:date_hired],
                  :department => robot[:department])
  end

  def raw_robot(id)
    table.where(:id => id).to_a.first
  end

  def all
    table.to_a.map { |bot| Robot.new(bot) }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    locate_robot(id).update(robot)
  end

  def average_age
    total = 0
    robots.each do |robot|
      total += robot.robot_age
    end
    total/(robots.count)
  end

  def year_hired_all
    array = robots.map do |robot|
      robot.hire_year
    end
    how_many_of_each(array)
  end

  def department_all
    array = robots.map do |robot|
      robot.department
    end
    how_many_of_each(array)
  end

  def city_all
    array = robots.map do |robot|
      robot.city
    end
    how_many_of_each(array)
  end

  def state_all
    array = robots.map do |robot|
      robot.state
    end
    how_many_of_each(array)
  end

  def how_many_of_each(array)
    hash = {}
    array.each do |item|
      if hash.has_key?(item)
        hash[item] = (hash[item] + 1)
      else
        hash[item] = 1
      end
    end
    hash
  end

  def destroy(id)
    locate_robot(id).delete
  end

  def locate_robot(id)
    table.where(:id => id)
  end

  def delete_all
    table.delete
  end
end
