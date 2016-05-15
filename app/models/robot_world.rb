require 'pry'
# RobotWorld model interacting with database
class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
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
