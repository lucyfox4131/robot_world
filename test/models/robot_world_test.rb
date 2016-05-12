require_relative '../test_helper'

# Robot World Test
class RobotWorldTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    robot_id = robot_world.create(:name => "name1", :city => "city1", :state => "state1", :avatar => "avatar1",
                        :birthday => "birthday1", :date_hired => "date_hired1", :department => "department1")
    robot = robot_world.find(robot_id)
    assert_equal 'name1', robot.name
    assert_equal 'city1', robot.city
    assert_equal 'state1', robot.state
    assert_equal 'avatar1', robot.avatar
    assert_equal 'birthday1', robot.birthday
    assert_equal 'date_hired1', robot.date_hired
    assert_equal 'department1', robot.department
    assert_equal robot_id, robot.id
  end

  def test_it_returns_all_robots
    create_robots(2)
    robots = robot_world.all
    assert_equal 2, robots.length
  end

  def test_it_can_find_a_robot
    robot_world.create(name: "name1", city: "city1", state: "state1", avatar: "avatar1",
                        birthday: "birthday1", date_hired: "date_hired1", department: "department1")
    robot = robot_world.find(1)
    assert_equal 'name1', robot.name
    assert_equal 'city1', robot.city
    assert_equal 'state1', robot.state
    assert_equal 'avatar1', robot.avatar
    assert_equal 'birthday1', robot.birthday
    assert_equal 'date_hired1', robot.date_hired
    assert_equal 'department1', robot.department
    assert_equal 1, robot.id
  end

  def test_it_can_update_a_robot
    create_robots(2)
    robot_world.update(2, name: "update", city: "update_city", state: "update_state", avatar: "update_avatar",
                        birthday: "update_birthday", date_hired: "update_date_hired", department: "update_department")
    robot = robot_world.find(2)
    assert_equal 2, robot.id
    assert_equal 'update', robot.name
    assert_equal 'update_city', robot.city
    assert_equal 'update_state', robot.state
    assert_equal 'update_avatar', robot.avatar
    assert_equal 'update_birthday', robot.birthday
    assert_equal 'update_date_hired', robot.date_hired
    assert_equal 'update_department', robot.department
  end

  def test_it_can_destroy_task
    create_robots(2)
    assert_equal 2, robot_world.all.length
    robot_world.destroy(1)
    robots = robot_world.all
    assert_equal 1, robots.length
  end
end
