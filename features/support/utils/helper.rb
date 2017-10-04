# This utility class will store data to be reused in the Step definitions.
class Helper
  def self.initialize
    @responses = {}
  end

  def self.clear_responses
    @responses.clear
  end

  def self.add_response(type, body)
    @responses.store(type, JSON.parse(body))
  end

  def self.content_from_response(type)
    @responses[type]
  end

  def self.field_from_response(type, field)
    @responses[type][field]
  end
end
