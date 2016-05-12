ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
# require 'minitest/emoji'
require 'tilt/erb'
require 'capybara/dsl'

module TestHelpers
  def teardown
    robot_world.delete_all
    super
  end

  def create_robots(num)
    num.times do |i|
      i += 1
      robot_world.create(name: "name#{i}", city: "city#{i}", state: "state#{i}", avatar: "avatar#{i}",
                          birthday: "birthday#{i}", date_hired: "date_hired#{i}", department: "department#{i}")
    end
  end

  def robot_world
    database = Sequel.postgres('robot_world_test')
    @robot_world ||= RobotWorld.new(database)
  end
end

Capybara.app = RobotWorldApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
