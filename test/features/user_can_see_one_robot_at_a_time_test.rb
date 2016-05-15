require_relative '../test_helper'

class UserCanSeeOneRobotAtATimeTest < FeatureTest
  def test_user_sees_one_robot
    robot_id_1 = robot_world.create(name: "name1", city: "city1", state: "state1", avatar: "avatar1",
    birthday: "birthday1", date_hired: "date_hired1", department: "department1")

    visit '/robots'
    click_link 'name1'

    assert page.has_content?("name1")
    assert page.has_content?("city1")
    assert page.has_content?("state1")
    assert page.has_content?("birthday1")
    assert page.has_content?("date_hired1")
    assert page.has_content?("department")
  end
end
