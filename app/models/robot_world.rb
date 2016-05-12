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
    table.insert( :name => robot[:name],
                  :city => robot[:city],
                  :state => robot[:state],
                  :avatar => robot[:avatar],
                  :birthday => robot[:birthday],
                  :date_hired => robot[:date_hired],
                  :department => robot[:department])
  end

  def raw_robot(id)
    table.where(:id => id).to_a.first
  end

  def all
    raw_robots.map { |bot| Robot.new(bot) }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    database.transaction do
      edit_robot = database['robots'].find { |bot| bot['id'] == id }
      edit_robot['name'] = robot[:name]
      edit_robot['city'] = robot[:city]
      edit_robot['state'] = robot[:state]
      edit_robot['avatar'] = robot[:avatar]
      edit_robot['birthday'] = robot[:birthday]
      edit_robot['date_hired'] = robot[:date_hired]
      edit_robot['department'] = robot[:department]
    end
  end

  def destroy(id)
    database.transaction do
      database['robots'].delete_if { |robot| robot['id'] == id }
    end
  end

  def delete_all
    table.delete
  end
end
