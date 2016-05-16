require_relative '../test_helper'

class UserCanAddANewRobotTest < FeatureTest

  def test_user_creates_robot
    visit '/'
    within(:dashboard, ".jumbotron") {
      assert page.has_content? 'New Robot'
    }

    # visit '/robots/new'

    # assert page.has_content? 'Enter a new robot:'


    #
    # assert_equal '/robots/new', current_path
    #
    # fill_in 'robot[name]', with: 'name'
    # fill_in 'robot[city]', with: 'city'
    # fill_in 'robot[state]', with: 'state'
    # fill_in 'robot[avatar]', with: 'avatar'
    # # page.execute_script("$("birthday").val('21/12/1980')")
    # # page.execute_script("$("date_hired").val('08/08/2009')")
    # fill_in 'robot[department]', with: 'department'
    #
    # click_button 'CREATE ROBOT'
    #
    # assert page.has_content? 'name'



  end
end
