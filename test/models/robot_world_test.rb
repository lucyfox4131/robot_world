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
    robot_id_1 = robot_world.create(name: "name1", city: "city1", state: "state1", avatar: "avatar1",
    birthday: "birthday1", date_hired: "date_hired1", department: "department1")
    robot_id_2 = robot_world.create(name: "name2", city: "city2", state: "state2", avatar: "avatar2",
    birthday: "birthday2", date_hired: "date_hired2", department: "department2")
    robot_1 = robot_world.find(robot_id_1)
    robot_2 = robot_world.find(robot_id_2)
    robots = robot_world.all
    assert_equal 2, robots.length
    assert_equal "name1", robot_1.name
    assert_equal "name2", robot_2.name
  end

  def test_it_can_find_a_robot
    robot_id = robot_world.create(name: "name1", city: "city1", state: "state1", avatar: "avatar1",
                        birthday: "birthday1", date_hired: "date_hired1", department: "department1")
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

  def test_it_can_update_a_robot
    robot_id = robot_world.create(name: "name1", city: "city1", state: "state1", avatar: "avatar1",
                        birthday: "birthday1", date_hired: "date_hired1", department: "department1")
    robot_world.update(robot_id, name: "update", city: "update_city", state: "update_state", avatar: "update_avatar",
                        birthday: "update_birthday", date_hired: "update_date_hired", department: "update_department")
    robot = robot_world.find(robot_id)
    assert_equal robot_id, robot.id
    assert_equal 'update', robot.name
    assert_equal 'update_city', robot.city
    assert_equal 'update_state', robot.state
    assert_equal 'update_avatar', robot.avatar
    assert_equal 'update_birthday', robot.birthday
    assert_equal 'update_date_hired', robot.date_hired
    assert_equal 'update_department', robot.department
  end

  def test_it_can_destroy_task
    robot_id = robot_world.create(name: "name1", city: "city1", state: "state1", avatar: "avatar1",
                        birthday: "birthday1", date_hired: "date_hired1", department: "department1")
    assert_equal 1, robot_world.all.length
    robot_world.destroy(robot_id)
    robots = robot_world.all
    assert_equal 0, robots.length
  end
end
