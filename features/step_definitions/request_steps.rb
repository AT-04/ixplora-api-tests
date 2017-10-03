Given(/^I perform "(GET|POST|PUT|DELETE)" request to "(.*)"$/) do |method, endpoint|
  @request = Request.new(method)
  @request.append_endpoint(endpoint)
end

When(/^I set the following body:$/) do |data|
  @request.add_body(data)
end

And(/^I send the request$/) do
  @response = RequestManager.request(@request)
end

Then(/^I expect a "(\d+)" status code$/) do |code|
  expect(@response.code).to eql(code)
end
