require_relative '../test_helper'

class RobotTest < Minitest::Test
  attr_reader :robot
  def setup
    @robot = Robot.new( :id          => 1,
                        :name        => 'Raj',
                        :city        => 'Dusseldorf',
                        :state       => 'Colorado',
                        :avatar      => 'Blue',
                        :birthday    => '30/05/2000',
                        :date_hired  => '08/08/08',
                        :department  => 'Sales')
  end

  def test_it_creates_robot_data_correctly
    assert_equal 1, robot.id
    assert_equal 'Raj', robot.name
    assert_equal 'Dusseldorf', robot.city
    assert_equal 'Colorado', robot.state
    assert_equal 'Blue', robot.avatar
    #date as 'DD/MM/YYYY'
    assert_equal '30/05/2000', robot.birthday
    assert_equal '08/08/08', robot.date_hired
    assert_equal 'Sales', robot.department
  end

  def test_it_can_find_robot_age
    assert_equal 15, robot.robot_age
  end

end
