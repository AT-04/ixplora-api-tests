# This utility class will store data to be reused in the Step definitions.
class Helper
  def self.initialize
    @responses = {}
  end

  def self.clear_responses
    @responses.clear
  end

  def self.add_data(type, body)
    @responses.store(type, body)
  end

  def self.get_stored_value(type)
    @responses[type]
  end

  def self.get_stored_field(type, field)
    @responses[type][field]
  end
end
