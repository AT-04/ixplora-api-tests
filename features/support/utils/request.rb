require 'json'

# Request class that abstracts the properties and fields of a API Request.
class Request
  attr_reader :method, :header, :endpoint, :body

  def initialize(method)
    @method = method
    @body = {}
    @header = { :'Content-type' => 'application/json' }
  end

  def add_authorization(token)
    @header['Authorization'] = "Bearer #{token}"
  end

  def add_body(content)
    @body = JSON.parse(content)
  end

  def append_endpoint(endpoint)
    @endpoint = CommonActions.built_endpoint("#{$server_base_endpoint}#{endpoint}")
  end
end
