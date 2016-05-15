require_relative '../test_helper'

class UserCanEditARobotTest < FeatureTest

  def test_user_edits_robot
    robot_id_1 = robot_world.create(name: "name1", city: "city1", state: "state1", avatar: "avatar1",
    birthday: "birthday1", date_hired: "date_hired1", department: "department1")

    visit '/robots'
    click_link 'EDIT'

    assert_equal "/robots/#{robot_id_1}/edit", current_path

    fill_in 'robot[name]', with: 'name'
    fill_in 'robot[city]', with: 'city'
    fill_in 'robot[state]', with: 'state'
    fill_in 'robot[avatar]', with: 'avatar'
    fill_in 'robot[birthday]', with: 'birthday'
    fill_in 'robot[date_hired]', with: 'date_hired'
    fill_in 'robot[department]', with: 'department'

    click_button 'SUBMIT CHANGES'

    assert page.has_content? 'name'
    assert page.has_content? 'city'
    assert page.has_content? 'state'
    assert page.has_content? 'birthday'
    assert page.has_content? 'date_hired'
    assert page.has_content? 'department'
  end
end
