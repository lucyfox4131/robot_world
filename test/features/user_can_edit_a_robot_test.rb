require_relative '../test_helper'

class UserCanEditARobotTest < FeatureTest

  def test_user_edits_robot
    visit '/robots'

    click_button 'Edit'

    assert_equal '/robot/:id/new', current_path

    # fill_in 'robot[name]', with: 'name'
    # fill_in 'robot[city]', with: 'city'
    # fill_in 'robot[state]', with: 'state'
    # fill_in 'robot[avatar]', with: 'avatar'
    # fill_in 'robot[birthday]', with: 'birthday'
    # fill_in 'robot[date_hired]', with: 'date_hired'
    # fill_in 'robot[department]', with: 'department'
    #
    # click_button 'Create Robot'
    #
    # assert page.has_content? 'name'
    # assert page.has_content? 'city'
    # assert page.has_content? 'state'
    # assert page.has_content? 'birthday'
    # assert page.has_content? 'date_hired'
    # assert page.has_content? 'department'
  end
end
