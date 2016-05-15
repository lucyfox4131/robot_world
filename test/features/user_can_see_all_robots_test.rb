require_relative '../test_helper'

class UserCanSeeAllRobotsTest < FeatureTest
  def test_user_sees_all_robots
    robot_id_1 = robot_world.create(name: "name1", city: "city1", state: "state1", avatar: "avatar1",
    birthday: "birthday1", date_hired: "date_hired1", department: "department1")
    robot_id_2 = robot_world.create(name: "name2", city: "city2", state: "state2", avatar: "avatar2",
    birthday: "birthday2", date_hired: "date_hired2", department: "department2")

    visit '/robots'

    assert page.has_content?("#{robot_id_1}: name1")
    assert page.has_content?("#{robot_id_2}: name2")
  end
end
