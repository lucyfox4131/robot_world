require_relative '../test_helper'

class UserCanAddANewRobotTest < FeatureTest

  def test_user_sees_correct_links_on_dashboard
    visit '/'

    assert page.has_content? "Welcome to Robot World"
    assert page.has_content? "Robot World"
    assert page.has_content? "New Robot"
  end
end
