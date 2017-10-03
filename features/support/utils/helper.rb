require 'singleton'

# This utility class will store data to be reused in the Step definitions.
class Helper
  include Singleton

  attr_reader :user, :survey

  def store_user_response(response)
    @user = JSON.parse(response)
  end

  def store_survey_response(response)
    @survey = JSON.parse(response)
  end
end
