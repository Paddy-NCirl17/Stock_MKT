require 'test_helper'

class InvalidNewUserWorkflowTest < ActionDispatch::IntegrationTest
	fixtures :all

	test 'try to create a new user without a login' do
		@user = users(:one)
		get '/users/sign_in'
		assert_response :success	
	end
end