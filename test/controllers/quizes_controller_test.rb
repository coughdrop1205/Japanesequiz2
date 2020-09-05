require 'test_helper'

class QuizesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get quizes_show_url
    assert_response :success
  end

end
