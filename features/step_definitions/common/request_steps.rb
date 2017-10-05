Given(/^I perform "(GET|POST|PUT|DELETE)" request to "(.*)"$/) do |method, endpoint|
  @request = APIRequest.new(method)
  @request.append_endpoint(endpoint)
end

When(/^I set the following "([^"]*)" body$/) do |request_name, content|
  Helper.add_data(request_name, JSON.parse(content))
  @request.add_body(content)

end

When(/^I set the following custom body:$/) do |table|
  data = table.rows_hash
  data = CommonActions.built_json(data)
  @request.add_body(data.to_json)
end

And(/^I send the request$/) do
  @response = RequestManager.request(@request)
end

Then(/^I expect a "(\d+)" status code$/) do |code|
  expect(@response.code).to eql(code)
end

And(/^I store the "([^"]*)" response body$/) do |type|
  Helper.add_data(type, JSON.parse(@response.body))
end

And(/^I set the Authorization token "(.*)"$/) do |param|
  @request.add_authorization(CommonActions.built_data(param))
end
