require 'json'

# Request class that abstracts the properties and fields of a API Request.
class Request
  attr_reader :method, :header, :endpoint
  attr_accessor :body

  def initialize(method:, endpoint:, token: '', body: '')
    @method = method
    @body = body.to_json
    @header = { :'Content-type' => 'application/json' }
    @header['Authorization'] = "Bearer #{token}" unless token.strip.empty?
    @endpoint = "#{$server_host}:#{$server_port}#{$server_extension}#{$server_version}#{endpoint}"
  end
end
